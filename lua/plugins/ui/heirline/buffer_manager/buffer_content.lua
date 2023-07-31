local config = require('plugins.ui.heirline.buffer_manager.config').config
local filename = require('plugins.ui.heirline.buffer_manager.filename')
local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')
local grouper = require('plugins.ui.heirline.buffer_manager.grouper')

local M = {}

local ns = vim.api.nvim_create_namespace('BufferManager')

local function set_extmark(bufnr, row, col, content, extra_opts)
	if not vim.api.nvim_buf_is_valid(bufnr) then return end

	local mark_opts = {
		virt_text = content,
		virt_text_pos = 'overlay',
		hl_mode = 'combine',

		virt_lines_leftcol = true,
		virt_lines_above = true,
	}
	mark_opts = table.extend(mark_opts, extra_opts)

	vim.api.nvim_buf_set_extmark(bufnr, ns, row, col, mark_opts)
end

function M.remove_extmarks(bufnr, line_start, line_end)
	vim.api.nvim_buf_clear_namespace(bufnr, ns, line_start or 0, line_end or -1)
end

function M.extmark_setter(bufnr, extmarks)
	M.remove_extmarks(bufnr)
	for _, extmark in ipairs(extmarks) do
		set_extmark(bufnr, extmark[1] - 1, 0, extmark[2], extmark[3])
	end
end

function M.update_extmarks(bufnr, lines)
	M.remove_extmarks(bufnr)
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

		local extmark = { filename.get_icon(file), unpack(filename.get_extmark_name(file)) }
		set_extmark(bufnr, i - 1, 0, extmark, extra_opts)
		prev_path = path_string
	end
end

function M.create_buffer_content(current_buf)
	---@diagnostic disable-next-line: param-type-mismatch
	current_buf = config.focus_alternate_buffer and vim.fn.bufnr('#') or current_buf

	local contents = {}
	local current_buf_line

	for i, mark in ipairs(list_manager.marks) do
		if mark.bufnr == current_buf then current_buf_line = i end
		table.insert(contents, mark.filename)
	end
	return contents, current_buf_line
end

local function get_truncated_extmark(fname, folder_difference)
	local path = {}
	if folder_difference > 0 then
		local path_folders = filename.get_path_folders(fname, folder_difference)
		path = filename.get_extmark_path(path_folders, false)
	end
	local icon = filename.get_icon(fname)

	local name = filename.get_extmark_name(fname)
	return table.add({ icon }, path, name)
end

local function get_virt_line(path, add_separator)
	local extra_opts = {}

	local separator_line = { { vim.fn['repeat']('─', config.width) } }

	local virt_line = filename.get_extmark_path(path)
	table.insert(virt_line, 1, { '  ' })
	extra_opts.virt_lines = { virt_line }
	if add_separator then table.insert(extra_opts.virt_lines, 1, separator_line) end
	return extra_opts
end

function M.create_grouped_buffer_content(current_buf)
	local contents = {}
	local extmarks = {}
	local current_buf_line

	local groups = grouper.group_marks(list_manager.marks)
	local line = 1
	for i, group in ipairs(groups) do
		local common_path = group.common_path

		for j, mark in ipairs(group.marks) do
			if mark.bufnr == current_buf then current_buf_line = line end

			-- add virt line for group
			local extra_opts = j > 1 and {} or get_virt_line(common_path, i ~= 1)

			local path_folders = filename.get_path_folders(mark.filename)
			local extmark = get_truncated_extmark(mark.filename, #path_folders - #common_path)

			table.insert(extmarks, { line, extmark, extra_opts })
			table.insert(contents, mark.filename)
			line = line + 1
		end
	end
	return contents, current_buf_line, extmarks
end

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

return M
