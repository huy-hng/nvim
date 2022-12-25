-- horizontal scrolling
Nmap('zh', '10zh')
Nmap('zl', '10zl')


Nmap('q', 'ge', 'Move back (opposite of e)')

-- nmap('<A-h>', '10zh')
-- nmap('<A-l>', '10zl')

Nmap('<C-d>', '<C-d>zzzz')
Nmap('<C-u>', '<C-u>zzzz')
Nmap('<C-d>', '<C-d>zzzz')
Nmap('<C-u>', '<C-u>zzzz')

-- Cursor movement in insert and command mode
ICmap('<A-h>', { nvim.feedkeys, '<Left>' })
ICmap('<A-j>', { nvim.feedkeys, '<Down>' })
ICmap('<A-k>', { nvim.feedkeys, '<Up>' })
ICmap('<A-l>', { nvim.feedkeys, '<Right>' })

-- Prev command in command mode
-- cmap('<C-j>', BindFeedkeys('<Down>'))
-- cmap('<C-k>', BindFeedkeys('<Up>'))
Cmap('<C-n>', { nvim.feedkeys, '<Down>' })
Cmap('<C-p>', { nvim.feedkeys, '<Up>' })

Nmap('A', 'A', 'Move to correct indentation, or normal A', {
	callback = function()
		local has_indent, ts_indent = pcall(require, 'nvim-treesitter.indent')
		if not has_indent then return end
		if vim.fn.col('$') > 1 then return end

		local line_nr = vim.fn.line('.')
		if vim.fn.indent(line_nr) > 0 then return end

		-- returns -1 when the buffer has no parser
		local total_indent = ts_indent.get_indent(line_nr)
		if total_indent <= 0 then return end

		local indent_width = vim.bo.expandtab and vim.bo.shiftwidth or vim.bo.tabstop

		local tabs = Repeat('<tab>', total_indent / indent_width)
		return string.format('A%s', tabs)
	end,
})
