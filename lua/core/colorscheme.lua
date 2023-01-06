function SetColors(theme)
	ColorTheme = theme or ColorTheme or 'default'

	vim.cmd.colorscheme(ColorTheme)

	vim.cmd('highlight Folded guibg=none')
	vim.cmd('highlight Statusline guibg=none')
	-- Highlight(0, 'IndentLine', { fg = '#45475a' })
	-- Highlight(0, 'ColumnLine', { fg = '#45475a' })
	Highlight(0, 'IndentLine', { link = 'Comment' })
	Highlight(0, 'ColumnLine', { link = 'Comment' })

	-- vim.cmd('highlight ColorColumn guibg=none guifg=#45475a')

	if ColorTheme == 'default' then return end

	-- Highlight(0, 'Statusline', { fg = 'fg' })
	-- Highlight(0, 'CursorColumn', { link = 'CursorLine' })
	-- Highlight(0, 'helpCommand', { link = 'markdownCode' })
end

-- 'tokyonight' -- this is same as storm
-- 'tokyonight-day'
-- 'tokyonight-storm'
-- 'tokyonight-moon'
-- 'tokyonight-night'
-- SetColors()
