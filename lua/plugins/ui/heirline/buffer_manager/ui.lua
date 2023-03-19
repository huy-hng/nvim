local Path = require('plenary.path')
local popup = require('plenary.popup')
local buffer_manager = require('plugins.ui.heirline.buffer_manager')
local utils = require('plugins.ui.heirline.buffer_manager.utils')

local M = {}

M.marks = {}

function M.get_ordered_bufids(vals)
	vals = vals or M.marks

	local bufs = {}
	for _, mark in ipairs(vals) do
		table.insert(bufs, mark.buf_id)
	end
	return bufs
end

function M.initialize_marks()
	local buffers = vim.api.nvim_list_bufs()

	for idx = 1, #buffers do
		local buf_id = buffers[idx]
		local buf_name = vim.api.nvim_buf_get_name(buf_id)
		local filename = buf_name
		-- if buffer is listed, then add to contents and M.marks
		if utils.buffer_is_valid(buf_id, buf_name) then
			table.insert(M.marks, {
				filename = filename,
				buf_id = buf_id,
			})
		end
	end
end

Buffer_manager_win_id = nil
Buffer_manager_bufh = nil
local initial_marks = {}
local config = buffer_manager.get_config()

-- We save before we close because we use the state of the buffer as the list
-- of items.
local function close_menu(force_save)
	force_save = force_save or false

	vim.api.nvim_win_close(Buffer_manager_win_id, true)

	Buffer_manager_win_id = nil
	Buffer_manager_bufh = nil
end

local function create_window()
	local width = 60
	local height = 10

	if config then
		if config.width ~= nil then
			if config.width <= 1 then
				local gwidth = vim.api.nvim_list_uis()[1].width
				width = math.floor(gwidth * config.width)
			else
				width = config.width
			end
		end

		if config.height ~= nil then
			if config.height <= 1 then
				local gheight = vim.api.nvim_list_uis()[1].height
				height = math.floor(gheight * config.height)
			else
				height = config.height
			end
		end
	end

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

local function string_starts(string, start) return string.sub(string, 1, string.len(start)) == start end

local function can_be_deleted(bufname, bufnr)
	return (
		vim.api.nvim_buf_is_valid(bufnr)
		and (not string_starts(bufname, 'term://'))
		and not vim.bo[bufnr].modified
		and bufnr ~= -1
	)
end

local function is_buffer_in_marks(bufnr)
	for _, mark in pairs(M.marks) do
		if mark.buf_id == bufnr then return true end
	end
	return false
end

local function get_mark_by_name(name, specific_marks)
	local ref_name = nil
	for _, mark in pairs(specific_marks) do
		ref_name = mark.filename
		if string_starts(mark.filename, 'term:') then
			if config.short_term_names then ref_name = utils.get_short_term_name(mark.filename) end
		else
			if config.short_file_names then ref_name = utils.get_short_file_name(mark.filename) end
		end
		if name == ref_name then return mark end
	end
	return nil
end

local function update_buffers()
	-- Check deletions
	for _, mark in pairs(initial_marks) do
		if not is_buffer_in_marks(mark.buf_id) then
			if can_be_deleted(mark.filename, mark.buf_id) then
				vim.api.nvim_buf_clear_namespace(mark.buf_id, -1, 1, -1)
				vim.cmd.Bdelete(mark.buf_id)
			end
		end
	end

	-- Check additions
	for idx, mark in pairs(M.marks) do
		local bufnr = vim.fn.bufnr(mark.filename)
		-- Add buffer only if it does not already exist
		if bufnr == -1 then
			vim.cmd('badd ' .. mark.filename)
			M.marks[idx].buf_id = vim.fn.bufnr(mark.filename)
		end
	end
end

local function remove_mark(idx)
	M.marks[idx] = nil
	if idx < #M.marks then
		for i = idx, #M.marks do
			M.marks[i] = M.marks[i + 1]
		end
	end
