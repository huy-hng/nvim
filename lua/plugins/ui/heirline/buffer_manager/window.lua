local popup = require('plenary.popup')
local utils = require('plugins.ui.heirline.buffer_manager.utils')

local buffer_content = require('plugins.ui.heirline.buffer_manager.buffer_content')
local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')
local navigator = require('plugins.ui.heirline.buffer_manager.navigation')
local config = require('plugins.ui.heirline.buffer_manager.config').config

-- local Object = require('nui.object')

local M = {}

M.win_id = nil
M.bufnr = nil

local function set_buf_lines(contents, current_buf_line, allow_undo)
	local undolevels = vim.api.nvim_buf_get_option(M.bufnr, 'undolevels')
	if not allow_undo then vim.api.nvim_buf_set_option(M.bufnr, 'undolevels', -1) end
	vim.api.nvim_buf_set_lines(M.bufnr, 0, #contents, false, contents)
	if current_buf_line then vim.fn.cursor { current_buf_line, 1 } end

	if not allow_undo then vim.api.nvim_buf_set_option(M.bufnr, 'undolevels', undolevels) end
end

local function set_buffer_content(current_buf, allow_undo)
	local contents, current_buf_line = buffer_content.create_buffer_content(current_buf)
	set_buf_lines(contents, current_buf_line, allow_undo)
	buffer_content.update_extmarks(M.bufnr, contents)
end

local function create_window()
	local width = config.width
	local height = config.height

	if width <= 1 then width = math.floor(vim.o.columns * config.width) end
	if height <= 1 then height = math.floor(vim.o.lines * config.height) end
	local bufnr = vim.api.nvim_create_buf(false, false)

	local win_config = {
		title = 'Buffer Manager',
		line = math.floor(((vim.o.lines - height) / 2) - 1),
		col = math.floor((vim.o.columns - width) / 2),
		minwidth = width,
		minheight = height,
		borderchars = config.borderchars,
	}
	if config.highlight ~= '' then win_config['highlight'] = config.highlight end
	local win_id, win = popup.create(bufnr, win_config)

	if config.highlight ~= '' then
		vim.api.nvim_win_set_option(
			win.border.win_id,
			'winhl',
			config.highlight .. ':' .. config.highlight
		)
	end

	return { bufnr = bufnr, win_id = win_id }
end

local function select_menu_item(command)
	local idx = vim.fn.line('.')
	if vim.api.nvim_buf_get_changedtick(M.bufnr) > 0 then --
		list_manager.update_marks_list()
	end
	M.close_menu()
	navigator.nav_file(idx, command)
	list_manager.update_buffers()
end

local function set_buf_keybindings()
	local opts = { buffer = M.bufnr }
	local nmap = Map.create('n', '', '[Buffer Manager]', opts)

	nmap('q', M.close_menu, 'Close Menu')
	nmap('<ESC>', M.close_menu, 'Close Menu')

	local sorting_functions = config.sorting.functions
	for name, sort in pairs(sorting_functions) do
		nmap(sort.key, function()
			list_manager.sort_marks(name)
			set_buffer_content(nil, true)
		end, 'Sort Marks by ' .. name)
	end

	for command, key in pairs(config.select_menu_item_commands) do
		nmap(key, { select_menu_item, command }, 'Go to buffer in line')
	end

	-- Go to file hitting its line number
	local str = config.line_keys
	for i = 1, #str do
		local lhs = str:sub(i, i)
		nmap(lhs, { navigator.nav_file, i }, '')
	end
end

local function set_buf_autocmds()
	Augroup('BufferManager', {
		Autocmd('BufWriteCmd', nil, list_manager.update_marks_list, { buffer = M.bufnr }),
		Autocmd('BufModifiedSet', nil, function()
			-- update extmarks when line is moved
			local lines = M.get_buffer_lines()
			buffer_content.update_extmarks(M.bufnr, lines)
			vim.bo.modified = false
		end, { buffer = M.bufnr }),
		Autocmd('CursorMoved', nil, function()
			local cur_line = vim.fn.line('.')
			if cur_line == 1 or cur_line == 2 then nvim.feedkeys('<C-y>', false) end
		end, { buffer = M.bufnr }),
		Autocmd('BufLeave', nil, M.close_menu, {
			buffer = M.bufnr,
			nested = true,
			once = true,
		}),
		-- remove extmarks in current line when inserting
		-- TODO: same for visual mode
		Autocmd('InsertLeave', nil, function()
			local lines = M.get_buffer_lines()
			buffer_content.update_extmarks(M.bufnr, lines)
		end, { buffer = M.bufnr }),
		Autocmd('InsertEnter', nil, function()
			local current_line = vim.fn.line('.')
			buffer_content.remove_extmarks(M.bufnr, current_line - 1, current_line)
		end, { buffer = M.bufnr }),
	})
end

local function set_options()
	if config.cursorline then
		vim.api.nvim_win_set_option(M.win_id, 'cursorline', true)
		vim.api.nvim_win_set_option(M.win_id, 'cursorlineopt', 'both')
	end

	vim.api.nvim_buf_set_name(M.bufnr, 'buffer_manager-menu')

	vim.api.nvim_win_set_option(M.win_id, 'wrap', false)
	vim.api.nvim_win_set_option(M.win_id, 'number', true)

	vim.api.nvim_buf_set_option(M.bufnr, 'filetype', 'buffer_manager')
	vim.api.nvim_buf_set_option(M.bufnr, 'buftype', 'acwrite')
	vim.api.nvim_buf_set_option(M.bufnr, 'bufhidden', 'delete')
end

function M.get_buffer_lines()
	local function is_white_space(str) return str:gsub('%s', '') == '' end

	local lines = vim.api.nvim_buf_get_lines(M.bufnr, 0, -1, true)
	local items = {}

	for _, line in ipairs(lines) do
		if not is_white_space(line) then --
			table.insert(items, line)
		end
	end
	-- M.sort_marks('alphabet')

	return items
end

function M.close_menu()
	if M.win_id == nil or not vim.api.nvim_win_is_valid(M.win_id) then return end

	if vim.api.nvim_buf_get_changedtick(M.bufnr) > 0 then list_manager.update_marks_list() end

	vim.api.nvim_win_close(M.win_id, true)

	M.win_id = nil
	M.bufnr = nil
	list_manager.update_buffers()
	utils.show_cursor()
end

function M.open_menu()
	list_manager.initial_marks = {}
	list_manager.synchronize_marks()

	local current_buf = vim.api.nvim_get_current_buf()

	local win_info = create_window()
	M.win_id = win_info.win_id
	M.bufnr = win_info.bufnr

	set_buffer_content(current_buf)
	set_options()
	set_buf_keybindings()
	set_buf_autocmds()
	utils.hide_cursor()
end

function M.toggle_quick_menu()
	if M.win_id ~= nil then
		M.close_menu()
		return
	end
	M.open_menu()
end

return M
