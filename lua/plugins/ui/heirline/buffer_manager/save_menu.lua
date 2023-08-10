local Path = require('plenary.path')
local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')

local M = {}

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
	list_manager.update_marks_list()
	list_manager.update_buffers()
end
return M
