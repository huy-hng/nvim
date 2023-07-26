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

	vim.api.nvim_buf_set_extmark(bufnr, ns, row, 0, mark_opts)
end

function M.remove_extmarks(bufnr)
	vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
end

return M
