function SetColors(theme)
	if type(theme) == 'string' then
		ColorTheme = theme
		vim.cmd.colorscheme(theme)
	end

	-- update highlight instead of replacing it
	vim.cmd('highlight Statusline guibg=none')

	Highlight(0, 'Folded', { bg = '#1F1F2F' })
	-- Highlight(0, 'Statusline', { fg = 'fg', bg=nil })
	Highlight(0, 'IndentLine', { link = 'NonText' })
	Highlight(0, 'ColumnLine', { link = 'NonText' })

	-- Highlight(0, 'CursorLine', { link = 'Visual' })
	Highlight(0, 'CursorColumn', { link = 'CursorLine' })
	-- Highlight(0, 'helpCommand', { link = 'markdownCode' })

	if ColorTheme == 'default' then return end
end

