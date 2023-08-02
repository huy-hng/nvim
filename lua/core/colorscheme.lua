function SetColors(theme)
	ColorTheme = theme or ColorTheme or 'default'

	vim.cmd.colorscheme(ColorTheme)

	Highlight(0, 'Folded', { bg = '#1F1F2F' })
	Highlight(0, 'Statusline', { fg = 'fg', bg=nil })
	Highlight(0, 'IndentLine', { link = 'NonText' })
	Highlight(0, 'ColumnLine', { link = 'NonText' })

	-- Highlight(0, 'CursorLine', { link = 'Visual' })
	-- Highlight(0, 'CursorColumn', { link = 'CursorLine' })
	-- Highlight(0, 'helpCommand', { link = 'markdownCode' })

	if ColorTheme == 'default' then return end

end

-- 'tokyonight' -- this is same as storm
-- 'tokyonight-day'
-- 'tokyonight-storm'
-- 'tokyonight-moon'
-- 'tokyonight-night'
-- SetColors('catppuccin')
