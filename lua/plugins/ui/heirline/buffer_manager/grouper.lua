local utils = require('plugins.ui.heirline.buffer_manager.utils')
local filename = require('plugins.ui.heirline.buffer_manager.filename')

local M = {}

local function marks_with_common_path(marks, path)
	local matching_marks = {}
	for _, mark in ipairs(marks) do
		local name = filename.normalize_path(mark.filename)
		if string.starts(name, path) then table.insert(matching_marks, mark) end
	end
	return matching_marks
end

local function remove_matching_marks(marks, matching_marks)
	for _, match in ipairs(matching_marks) do
		for i, mark in ipairs(marks) do
			if mark.bufnr == match.bufnr then
				table.remove(marks, i)
				break
			end
		end
	end
	return marks
end

local function group_mark(marks)
	local min_amount_grouped_files = 2

	local folders = filename.get_path_folders(marks[1].filename)

	local common_path = {}
	local matching_marks = { marks[1] }
	for _, folder in ipairs(folders) do
		local path = string.join(common_path, '/') .. folder
		-- print(path)
		local match = marks_with_common_path(marks, path)
		if #match <= min_amount_grouped_files then break end
		matching_marks = match
		table.insert(common_path, folder)
	end

	return common_path, matching_marks
end

function M.group_marks(marks)
	local to_be_grouped = utils.deep_copy(marks)
	local groups = {}
	local safety_counter = 0
	while #to_be_grouped > 0 or safety_counter > 100 do
		local common_path, matching_marks = group_mark(to_be_grouped)
		remove_matching_marks(to_be_grouped, matching_marks)
		table.insert(groups, { common_path, matching_marks })
		safety_counter = safety_counter + 1
	end
	return groups
end

return M
