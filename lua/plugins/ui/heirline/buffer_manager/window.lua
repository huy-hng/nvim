local popup = require('plenary.popup')
local utils = require('plugins.ui.heirline.buffer_manager.utils')
local buffer_manager = require('plugins.ui.heirline.buffer_manager')

local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')
local navigator = require('plugins.ui.heirline.buffer_manager.navigation')
local config = buffer_manager.get_config()

local M = {}

M.win_id = nil
M.win_bufnr = nil

-- We save before we close because we use the state of the buffer as the list of items.
local function close_menu(force_save)
	force_save = force_save or false

	vim.api.nvim_win_close(M.win_id, true)

	M.win_id = nil
	M.win_bufnr = nil
end

local function create_window()
	local width = config.width or 60
	local height = config.height or 10

	if width <= 1 then width = math.floor(vim.o.columns * config.width) end

	if height <= 1 then height = math.floor(vim.o.lines * config.height) end

	local borderchars = config.borderchars
		or { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
	local bufnr = vim.api.nvim_create_buf(false, false)

	local win_config = {
		title = 'Buffers',
		line = math.floor(((vim.o.lines - height) / 2) - 1),
		col = math.floor((vim.o.columns - width) / 2),
		minwidth = width,
		minheight = height,
		borderchars = borderchars,
	}
	if config.highlight ~= '' then win_config['highlight'] = config.highlight end
	local Buffer_manager_win_id, win = popup.create(bufnr, win_config)

	if config.highlight ~= '' then
		vim.api.nvim_win_set_option(
			win.border.win_id,
			'winhl',
			config.highlight .. ':' .. config.highlight
		)
	end

	return {
		bufnr = bufnr,
		win_id = Buffer_manager_win_id,
	}
end

function M.select_menu_item(command)
	local idx = vim.fn.line('.')
	if vim.api.nvim_buf_get_changedtick(M.win_bufnr) > 0 then --
		list_manager.on_menu_save()
	end
	close_menu(true)
	navigator.nav_file(idx, command)
	list_manager.update_buffers()
end

local function set_buf_keybindings()
	local opts = { buffer = M.win_bufnr }
	local nmap = Map.create('n', '', '[Buffer Manager]', opts)

	nmap('q', M.close_menu, 'Close Menu')
	nmap('<ESC>', M.close_menu, 'Close Menu')

	for _, value in pairs(config.select_menu_item_commands) do
		nmap(value.key, { M.select_menu_item, value.command }, '')
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
		Autocmd('BufModifiedSet', nil, function() vim.bo.modified = false end, {
			buffer = M.win_bufnr,
		}),
		Autocmd('BufWriteCmd', nil, list_manager.on_menu_save, {
			buffer = M.win_bufnr,
		}),
		Autocmd('BufLeave', nil, M.close_menu, {
			buffer = M.win_bufnr,
			nested = true,
			once = true,
		}),
	})
end

local function set_buf_options()
	vim.api.nvim_buf_set_name(M.win_bufnr, 'buffer_manager-menu')
	vim.api.nvim_win_set_option(M.win_id, 'number', true)
	vim.api.nvim_buf_set_option(M.win_bufnr, 'filetype', 'buffer_manager')
	vim.api.nvim_buf_set_option(M.win_bufnr, 'buftype', 'acwrite')
	vim.api.nvim_buf_set_option(M.win_bufnr, 'bufhidden', 'delete')
end

local function set_buf_lines(contents, current_buf_line)
	local undolevels = vim.api.nvim_buf_get_option(M.win_bufnr, 'undolevels')
	vim.api.nvim_buf_set_option(M.win_bufnr, 'undolevels', -1)
	vim.api.nvim_buf_set_lines(M.win_bufnr, 0, #contents, false, contents)
	-- vim.cmd(string.format(':call cursor(%d, %d)', current_buf_line, 1))
	vim.fn.cursor { current_buf_line, 1 }
	vim.api.nvim_buf_set_option(M.win_bufnr, 'undolevels', undolevels)
end

function M.close_menu()
	if M.win_id == nil or not vim.api.nvim_win_is_valid(M.win_id) then return end

	if vim.api.nvim_buf_get_changedtick(M.win_bufnr) > 0 then list_manager.on_menu_save() end
	close_menu(true)
	list_manager.update_buffers()
end

function M.open_menu()
	local current_buf = vim.api.nvim_get_current_buf()
	---@diagnostic disable-next-line: param-type-mismatch
	current_buf = config.focus_alternate_buffer and vim.fn.bufnr('#') or current_buf

	local win_info = create_window()
	local contents = {}
	list_manager.initial_marks = {}

	M.win_id = win_info.win_id
	M.win_bufnr = win_info.bufnr

	list_manager.update_marks()

	-- set initial_marks
	local current_buf_line = 1
	local line = 1
	for i, mark in ipairs(list_manager.marks) do
		-- Add buffer only if it does not already exist
		if vim.fn.buflisted(mark.bufnr) ~= 1 then
			list_manager.marks[i] = nil
		else
			list_manager.initial_marks[i] = {
				filename = mark.filename,
				bufnr = mark.bufnr,
			}
			if mark.bufnr == current_buf then current_buf_line = line end
			local display_filename = mark.filename
			if not utils.string_starts(display_filename, 'term://') then
				if config.short_file_names then
					display_filename = utils.get_short_file_name(display_filename)
					-- display_filename = utils.get_relative_file_name(display_filename)
				else
					display_filename = utils.normalize_path(display_filename)
				end
			else
				if config.short_term_names then
					display_filename = utils.get_short_term_name(display_filename)
				end
			end

			contents[line] = string.format('%s', display_filename)
			line = line + 1
		end
	end

	set_buf_options()
	set_buf_keybindings()
	set_buf_autocmds()
	set_buf_lines(contents, current_buf_line)
end

function M.toggle_quick_menu()
	if M.win_id ~= nil and vim.api.nvim_win_is_valid(M.win_id) then
		M.close_menu()
		return
	end
	M.open_menu()
end

return M
