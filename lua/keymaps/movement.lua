-- horizontal scrolling
Map.n('zh', '10zh')
Map.n('zl', '10zl')

Map.nv('<C-j>', '<C-d>zzzz')
Map.nv('<C-k>', '<C-u>zzzz')

-- Nmap('<C-d>', function()
-- 	nvim.feedkeys('<C-d>zz')
-- 	nvim.schedule(nvim.feedkeys, 'zz')
-- end)

-- Cursor movement in insert and command mode
-- ICmap('<A-h>', { nvim.feedkeys, '<Left>' })
-- ICmap('<A-j>', { nvim.feedkeys, '<Down>' })
-- ICmap('<A-k>', { nvim.feedkeys, '<Up>' })
-- ICmap('<A-l>', { nvim.feedkeys, '<Right>' })

-- Prev command in command mode
-- Cmap('<C-n>', { nvim.feedkeys, '<Down>' })
-- Cmap('<C-p>', { nvim.feedkeys, '<Up>' })
Map.c('<A-j>', { nvim.feedkeys, '<Down>' })
Map.c('<A-k>', { nvim.feedkeys, '<Up>' })

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

Map.n('A', 'A', 'Move to correct indentation, or normal A', {
	callback = move_to_indent,
})
Map.n('a', 'a', 'Move to correct indentation, or normal A', {
	callback = move_to_indent,
})

-----------------------------------------Fold Navigation Mode---------------------------------------
-- folding shortcuts
Map.n('<A-h>', Util.wrap(pcall, vim.cmd.foldclose))
Map.n('<A-l>', Util.wrap(pcall, vim.cmd.foldopen))
