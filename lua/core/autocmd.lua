local detect_indent = require('plugins.detect_indentation.detect_indentation').detect
Augroup('DetectIndent', {
	-- Autocmd('OptionSet', { 'expandtab', 'tabstop', 'shiftwidth' }, detect_indent),
	Autocmd('BufReadPost', detect_indent),
	Autocmd('BufNew', function(data) --
		NestedAutocmd(data, 'BufWritePost', '*', detect_indent, { once = true })
	end),
})

Augroup('Cmp', {
	-- Autocmd('CmdlineEnter', function(data) --
	-- 	P(data)
	-- 	NestedAutocmd(data, 'CmdlineChanged', '*', function(innerdata) --
	-- 		P(innerdata)
	-- 		local has_cmp, cmp = pcall(require, 'cmp')
	-- 		if not has_cmp then return end
	-- 		cmp.complete()
	-- 	end, { once = true })
	-- end),

	Autocmd('CmdlineChanged', function(data) --
		P(data)
	end),

	-- Autocmd({ 'TextChangedI', 'TextChangedP' }, function()
	-- 	local line = vim.api.nvim_get_current_line()
	-- 	local column = vim.api.nvim_win_get_cursor(0)[2]

	-- 	local current = string.sub(line, column, column + 1)
	-- 	if current == '.' or current == ',' or current == ' ' then require('cmp').close() end

	-- 	local before_line = string.sub(line, 1, column + 1)
	-- 	local after_line = string.sub(line, column + 1, -1)
	-- 	if not string.match(before_line, '^%s+$') then
	-- 		if
	-- 			after_line == ''
	-- 			or string.match(before_line, ' $')
	-- 			or string.match(before_line, '%.$')
	-- 		then
	-- 			require('cmp').complete()
	-- 		end
	-- 	end
	-- end),
}, true, false)

Augroup('FileTypes', {
	Autocmd({ 'BufNewFile', 'BufRead' }, '*.tmux', 'set filetype=tmux'),
	Autocmd({ 'BufNewFile', 'BufRead' }, '*.vim', 'set filetype=vim'),
	Autocmd({ 'BufNewFile', 'BufRead' }, '*.ron', 'set filetype=rust'),
	Autocmd(
		{ 'BufNewFile', 'BufRead' },
		{ '*.env', '*.profile', '*.rc', '*.login', '*.logout' },
		function() vim.bo.filetype = 'zsh' end
	),

	Autocmd('FileType', 'qf', function(data) vim.bo[data.buf].buflisted = false end),

	-- Autocmd('BufEnter', '*', function(data)
	-- 	if vim.bo[data.buf].filetype == 'help' then
	-- 		vim.cmd.wincmd('H')
	-- 		-- vim.
	-- 	end
	-- end),
	-- Autocmd('BufEnter','*', if &ft ==# 'help' | wincmd H | endif
})

Augroup('Testing', {
	Autocmd('BufAdd', { print, 'add' }),
	Autocmd('BufReadPre', { print, 'readpre' }),
	Autocmd('BufRead', { print, 'read' }),
	Autocmd('BufReadPost', { print, 'readpost' }),
	Autocmd('BufWinEnter', { print, 'winenter' }),
	Autocmd('BufEnter', { print, 'enter' }),
	Autocmd({ 'WinEnter', 'WinNew' }, function()
		-- P(data)
		local wins = vim.api.nvim_list_wins()
		-- P(wins)
	end),
}, true, false)

Augroup('Treesitter', {
	Autocmd({ 'WinEnter', 'InsertEnter', 'InsertLeave' }, function()
		vim.cmd.TSBufDisable('rainbow')
		-- vim.cmd.TSBufEnable('rainbow')
		nvim.schedule(vim.cmd.TSBufEnable, 'rainbow')
	end),

	Autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, function()
		-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
	end),
})

Augroup('AfterYank', { -- highlight yanked text
	Autocmd('TextYankPost', {
		vim.highlight.on_yank,
		{ higroup = 'Visual', on_macro = true, on_visual = false, timeout = 150 },
	}),
})

Augroup('Vimwiki', {
	Autocmd('FileType', 'vimwiki', function()
		vim.o.number = false
		vim.o.relativenumber = false
		vim.o.wrap = true
		vim.o.concealcursor = 'nc'
		vim.bo.buflisted = false
		-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
		-- Schedule(Exec, 'TSBufDisable highlight')
	end),

	Autocmd('BufWinEnter', '*.md', function(data)
		local ft = vim.api.nvim_buf_get_option(data.buf, 'filetype')
		if ft ~= 'vimwiki' then return end

		-- needs to be here because gitsigns gets lazyloaded
		require('gitsigns').detach(data.buf)
		require('cmp').setup.buffer { enabled = false }
	end),

	Autocmd('BufWinEnter', '*/daily_log/[0-9]*.md', function() vim.wo.winbar = false end),

	-- add date in vimwikiw
	Autocmd(
		'BufNewFile',
		'*/daily_log/[0-9]*.md',
		[[0r !echo "= $(date -d '%:t:r' +'\%A, \%b \%d') =\n"]]
	),

	-- -- autocmd({ 'BufNewFile', 'BufEnter' }, '*.md', function(data)
	-- -- 	local ft = vim.api.nvim_buf_get_option(data.buf, 'ft')
	-- -- 	-- local foldexpr = vim.api.nvim_buf_get_option(data.buf, 'foldexpr')
	-- -- 	if ft == 'vimwiki' then
	-- -- 		vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
	-- -- 		Exec('TSBufDisable highlight')
	-- -- 		-- Schedule(Exec, 'TSBufDisable highlight')
	-- -- 	end
	-- -- end),
})

