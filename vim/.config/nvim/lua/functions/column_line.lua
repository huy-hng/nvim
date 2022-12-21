----------------------------------------------Config------------------------------------------------

vim.go.colorcolumn = ''
vim.opt_global.colorcolumn:append { 101 }
vim.api.nvim_set_hl(0, 'ColorColumn', {
	fg = '#45475a',
	-- sp = 'red',
	-- link = 'Whitespace',
	-- bg = 'black',
	-- blend = 100,
})

local column_char = '▏'
local namespace = vim.api.nvim_create_namespace('ColumnLine')

---------------------------------------------Functions----------------------------------------------

local function should_set(line_text, column)
	local width = vim.fn.strdisplaywidth(line_text)
	if width < column then return true end
	-- local char_index = vim.fn.strgetchar(line_text, column) + 2
	-- print(line_text)
	-- print(width, char_index, string.sub(line_text, char_index, char_index))

	-- vim.fn.strcharpart()

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
		vim.api.nvim_buf_set_extmark(bufnr, namespace, linenr - 1, 0, {
			virt_text = { { column_char, 'ColorColumn' } },
			virt_text_pos = 'overlay',
			hl_mode = 'combine',
			virt_text_win_col = column - 1,
			priority = 1,
			-- hl_group = 'NormalFloat',
			-- end_col = 100,
			-- hl_eol = true,
			-- virt_lines = { { { column_char, 'ColorColumn' } } },
			-- line_hl_group = 'Search',
			-- cursorline_hl_group = 'Visual',
			-- conceal = 'a',
			-- sign_text = 'si'
			-- strict = false,
		})
		::continue::
	end
end

local function refresh(data)
	if data.event == 'CmdWinEnter' or vim.fn.mode() == 'c' then return end

	-- if force then
	-- 	local win = vim.api.nvim_get_current_win()
	-- 	-- vim.cmd([[noautocmd windo lua refrfeshcolumnline()]])
	-- 	if vim.api.nvim_win_is_valid(win) then vim.api.nvim_set_current_win(win) end
	-- end

	local bufnr = vim.api.nvim_get_current_buf()

	if not vim.api.nvim_buf_is_loaded(bufnr) then return end
	if namespace then vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1) end

	for _, column in ipairs(vim.opt.colorcolumn:get()) do
		set_line(bufnr, tonumber(column))
	end
end

-----------------------------------------------Setup------------------------------------------------

Augroup('ColumnLine', {
	Autocmd('OptionSet', 'colorcolumn', refresh),

	Autocmd('BufWinEnter', function(data) --
		if data.event == 'CmdWinEnter' or vim.fn.mode() == 'c' then return end
		NestedAutocmd(data, {
			'FileChangedShellPost',
			'TextChanged',
			'TextChangedI',
			'CompleteChanged',
			'BufWinEnter',
			'VimEnter',
			'SessionLoadPost',
		}, nil, refresh)
	end),
})
