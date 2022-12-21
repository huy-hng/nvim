local has_ufo, ufo = pcall(require, 'ufo')
local functions = require('plugins.ufo.functions')

local fn = R('core.keymappers')

local function temp_change_cursor_color()
	local group_id = vim.fn.hlID('Cursor')
	local fg = vim.fn.synIDattr(group_id, 'fg')
	local bg = vim.fn.synIDattr(group_id, 'bg')

	-- Highlight()

	return { fg = fg, bg = bg }
end

local go_to_first_sibling = '[z[zzj^'
local go_to_last_sibling = function()
	Feedkeys(']z]z')
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
	Exec('norm! m`')
	local previousLnum
	local previousLnumList = {}
	while cnt > 0 do
		Exec('keepj norm! zk')
		local tLnum = getCurLnum()
		print('zk', tLnum)
		Exec('keepj norm! [z')
		print('[z', getCurLnum())
		if tLnum == getCurLnum() then
			local foldStartLnum = vim.fn.foldclosed(tLnum)
			if foldStartLnum > 0 then Exec(('keepj norm! %dgg'):format(foldStartLnum)) end
			print('to line', foldStartLnum)
		end
		local nextLnum = getCurLnum()
		print('nextLnum', nextLnum)
		while curLnum > nextLnum do
			tLnum = nextLnum
			table.insert(previousLnumList, nextLnum)
			print('inserting', nextLnum)
			Exec('keepj norm! zj')
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
			Exec(('keepj norm! %dgg'):format(curLnum))
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

local function start_navigation()
	vim.o.cursorline = true
	-- vim.o.cursorcolumn = true
	vim.o.cursorlineopt = 'both'
	local bufnr = vim.api.nvim_get_current_buf()

	if vim.b[bufnr].ExtraMode then return end
	local saved_mappings = {}
	local mapper = fn.create_mapper('n', saved_mappings)

	mapper('m', 'zm')
	mapper('M', 'zM')
	mapper('r', 'zr')
	mapper('R', 'zR')
	mapper('C', 'zC', 'close the entire fold until level 0')
	mapper('O', 'zO', 'open the entire fold')

	mapper('h', Wrap(pcall, vim.cmd.foldclose))
	mapper('l', Wrap(pcall, vim.cmd.foldopen))
	mapper('j', 'zj^', 'Move to the start of the next fold')
	mapper('k', 'zk^', 'Move to the end of the previous fold')
	-- mapper('K', 'zk')

	mapper('<C-j>', ']z', 'Move to the end of the current open fold')
	mapper('<C-k>', '[z', 'Move to the start of the current open fold')

	if has_ufo then
		mapper('M', ufo.closeAllFolds, 'close all folds')
		mapper('R', ufo.openAllFolds, 'open all folds')

		mapper('<CR>', ufo.peekFoldedLinesUnderCursor, 'Peek Fold', { nowait = true })

		mapper('k', ufo.goPreviousStartFold, 'Go to start of prev fold')
		-- mapper('K', ufo.goPreviousClosedFold, 'Go to prev closed fold')
		mapper('K', ufo.peekFoldedLinesUnderCursor, 'Go to prev closed fold')
		mapper('J', functions.goNextClosedAndPeek, 'Go to next closed fold')

		mapper('1', { ufo.closeFoldsWith, 0 })
		mapper('2', { ufo.closeFoldsWith, 1 })
		mapper('3', { ufo.closeFoldsWith, 2 })
		mapper('4', { ufo.closeFoldsWith, 3 })
		mapper('5', { ufo.closeFoldsWith, 4 })
		mapper('6', { ufo.closeFoldsWith, 5 })
		mapper('7', { ufo.closeFoldsWith, 6 })
	end

	local function end_navigation()
		-- vim.o.cursorcolumn = false
		vim.o.cursorlineopt = 'number'
		fn.restore_maps(saved_mappings, bufnr)
		vim.notify('Exiting ' .. vim.b[bufnr].ExtraMode or '' .. 'mode')
		vim.b[bufnr].ExtraMode = nil
	end

	mapper('q', end_navigation)
	mapper('<Esc>', end_navigation)
	mapper('<leader>F', end_navigation)
	mapper('<S-Space>F', end_navigation)

	vim.b[bufnr].ExtraMode = 'Fold'
	vim.notify('Entering ' .. vim.b[bufnr].ExtraMode .. 'mode')
end

MapSpaceCapital('n', 'F', start_navigation, 'Start Fold navigation mode')
