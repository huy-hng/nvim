local filename = require('plugins.ui.heirline.buffer_manager.filename')
local utils = require('plugins.ui.heirline.buffer_manager.utils')

local M = {}
local MAX_DISPLAY_NAME_FOLDERS = 1
local MIN_AMOUNT_GROUPED_FILES = 1

---@param buffers string[]
---@param common_path string[] table with each directory being an element
---@return table
local function buffers_with_common_path(buffers, common_path)
	local matches = {}
	-- print('--------------------------------')
	local common_path_string = string.join(common_path, '/')
	-- print(common_path_string)
	for _, buffer in ipairs(buffers) do
		local buffer_path = filename.get_path_folders(buffer)

		if not string.starts(string.join(buffer_path, '/'), common_path_string) then break end

		table.insert(matches, buffer)
		-- print(buffer)
	end
	return matches
end

local function group_mark(marks)
	local folders = filename.get_path_folders(marks[1])

	local common_path = {}
	local chosen_group = { marks[1] }
	for _, folder in ipairs(folders) do
		local matches = buffers_with_common_path(marks, table.add(common_path, { folder }))

		local folder_diff = #folders - #common_path
		local too_many_folders = folder_diff > MAX_DISPLAY_NAME_FOLDERS
		local too_few_grouped_files = #matches <= MIN_AMOUNT_GROUPED_FILES

		-- its okay to exceed MAX_DISPLAY_NAME_FOLDERS if MIN_AMOUNT_GROUPED_FILES is not met
		if too_few_grouped_files and too_many_folders then break end
		-- if too_many_folders then break end

		table.insert(common_path, folder)
		chosen_group = matches
	end

	return common_path, chosen_group
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

---@param buffers string[]
---@return { buffers: string[], common_path: string[] }[]
function M.group_buffers(buffers)
	local groups = {}
	local safety_counter = 0
	while #buffers > 0 and safety_counter < 100 do
		local common_path, matching_marks = group_mark(buffers)
		remove_matching_marks(buffers, matching_marks)
		table.insert(groups, { buffers = matching_marks, common_path = common_path })
		safety_counter = safety_counter + 1
	end
	return groups
end

return M
