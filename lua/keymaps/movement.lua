-- horizontal scrolling
Map.n('z' .. Keys.h, '10zh')
Map.n('z' .. Keys.l, '10zl')

local ufo = nrequire('ufo')
local zk = ufo and ufo.goPreviousStartFold  or 'zk^'
Map.n('z' .. Keys.k, zk, 'Move to the end of the previous fold')
Map.n('z' .. Keys.j, 'zj^', 'Move to the start of the next fold')

Map.nv(Keys.ctrl.j, '<C-d>zz')
Map.nv(Keys.ctrl.k, '<C-u>zz')

-- Cursor movement in insert and command mode
Map.ic(Keys.alt.h, { nvim.feedkeys, '<Left>' })
Map.ic(Keys.alt.j, { nvim.feedkeys, '<Down>' })
Map.ic(Keys.alt.k, { nvim.feedkeys, '<Up>' })
Map.ic(Keys.alt.l, { nvim.feedkeys, '<Right>' })

local function move_to_indent()
	local ts_indent = nrequire('nvim-treesitter.indent')
	if not ts_indent then return end
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

Map.n(Keys.A, 'A', 'Move to correct indentation, or normal A', {
	callback = move_to_indent,
})
Map.n(Keys.a, 'a', 'Move to correct indentation, or normal a', {
	callback = move_to_indent,
})

-----------------------------------------Fold Navigation Mode---------------------------------------
-- folding shortcuts
Map.n(Keys.alt.h, Util.wrap(pcall, vim.cmd.foldclose))
Map.n(Keys.alt.l, Util.wrap(pcall, vim.cmd.foldopen))
