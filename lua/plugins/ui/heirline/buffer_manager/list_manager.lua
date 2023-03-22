local utils = require('plugins.ui.heirline.buffer_manager.utils')

local buffer_manager = require('plugins.ui.heirline.buffer_manager')
local config = buffer_manager.get_config()

local M = {}

---@type { filename: string, bufnr: number }[]
M.marks = {}

M.initial_marks = {}

function M.get_ordered_bufids()
	local bufs = {}
	for _, mark in ipairs(M.marks) do
		table.insert(bufs, mark.bufnr)
	end
	return bufs
end

function M.initialize_marks()
	local buffers = vim.api.nvim_list_bufs()
	M.marks = {}

	for idx = 1, #buffers do
		local bufnr = buffers[idx]
		local buf_name = vim.api.nvim_buf_get_name(bufnr)
		local filename = buf_name
		-- if buffer is listed, then add to contents and M.marks
		if utils.buffer_is_valid(bufnr, buf_name) then
			table.insert(M.marks, {
				filename = filename,
				bufnr = bufnr,
			})
		end
	end
end

function M.get_mark_by_name(name, specific_marks)
	local ref_name = nil
	for _, mark in ipairs(specific_marks) do
		ref_name = mark.filename
		if utils.string_starts(mark.filename, 'term:') then
			if config.short_term_names then ref_name = utils.get_short_term_name(mark.filename) end
		else
			if config.short_file_names then ref_name = utils.get_short_file_name(mark.filename) end
		end
		if name == ref_name then return mark end
	end
	return nil
end

local function set_mark_list(new_list)
	local original_marks = utils.deep_copy(M.marks)
	M.marks = {}
	for _, v in ipairs(new_list) do
		if type(v) == 'string' then
			local filename = v
			local bufnr = nil
			local current_mark = M.get_mark_by_name(filename, original_marks)
			if current_mark then
				filename = current_mark.filename
				bufnr = current_mark.bufnr
			else
				bufnr = vim.fn.bufnr(v)
			end
			table.insert(M.marks, {
				filename = filename,
				bufnr = bufnr,
			})
		end
	end
end

local function get_menu_items()
	local window_manager = require('plugins.ui.heirline.buffer_manager.window')
	local lines = vim.api.nvim_buf_get_lines(window_manager.win_bufnr, 0, -1, true)
	local items = {}

	-- TODO: copy whitespace as well for organizing buffers
	for _, line in ipairs(lines) do
		if not utils.is_white_space(line) then --
			table.insert(items, line)
		end
	end

	return items
end

function M.on_menu_save() set_mark_list(get_menu_items()) end

function M.can_be_deleted(bufname, bufnr)
	return (
		vim.api.nvim_buf_is_valid(bufnr)
		and (not utils.string_starts(bufname, 'term://'))
		and not vim.bo[bufnr].modified
		and bufnr ~= -1
	)
end

local function is_buffer_in_marks(bufnr)
	for _, mark in ipairs(M.marks) do
		if mark.bufnr == bufnr then
			return true
		end
	end
	return false
end

function M.update_buffers()
	-- Check deletions
	for _, mark in ipairs(M.initial_marks) do
		if not is_buffer_in_marks(mark.bufnr) then
			if M.can_be_deleted(mark.filename, mark.bufnr) then
				vim.api.nvim_buf_clear_namespace(mark.bufnr, -1, 1, -1)
				vim.cmd.Bdelete(mark.bufnr)
			end
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
