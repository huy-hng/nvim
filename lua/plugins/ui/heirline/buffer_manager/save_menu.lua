local Path = require('plenary.path')
local utils = require('plugins.ui.heirline.buffer_manager.utils')
local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')

local M = {}

local function set_mark_list(new_list)
	local original_marks = utils.deep_copy(M.marks)
	M.marks = {}
	for _, v in pairs(new_list) do
		if type(v) == 'string' then
			local filename = v
			local buf_id = nil
			local current_mark = list_manager.get_mark_by_name(filename, original_marks)
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
	list_manager.update_buffers()
end
return M
