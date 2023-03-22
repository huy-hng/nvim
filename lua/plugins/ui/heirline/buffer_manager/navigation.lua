local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')

local M = {}

function M.nav_file(id, command)
	if command == nil then command = 'edit' end

	local mark = list_manager.marks[id]
	if not mark then
		return
	else
		vim.cmd(command .. ' ' .. mark.filename)
	end
end

local function get_current_buf_line()
	local current_buf_id = vim.fn.bufnr()
	for idx, mark in pairs(list_manager.marks) do
		if mark.bufnr == current_buf_id then return idx end
	end
	return -1
end

function M.nav_next()
	list_manager.update_marks()
	local current_buf_line = get_current_buf_line()
	if current_buf_line == -1 then return end
	local next_buf_line = current_buf_line + 1
	if next_buf_line > #list_manager.marks then next_buf_line = 1 end
	M.nav_file(next_buf_line)
end

function M.nav_prev()
	list_manager.update_marks()
	local current_buf_line = get_current_buf_line()
	if current_buf_line == -1 then return end
	local prev_buf_line = current_buf_line - 1
	if prev_buf_line < 1 then prev_buf_line = #list_manager.marks end
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

return M
