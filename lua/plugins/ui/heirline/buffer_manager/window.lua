local popup = require('plenary.popup')
local filename = require('plugins.ui.heirline.buffer_manager.filename')
local utils = require('plugins.ui.heirline.buffer_manager.utils')

local extmark = require('plugins.ui.heirline.buffer_manager.extmark')
local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')
local navigator = require('plugins.ui.heirline.buffer_manager.navigation')
local config = require('plugins.ui.heirline.buffer_manager.config').config

-- local Object = require('nui.object')

local M = {}

M.win_id = nil
M.bufnr = nil

local function get_display_filename(mark)
	if string.starts(mark.filename, 'term://') then
		if config.short_file_names then --
			return filename.get_short_term_name(mark.filename)
		end
		return mark.filename
	end

	if config.short_file_names then return filename.get_short_file_name(mark.filename) end

	return filename.normalize_path(mark.filename)
end

local function create_buffer_content(current_buf)
	---@diagnostic disable-next-line: param-type-mismatch
	current_buf = config.focus_alternate_buffer and vim.fn.bufnr('#') or current_buf

	local contents = {}
	local current_buf_line
	local line = 1
	for i, mark in ipairs(list_manager.marks) do
		-- Add buffer only if it does not already exist
		if vim.fn.buflisted(mark.bufnr) ~= 1 then
			list_manager.marks[i] = nil
			goto continue
		end
		list_manager.initial_marks[i] = {
			filename = mark.filename,
			bufnr = mark.bufnr,
		}
		if mark.bufnr == current_buf then current_buf_line = line end

		contents[line] = string.format('%s', mark.filename)
		line = line + 1

		::continue::
	end
	return contents, current_buf_line
end

local function set_buf_lines(contents, current_buf_line, allow_undo)
	local undolevels = vim.api.nvim_buf_get_option(M.bufnr, 'undolevels')
	if not allow_undo then vim.api.nvim_buf_set_option(M.bufnr, 'undolevels', -1) end
	vim.api.nvim_buf_set_lines(M.bufnr, 0, #contents, false, contents)
	if current_buf_line then vim.fn.cursor { current_buf_line, 1 } end

	if not allow_undo then vim.api.nvim_buf_set_option(M.bufnr, 'undolevels', undolevels) end
end

local function update_extmarks(lines)
	lines = lines or M.get_buffer_lines()
	extmark.remove_extmarks(M.bufnr)
	local prev_path
	for i, file in ipairs(lines) do
		local path, _ = filename.get_path_folders(file, 0)
		local path_string = string.join(path)

		local extra_opts = {}
		local separator_line = { { vim.fn['repeat']('─', config.width) } }
		if path_string ~= prev_path then
			local virt_line = filename.get_extmark_path(path)
			table.insert(virt_line, 1, { '  ' })

			extra_opts.virt_lines = { virt_line }
			if prev_path then table.insert(extra_opts.virt_lines, 1, separator_line) end
		end

		extmark.set_extmark(M.bufnr, i - 1, 0, filename.get_extmark_name(file), extra_opts)
		prev_path = path_string
	end
end

local function set_buffer_content(current_buf, allow_undo)
	local contents, current_buf_line = create_buffer_content(current_buf)
	set_buf_lines(contents, current_buf_line, allow_undo)
	update_extmarks(contents)
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
			update_extmarks()
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
		Autocmd('InsertLeave', nil, function() update_extmarks() end, { buffer = M.bufnr }),
		Autocmd('InsertEnter', nil, function()
			local current_line = vim.fn.line('.')
			extmark.remove_extmarks(M.bufnr, current_line - 1, current_line)
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

	local bufnr = require('plugins.ui.heirline.buffer_manager.window').bufnr
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)
	local items = {}

	-- TODO: copy whitespace as well for organizing buffers
	-- or instead use virtual text to space them out
	-- also possible to separate buffers by their folders for example
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
