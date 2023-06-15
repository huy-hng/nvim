local function end_navigation()
	vim.o.cursorcolumn = false
	vim.o.cursorlineopt = 'number'
end

local function start_navigation()
	vim.o.cursorline = true
	vim.o.cursorlineopt = 'both'
end

local fold = Map.meta('Fold Navigation', { buffer = true })

fold:map_enter('n', Keys.ctrl.fold_navigation, start_navigation)
fold:map_exit('n', { 'q', '<esc>', Keys.ctrl.fold_navigation }, end_navigation)

-- map:N('m', 'zm')
fold:n('m', 'zm')
fold:n('M', 'zM')
fold:n('r', 'zr')
fold:n('R', 'zR')
fold:n(Keys.C, 'zC', 'close the entire fold until level 0')
fold:n(Keys.O, 'zO', 'open the entire fold')

fold:n(Keys.h, Util.wrap(pcall, vim.cmd.foldclose))
fold:n(Keys.l, Util.wrap(pcall, vim.cmd.foldopen))
fold:n(Keys.j, 'zj^', 'Move to the start of the next fold')
fold:n(Keys.k, 'zk^', 'Move to the end of the previous fold')
-- map:nmap('K', 'zk')

fold:n(Keys.ctrl.j, ']z', 'Move to the end of the current open fold')
fold:n(Keys.ctrl.k, '[z', 'Move to the start of the current open fold')

local ufo = npcall(require, 'ufo')

if ufo then
	local functions = require('plugins.ui.ufo.functions')
	fold:n('M', ufo.closeAllFolds, 'close all folds')
	fold:n('R', ufo.openAllFolds, 'open all folds')

	fold:n('<CR>', ufo.peekFoldedLinesUnderCursor, 'Peek Fold', { nowait = true })

	-- map:nmap('k', 'zz', 'Go to start of prev fold', { callback = ufo.goPreviousStartFold })
	fold:n(Keys.k, ufo.goPreviousStartFold, 'Go to start of prev fold')
	-- map:nmap('K', ufo.goPreviousClosedFold, 'Go to prev closed fold')
	fold:n(Keys.J, functions.goNextClosedAndPeek, 'Go to next closed fold')
	fold:n(Keys.K, ufo.peekFoldedLinesUnderCursor, 'Go to prev closed fold')

	fold:n('1', { ufo.closeFoldsWith, 0 })
	fold:n('2', { ufo.closeFoldsWith, 1 })
	fold:n('3', { ufo.closeFoldsWith, 2 })
	fold:n('4', { ufo.closeFoldsWith, 3 })
	fold:n('5', { ufo.closeFoldsWith, 4 })
	fold:n('6', { ufo.closeFoldsWith, 5 })
	fold:n('7', { ufo.closeFoldsWith, 6 })
end
