local M = {}
-- used in autocommands

----------------------------------------------Config------------------------------------------------

-- vim.g.column_lines = { 80, 100 }
local default_opts = {
	columns = { 80, 100 },
	column_char = '▏',
}

M.opts = default_opts
function M.setup(opts)
	M.remove_colorcolumn_values()

	M.opts = vim.tbl_extend('force', M.opts, opts or {})
	M.namespace = vim.api.nvim_create_namespace('ColumnLine')
	-- Highlight(M.namespace, 'ColumnLine', {})

	Highlight(0, 'ColorColumn', {})

	Highlight(0, 'ColumnLine', {
		fg = '#45475a',
	})

end

---------------------------------------------Functions----------------------------------------------

function M.remove_colorcolumn_values()
	for _, column in ipairs(vim.opt.colorcolumn:get()) do
		column = tonumber(column)
		if not vim.tbl_contains(M.opts.columns, column) then
			table.insert(M.opts.columns, column)
			table.insert(M.opts.columns, 'alskdj')
		end
	end

	-- vim.go.colorcolumn = ''
	vim.o.colorcolumn = ''
end

local function should_set(line_text, column)
	column = column + 1
	local width = vim.fn.strdisplaywidth(line_text)
	if width < column then return true end

	line_text = line_text:gsub('\t', string.rep(' ', vim.opt.tabstop:get()))
	local char = string.sub(line_text, column, column)
	if char == ' ' or char == '' then return true end
end

local function set_line(bufnr, column)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	for linenr, line_text in ipairs(lines) do
		if not should_set(line_text, column) then
			goto continue
		end

		vim.api.nvim_buf_set_extmark(bufnr, M.namespace, linenr - 1, 0, {
			virt_text = { { M.opts.column_char, 'ColumnLine' } },
			virt_text_pos = 'overlay',
			hl_mode = 'combine',
			virt_text_win_col = column,
			priority = 1,
			-- hl_group = 'NormalFloat',
			-- end_col = 100,
			-- hl_eol = true,
			-- virt_lines = { { { column_char, 'ColumnLine' } } },
			-- line_hl_group = 'Search',
			-- cursorline_hl_group = 'Visual',
			-- conceal = 'a',
			-- sign_text = 'si'
			-- strict = false,
		})
		::continue::
	end
end

function M.refresh()
	-- if force then
	-- 	local win = vim.api.nvim_get_current_win()
	-- 	-- vim.cmd([[noautocmd windo lua refrfeshcolumnline()]])
	-- 	if vim.api.nvim_win_is_valid(win) then vim.api.nvim_set_current_win(win) end
	-- end

	local ignore_wintypes = {
		'autocmd',
		'command',
		'loclist',
		-- 'popup',
		-- 'preview',
		'quickfix',
		'unknown',
	}

	local bufnr = vim.api.nvim_get_current_buf()
	if not vim.api.nvim_buf_is_loaded(bufnr) then return end

	local modifiable = vim.api.nvim_buf_get_option(bufnr, 'modifiable')

	local type = Util.win_type()
	if not modifiable or vim.tbl_contains(ignore_wintypes, type) then
		vim.api.nvim_win_set_hl_ns(0, M.namespace)
		return
	end
	vim.api.nvim_win_set_hl_ns(0, 0)

	if M.namespace then vim.api.nvim_buf_clear_namespace(bufnr, M.namespace, 0, -1) end

	for _, column in ipairs(M.opts.columns) do
		set_line(bufnr, tonumber(column))
	end
end

return M
