-- ../../../plugins/extra_modes/lua/extra_modes/init.lua

-- local has_metamap, MetaMap = pcall(require, 'metamap')
local function temp_change_cursor_color()
	local group_id = vim.fn.hlID('Cursor')
	local fg = vim.fn.synIDattr(group_id, 'fg')
	local bg = vim.fn.synIDattr(group_id, 'bg')

	-- Highlight()

	return { fg = fg, bg = bg }
end

local go_to_first_sibling = '[z[zzj^'
local go_to_last_sibling = function()
	nvim.feedkeys(']z]z')
	ufo.goPreviousStartFold()
end
local recursively_close_except_cursor = ''
-- same as above, but when entering the fold immediately, everything will be closed
local recursively_close = function()
	-- Feedkeys('[z')
	vim.cmd.keepjumps('norm! [z')
	local line = vim.fn.getcurpos(0)[2]
	local fold_start = vim.fn.foldclosed(line)
	local fold_end = vim.fn.foldclosedend(line)
	print(line, fold_start, fold_end)
	-- vim.cmd.folddoopen('foldclose')
end
local recursively_open = ''

local function goPreviousStartFold()
	print(' ')
	local function getCurLnum() return vim.api.nvim_win_get_cursor(0)[1] end

	local cnt = vim.v.count1
	print('count', cnt)
	local curLnum = getCurLnum()
	print('40: curLnum', getCurLnum())
	nvim.exec('norm! m`')
	local previousLnum
	local previousLnumList = {}
	while cnt > 0 do
		nvim.exec('keepj norm! zk')
		local tLnum = getCurLnum()
		print('zk', tLnum)
		nvim.exec('keepj norm! [z')
		print('[z', getCurLnum())
		if tLnum == getCurLnum() then
			local foldStartLnum = vim.fn.foldclosed(tLnum)
			if foldStartLnum > 0 then nvim.exec(('keepj norm! %dgg'):format(foldStartLnum)) end
			print('to line', foldStartLnum)
		end
		local nextLnum = getCurLnum()
		print('nextLnum', nextLnum)
		while curLnum > nextLnum do
			tLnum = nextLnum
			table.insert(previousLnumList, nextLnum)
			print('inserting', nextLnum)
			nvim.exec('keepj norm! zj')
			nextLnum = getCurLnum()
			print('zj', nextLnum)
			if nextLnum == tLnum then break end
		end
		print('break')
		P(previousLnumList)
		if #previousLnumList == 0 then break end
		if #previousLnumList < cnt then
			cnt = cnt - #previousLnumList
			curLnum = previousLnumList[1]
			previousLnum = curLnum
			nvim.exec(('keepj norm! %dgg'):format(curLnum))
			print('to line', curLnum)
			previousLnumList = {}
		else
			while cnt > 0 do
				previousLnum = table.remove(previousLnumList)
				print('last', previousLnum)
				cnt = cnt - 1
			end
		end
	end
	if previousLnum then vim.cmd(('norm! %dgg_'):format(previousLnum)) end
end

-- Nmap('<C-f>', start_navigation, 'Start Fold navigation mode')

local function end_navigation()
	vim.o.cursorcolumn = false
	vim.o.cursorlineopt = 'number'
	-- extra_modes.restore_maps(saved_mappings, bufnr)
	-- vim.notify('Exiting ' .. vim.b[bufnr].ExtraMode or '' .. 'mode')
	-- vim.b[bufnr].ExtraMode = nil
end

local function start_navigation()
	vim.o.cursorline = true
	vim.o.cursorlineopt = 'both'
	-- vim.o.cursorcolumn = true
end

local fold = Map.meta('Fold Navigation', { buffer = true })

fold:map_enter('n', Keys.ctrl.fold_navigation, start_navigation)
fold:map_exit('n', { 'q', '<esc>', Keys.ctrl.fold_navigation }, end_navigation)

-- map:N('m', 'zm')
fold:n('m', 'zm')
fold:n('M', 'zM')
fold:n('r', 'zr')
fold:n('R', 'zR')
fold:n('C', 'zC', 'close the entire fold until level 0')
fold:n('O', 'zO', 'open the entire fold')

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
