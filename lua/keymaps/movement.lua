-- horizontal scrolling
Nmap('zh', '10zh')
Nmap('zl', '10zl')

Nmap('q', 'ge', 'Move back (opposite of e)')

-- nmap('<A-h>', '10zh')
-- nmap('<A-l>', '10zl')

-- Nmap('<C-d>', '<C-d>zz')
-- Nmap('<C-u>', '<C-u>zz')
-- Nmap('<C-d>', '<C-d>zzzz')
-- Nmap('<C-u>', '<C-u>zzzz')
Nmap('<C-d>', function()
	nvim.feedkeys('<C-d>zz')
	nvim.schedule(nvim.feedkeys, 'zz')
end)
Nmap('<C-u>', function()
	nvim.feedkeys('<C-u>zz')
	nvim.schedule(nvim.feedkeys, 'zz')
end)

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
local function move_to_indent()
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
end

Nmap('A', 'A', 'Move to correct indentation, or normal A', {
	callback = move_to_indent,
})
Nmap('a', 'a', 'Move to correct indentation, or normal A', {
	callback = move_to_indent,
})

-----------------------------------------Fold Navigation Mode---------------------------------------
-- folding shortcuts
Nmap('<A-h>', Util.wrap(pcall, vim.cmd.foldclose))
Nmap('<A-l>', Util.wrap(pcall, vim.cmd.foldopen))