Augroup('AutoSource', {
	-- Autocmd('BufWritePost', '*.lua', 'so %'),
	-- Autocmd('BufWritePost', '*.lua', 'so $HOME/.config/nvim/init.lua'),
}, true, false)

Augroup('NoComment', {
	Autocmd({ 'BufEnter', 'InsertEnter', 'InsertLeave' }, function() --
		vim.opt.formatoptions:remove { 'c', 'r', 'o' }
	end),
})

local function printer(data)
	WriteToSplit(data.event)
	WriteToSplit(data.match)
	WriteToSplit(data.buf)
	WriteToSplit('')
end

Augroup('AutocmdTester', {
	Autocmd({
		'BufWinLeave',
		'BufWinEnter',

		'BufAdd',
		'BufDelete',
		'BufEnter',
		'BufLeave',
		'BufHidden',
		'BufNew',
		'BufRead',

		'WinNew',
		'WinEnter',
		'WinLeave',
		'WinClosed',
	}, printer),
	-- Autocmd('BufWinLeave', '*', printer),
	-- Autocmd('BufWinEnter', '*', printer),

	-- Autocmd('BufAdd', '*', printer),
	-- Autocmd('BufDelete', '*', printer),
	-- Autocmd('BufEnter', '*', printer),
	-- Autocmd('BufLeave', '*', printer),
	-- Autocmd('BufHidden', '*', printer),
	-- Autocmd('BufNew', '*', printer),
	-- Autocmd('BufRead', '*', printer),

	-- Autocmd('WinNew', '*', printer),
	-- Autocmd('WinEnter', '*', printer),
	-- Autocmd('WinLeave', '*', printer),
	-- Autocmd('WinClosed', '*', printer),
}, true, false)

vim.o.updatetime = 500 -- used for CursorHold
local line_numbers = require('modules.line_numbers')
Augroup('renu', {
	Autocmd('CursorHold', line_numbers.renu_autocmd(true)),
	Autocmd('CursorMoved', line_numbers.renu_autocmd(false)),

	Autocmd('CursorMoved', function()
		-- local start = vim.fn.line('w0')
		-- local is_fold_before = vim.fn.foldclosed(start - 1)
		-- local is_fold_after = vim.fn.foldclosed(start)
		-- if is_fold_before > 0 or is_fold_after > 0 then
		-- 	-- print('is fold', start)
		-- 	vim.g.neovide_scroll_animation_length = 0
		-- else
		-- 	vim.g.neovide_scroll_animation_length = 0.5
		-- end

		-- local line = vim.fn.line('w0')
		-- local line = vim.fn.col('w0')
		-- local col = vim.api.nvim_win_get_width(0)
		-- local pos = vim.api.nvim_win_get_position(0)
		-- -- P(config)
		-- -- P(pos)

		-- local winid = vim.api.nvim_get_current_win()
		-- local info = vim.fn.getwininfo(winid)[1]
		-- local editor_size = info.width - info.textoff
		-- -- print(editor_size)
		-- P(info)

		-- local end_ = vim.fn.line('w$')
		-- print(start, end_)
	end),
})

Augroup('Misc', {
	Autocmd('BufReadPost', function()
		local line = vim.fn.line('\'"')
		-- if line > 1 and line <= vim.fn.line('$') then Normal('g\'"') end

		-- Return to last edit position when opening files
		-- autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	end),

	-- Reload file when it has been changed from outside
	Autocmd({
		'InsertEnter',
		'FocusGained',
		'BufEnter',
		'BufWinEnter',
		'WinEnter',
		'CursorHold',
		'CursorHoldI',
	}, function()
		if Util.is_cmdwin() then return end
		vim.cmd.checktime()
	end),
})

---@module 'column_line'
local has_column_line , column_line = pcall(require, 'column_line')
if has_column_line then
Augroup('ColumnLine', {
	Autocmd('OptionSet', 'colorcolumn', column_line.refresh),
	Autocmd({
		'FileChangedShellPost',
		'TextChanged',
		'TextChangedI',
		'CompleteChanged',
		'VimEnter',
		'SessionLoadPost',
		'BufWinEnter',
		'WinEnter',
	}, function()
		-- if require('development.helpers').is_cmdwin() then return end
		column_line.refresh()
	end),
})
end

---------------------------------------------Commandline--------------------------------------------

Augroup('CommandlineWindow', {
	Autocmd('CmdlineEnter', function() vim.o.cmdheight = 1 end),
	Autocmd('CmdlineLeave', function() vim.o.cmdheight = 0 end),

	Autocmd('CmdwinLeave', function()
		vim.cmd.TSContextEnable()
		-- RestoreAugroup('NoCmdWinHere')
		-- RestoreAugroup('ColumnLine')
	end),

	Autocmd('CmdwinEnter', 'startinsert'),
	Autocmd('CmdwinEnter', function()
		-- DeleteAugroup('NoCmdWinHere')
		-- DeleteAugroup('ColumnLine')

		nvim.schedule(function()
			-- P(data)
			vim.o.cmdheight = 0
			vim.g.neovide_scroll_animation_length = 0

			local opts = { buffer = true, silent = false }
			Nmap(';', ':', '', opts)

			Nmap('<C-k>', vim.cmd.quit, '', opts)
			Nmap('q', vim.cmd.quit, '', opts)
			Nmap('<C-;>', vim.cmd.quit, '', opts)
			Nmap('<leader>;', vim.cmd.quit, '', opts)
			Imap('<C-;>', function()
				nvim.feedkeys('<Esc>')
				vim.cmd.quit()
			end, '', opts)

			vim.cmd.TSContextDisable()
			vim.cmd.TSBufDisable('highlight')

			nvim.defer(200, function() vim.g.neovide_scroll_animation_length = 0.5 end)
		end)
	end),
})
