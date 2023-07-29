local config = require('plugins.ui.heirline.buffer_manager.config').config
local filename = require('plugins.ui.heirline.buffer_manager.filename')
local list_manager = require('plugins.ui.heirline.buffer_manager.list_manager')

local M = {}

local ns = vim.api.nvim_create_namespace('BufferManager')

function M.set_extmark(bufnr, row, col, content, extra_opts)
	if not vim.api.nvim_buf_is_valid(bufnr) then return end

	local mark_opts = {
		virt_text = content,
		virt_text_pos = 'overlay',
		hl_mode = 'combine',

		-- end_row = row,
		-- end_col = col,

		virt_lines_leftcol = true,
		virt_lines_above = true,
	}
	mark_opts = table.extend(mark_opts, extra_opts)

	vim.api.nvim_buf_set_extmark(bufnr, ns, row, col, mark_opts)
end

function M.remove_extmarks(bufnr, line_start, line_end)
	vim.api.nvim_buf_clear_namespace(bufnr, ns, line_start or 0, line_end or -1)
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

		M.set_extmark(bufnr, i - 1, 0, filename.get_extmark_name(file), extra_opts)
		prev_path = path_string
	end
end

function M.create_buffer_content(current_buf)
	---@diagnostic disable-next-line: param-type-mismatch
	current_buf = config.focus_alternate_buffer and vim.fn.bufnr('#') or current_buf

	local contents = {}
	local current_buf_line
	local line = 1
	for i, mark in ipairs(list_manager.marks) do
		-- Add buffer only if it does not already exist
		if vim.fn.buflisted(mark.bufnr) ~= 1 then
			list_manager.marks[i] = nil
			goto continue
		end
		list_manager.initial_marks[i] = {
			filename = mark.filename,
			bufnr = mark.bufnr,
		}
		if mark.bufnr == current_buf then current_buf_line = line end

		contents[line] = string.format('%s', mark.filename)
		line = line + 1

		::continue::
	end
	return contents, current_buf_line
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