end

local function update_marks()
	-- Check if any buffer has been deleted
	-- If so, remove it from M.marks
	for idx, mark in pairs(M.marks) do
		if not utils.buffer_is_valid(mark.buf_id, mark.filename) then remove_mark(idx) end
	end
	-- Check if any buffer has been added
	-- If so, add it to M.marks
	for _, buf in pairs(vim.api.nvim_list_bufs()) do
		local bufname = vim.api.nvim_buf_get_name(buf)
		if utils.buffer_is_valid(buf, bufname) and not is_buffer_in_marks(buf) then
			table.insert(M.marks, {
				filename = bufname,
				buf_id = buf,
			})
		end
	end
end

local function set_menu_keybindings()
	Nmap('q', function() --
		require('plugins.ui.heirline.buffer_manager.ui').toggle_quick_menu()
	end, '', { buffer = Buffer_manager_bufh })

	Nmap('<ESC>', function() --
		require('plugins.ui.heirline.buffer_manager.ui').toggle_quick_menu()
	end, '', { buffer = Buffer_manager_bufh })

	for _, value in pairs(config.select_menu_item_commands) do
		Nmap(value.key, function() --
			require('plugins.ui.heirline.buffer_manager.ui').select_menu_item(value.command)
		end, '', { buffer = Buffer_manager_bufh })
	end

	vim.cmd(string.format('autocmd BufModifiedSet <buffer=%s> set nomodified', Buffer_manager_bufh))
	vim.cmd(
		'autocmd BufLeave <buffer> ++nested ++once silent'
			.. " lua require('plugins.ui.heirline.buffer_manager.ui').toggle_quick_menu()"
	)
	vim.cmd(
		string.format(
			'autocmd BufWriteCmd <buffer=%s>'
				.. " lua require('plugins.ui.heirline.buffer_manager.ui').on_menu_save()",
			Buffer_manager_bufh
		)
	)
	-- Go to file hitting its line number
	local str = config.line_keys
	for i = 1, #str do
		local lhs = str:sub(i, i)
		Nmap(lhs, function() --
			M.nav_file(i)
		end, '', { buffer = Buffer_manager_bufh })
	end
end

