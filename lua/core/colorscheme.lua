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

	-- Highlight(0, 'Folded', { bg = '#45475A' })
	-- Highlight(0, 'Folded', { bg = '#1E1E2E' })
	Highlight(0, 'Folded', { bg = '#1F1F2F' })
	-- Highlight(0, 'Folded', { bg = nil })

	-- vim.cmd('highlight Statusline guibg=none')
	-- Highlight(0, 'IndentLine', { fg = '#45475a' })
	-- Highlight(0, 'ColumnLine', { fg = '#45475a' })
	Highlight(0, 'IndentLine', { link = 'Comment' })
	Highlight(0, 'ColumnLine', { link = 'Comment' })

	-- vim.cmd('highlight ColorColumn guibg=none guifg=#45475a')

	if ColorTheme == 'default' then return end

	-- Highlight(0, 'Statusline', { fg = 'fg' })
	Highlight(0, 'CursorLine', { link = 'Visual' })
	-- Highlight(0, 'CursorColumn', { link = 'CursorLine' })
	-- Highlight(0, 'helpCommand', { link = 'markdownCode' })
end

-- 'tokyonight' -- this is same as storm
-- 'tokyonight-day'
-- 'tokyonight-storm'
-- 'tokyonight-moon'
-- 'tokyonight-night'
-- SetColors('catppuccin')
