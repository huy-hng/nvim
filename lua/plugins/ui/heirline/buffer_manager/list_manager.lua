local utils = require('plugins.ui.heirline.buffer_manager.utils')
local config = require('plugins.ui.heirline.buffer_manager').get_config()

local M = {}

---@alias marks { filename: string, bufnr: number }[]

---@type marks
M.marks = {}

M.initial_marks = {}

---@enum sorting_functions
local sorting_functions = {
	alphabet = function(a, b)
		if not a or not b then
			P(a)
			P(b)
			return false
		end
		return utils.get_short_file_name(a.filename) < utils.get_short_file_name(b.filename)
	end,
	bufnr = function(a, b) return a.bufnr < b.bufnr end,
}

function M.sort_marks()
	if #M.marks < 2 then return end
	local sorting_fn = sorting_functions[config.sort_by] or sorting_functions.bufnr
	table.sort(M.marks, sorting_fn)
end

function M.get_ordered_bufids()
	M.update_marks()
	local bufs = {}
	for _, mark in ipairs(M.marks) do
		table.insert(bufs, mark.bufnr)
	end
	return bufs
end

function M.initialize_marks()
	local buffers = vim.api.nvim_list_bufs()

	M.marks = table.map(function(bufnr)
		local buf_name = vim.api.nvim_buf_get_name(bufnr)
		if not utils.buffer_is_valid(bufnr, buf_name) then return end
		return {
			filename = buf_name,
			bufnr = bufnr,
		}
	end, buffers)

	if config.sort_by then M.sort_marks() end
end

function M.get_mark_by_name(name, specific_marks)
	local ref_name = nil
	for _, mark in ipairs(specific_marks) do
		ref_name = mark.filename

		if string.starts(mark.filename, 'term://') then
			if config.short_term_names then ref_name = utils.get_short_term_name(mark.filename) end
		else
			if config.short_file_names then ref_name = utils.get_short_file_name(mark.filename) end
		end
		if name == ref_name then return mark end
	end
	return nil
end

local function update_marks_list(new_list)
	local original_marks = utils.deep_copy(M.marks)
	M.marks = table.map(function(v)
		if type(v) ~= 'string' then return end

		local filename = v
		local bufnr = nil

		local existing_mark = M.get_mark_by_name(filename, original_marks)
		if existing_mark then
			filename = existing_mark.filename
			bufnr = existing_mark.bufnr
		else
			bufnr = vim.fn.bufnr(v)
		end

		return { filename = filename, bufnr = bufnr }
	end, new_list)
end

local function get_menu_items()
	local win_bufnr = require('plugins.ui.heirline.buffer_manager.window').win_bufnr
	local lines = vim.api.nvim_buf_get_lines(win_bufnr, 0, -1, true)
	local items = {}

	-- TODO: copy whitespace as well for organizing buffers
	for _, line in ipairs(lines) do
		if not utils.is_white_space(line) then --
			table.insert(items, line)
		end
	end

	return items
end

function M.on_menu_save()
	update_marks_list(get_menu_items())
	if config.sort_on_close and config.sort_by then M.sort_marks() end
	M.marks = utils.remove_duplicates(M.marks)
end

function M.can_be_deleted(bufname, bufnr)
	return (
		vim.api.nvim_buf_is_valid(bufnr)
		and not string.starts(bufname, 'term://')
		and not vim.bo[bufnr].modified
		and bufnr ~= -1
	)
end

local function is_buffer_in_marks(bufnr)
	for _, mark in ipairs(M.marks) do
		if mark.bufnr == bufnr then return true end
	end
	return false
end

function M.update_buffers()
	-- Check deletions
	for _, mark in ipairs(M.initial_marks) do
		if not is_buffer_in_marks(mark.bufnr) and M.can_be_deleted(mark.filename, mark.bufnr) then
			vim.api.nvim_buf_clear_namespace(mark.bufnr, -1, 1, -1)
			vim.cmd.Bdelete(mark.bufnr)
		end
	end

	-- Check additions
	for i, mark in ipairs(M.marks) do
		local bufnr = vim.fn.bufnr(mark.filename)
		-- Add buffer only if it does not already exist
		if bufnr == -1 then
			-- vim.cmd('badd ' .. mark.filename)
			M.marks[i].bufnr = vim.fn.bufnr(mark.filename)
		end
	end
end

function M.remove_mark(idx)
	M.marks[idx] = nil
	if idx < #M.marks then
		for i = idx, #M.marks do
			M.marks[i] = M.marks[i + 1]
		end
	end
end

function M.update_marks()
	-- Check if any buffer has been deleted
	-- If so, remove it from M.marks
	for i, mark in ipairs(M.marks) do
		if not utils.buffer_is_valid(mark.bufnr, mark.filename) then --
			M.remove_mark(i)
		end
	end

	-- Check if any buffer has been added
	-- If so, add it to M.marks
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		local bufname = vim.api.nvim_buf_get_name(buf)
		if utils.buffer_is_valid(buf, bufname) and not is_buffer_in_marks(buf) then
			table.insert(M.marks, {
				filename = bufname,
				bufnr = buf,
			})
		end
	end
end

return M