local function set_buf_options(contents, current_buf_line)
	vim.api.nvim_win_set_option(Buffer_manager_win_id, 'number', true)
	vim.api.nvim_buf_set_name(Buffer_manager_bufh, 'buffer_manager-menu')
	vim.api.nvim_buf_set_lines(Buffer_manager_bufh, 0, #contents, false, contents)
	vim.api.nvim_buf_set_option(Buffer_manager_bufh, 'filetype', 'buffer_manager')
	vim.api.nvim_buf_set_option(Buffer_manager_bufh, 'buftype', 'acwrite')
	vim.api.nvim_buf_set_option(Buffer_manager_bufh, 'bufhidden', 'delete')
	vim.cmd(string.format(':call cursor(%d, %d)', current_buf_line, 1))
end

function M.toggle_quick_menu()
	if Buffer_manager_win_id ~= nil and vim.api.nvim_win_is_valid(Buffer_manager_win_id) then
		if vim.api.nvim_buf_get_changedtick(vim.fn.bufnr()) > 0 then M.on_menu_save() end
		close_menu(true)
		update_buffers()
		return
	end
	local current_buf_id = -1
	if config.focus_alternate_buffer then
		current_buf_id = vim.fn.bufnr('#')
	else
		current_buf_id = vim.fn.bufnr()
	end

	local win_info = create_window()
	local contents = {}
	initial_marks = {}

	Buffer_manager_win_id = win_info.win_id
	Buffer_manager_bufh = win_info.bufnr

	update_marks()

	-- set initial_marks
	local current_buf_line = 1
	local line = 1
	for idx, mark in pairs(M.marks) do
		-- Add buffer only if it does not already exist
		if vim.fn.buflisted(mark.buf_id) ~= 1 then
			M.marks[idx] = nil
		else
			local current_mark = M.marks[idx]
			initial_marks[idx] = {
				filename = current_mark.filename,
				buf_id = current_mark.buf_id,
			}
			if current_mark.buf_id == current_buf_id then current_buf_line = line end
			local display_filename = current_mark.filename
			if not string_starts(display_filename, 'term://') then
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

	set_buf_options(contents, current_buf_line)
	set_menu_keybindings()
end

function M.select_menu_item(command)
	local idx = vim.fn.line('.')
	if vim.api.nvim_buf_get_changedtick(vim.fn.bufnr()) > 0 then M.on_menu_save() end
	close_menu(true)
	M.nav_file(idx, command)
	update_buffers()
end

local function get_menu_items()
	local lines = vim.api.nvim_buf_get_lines(Buffer_manager_bufh, 0, -1, true)
	local indices = {}

	for _, line in pairs(lines) do
		if not utils.is_white_space(line) then table.insert(indices, line) end
	end

	return indices
end

local function set_mark_list(new_list)
	local original_marks = utils.deep_copy(M.marks)
	M.marks = {}
	for _, v in pairs(new_list) do
		if type(v) == 'string' then
			local filename = v
			local buf_id = nil
			local current_mark = get_mark_by_name(filename, original_marks)
			if current_mark then
				filename = current_mark.filename
				buf_id = current_mark.buf_id
			else
				buf_id = vim.fn.bufnr(v)
			end
			table.insert(M.marks, {
				filename = filename,
				buf_id = buf_id,
			})
		end
	end
end

function M.on_menu_save() set_mark_list(get_menu_items()) end

function M.nav_file(id, command)
	if command == nil then command = 'edit' end

	local mark = M.marks[id]
	if not mark then
		return
	else
		vim.cmd(command .. ' ' .. mark.filename)
	end
end

local function get_current_buf_line()
	local current_buf_id = vim.fn.bufnr()
	for idx, mark in pairs(M.marks) do
		if mark.buf_id == current_buf_id then return idx end
	end
	return -1
end

function M.nav_next()
	update_marks()
	local current_buf_line = get_current_buf_line()
	if current_buf_line == -1 then return end
	local next_buf_line = current_buf_line + 1
	if next_buf_line > #M.marks then next_buf_line = 1 end
	M.nav_file(next_buf_line)
end

function M.nav_prev()
	update_marks()
	local current_buf_line = get_current_buf_line()
	if current_buf_line == -1 then return end
	local prev_buf_line = current_buf_line - 1
	if prev_buf_line < 1 then prev_buf_line = #M.marks end
	M.nav_file(prev_buf_line)
end

function M.location_window(options)
	local default_options = {
		relative = 'editor',
		style = 'minimal',
		width = 30,
		height = 15,
		row = 2,
		col = 2,
	}
	options = vim.tbl_extend('keep', options, default_options)

	local bufnr = options.bufnr or vim.api.nvim_create_buf(false, true)
	local win_id = vim.api.nvim_open_win(bufnr, true, options)

	return {
		bufnr = bufnr,
		win_id = win_id,
	}
end

function M.save_menu_to_file(filename)
	if filename == nil or filename == '' then
		filename = vim.fn.input('Enter filename: ')
		if filename == '' then return end
	end
	local file = io.open(filename, 'w')
	if file == nil then return end
	for _, mark in pairs(M.marks) do
		file:write(Path:new(mark.filename):absolute() .. '\n')
	end
	file:close()
end

function M.load_menu_from_file(filename)
	if filename == nil or filename == '' then
		filename = vim.fn.input('Enter filename: ')
		if filename == '' then return end
	end
	local file = io.open(filename, 'r')
	if file == nil then return end
	local lines = {}
	for line in file:lines() do
		table.insert(lines, line)
	end
	file:close()
	set_mark_list(lines)
	update_buffers()
end

return M
