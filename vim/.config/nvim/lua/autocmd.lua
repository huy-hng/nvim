-- TODO reactor this to development?

-- autocmd(event, pattern, {cmd: string}|{fn: fn|table}, {*opts})
-- autocmd(event, nil, cmd|fn, {*opts})
-- autocmd(event, nil, cmd|fn)
-- autocmd(event, cmd|fn) <-- works only when the third argument is empty
function Autocmd(events, pattern, command, opts)
	-- group: string | integer
	-- callback: fn | command: string
	-- pattern: string | array
	-- buffer: int
	-- desc: string
	-- once: bool
	-- nested: bool
	opts = opts or {}

	if command == nil then
		command = pattern
		pattern = nil
	end

	if type(command) == 'string' then
		opts.command = command
	elseif type(command) == 'table' then
		opts.callback = ExtractFnFromTable(command, 3)
	else
		opts.callback = command
	end

	opts.pattern = pattern
	return { events, opts }
end

function CreateAutocmd(events, pattern, command, opts)
	local cmd = Autocmd(events, pattern, command, opts)
	vim.api.nvim_create_autocmd(cmd[1], cmd[2])
end

function NestedAutocmd(data, events, pattern, command, opts)
	opts.group = data.group
	CreateAutocmd(events, pattern, command, opts)
end

function Augroup(name, autocmds, clear, active)
	-- print(name, clear, active)
	local group = vim.api.nvim_create_augroup(name, { clear = clear or true })
	if active == false then return end
	for _, cmd in ipairs(autocmds) do
		cmd[2].group = group
		vim.api.nvim_create_autocmd(cmd[1], cmd[2])
	end
end

function CreateAugroup(name, clear) vim.api.nvim_create_augroup(name, { clear = clear }) end

vim.o.updatetime = 2000

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

	Autocmd('FileType', 'qf', function(data)
		vim.bo[data.buf].buflisted = false
	end)

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
	Autocmd({ 'WinEnter', 'WinNew' }, function(data)
		-- P(data)
		local wins = vim.api.nvim_list_wins()
		-- P(wins)
	end),
}, true, false)

Augroup('TS_FOLD_WORKAROUND', {
	Autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, function()
		-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
	end),
})

Augroup('AfterYank', { -- highlight yanked text
	--stylua: ignore
	Autocmd( 'TextYankPost',
		FN(vim.highlight.on_yank, { higroup = 'Visual', on_visual = false, timeout = 150 })
	),
})

Augroup('Vimwiki', {
	Autocmd('FileType', 'vimwiki', function(data)
		-- vim.o.number = false
		vim.o.relativenumber = false
		vim.o.wrap = true
		vim.o.concealcursor = 'nc'
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

	-- autocmd('BufWinEnter', 'vimwiki', function(data)
	-- end),

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

Augroup('CommandlineWindow', {
	Autocmd('CmdwinLeave', function() Exec('TSContextEnable') end),
	Autocmd('CmdwinEnter', function()
		local opts = { buffer = true }
		nmap('<esc>', vim.cmd.quit, '', opts)
		-- nmap('<esc>', '<cmd>q<CR>', '', opts)
		nmap(';', ':', '', opts)
		Exec('TSContextDisable')
	end),

	-- autocmd('CmdlineEnter', function() vim.o.cmdheight = 1 end),
	-- autocmd('CmdlineLeave', function(data)
	-- 	vim.o.cmdheight = 0
	-- 	-- if vim.v.event.abort then
	-- 	-- 	vim.o.cmdheight = 0
	-- 	-- 	return
	-- 	-- end
	-- 	-- Defer(4000, function() vim.o.cmdheight = 0 end)
	-- end),
})

Augroup('AutoSource', {
	Autocmd('BufWritePost', '*.lua', 'so %'),
	Autocmd('BufWritePost', '*.lua', 'so $HOME/.config/nvim/init.lua'),
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

local function renu(on)
	return function()
		if not vim.o.number then
			vim.o.relativenumber = false
			return
		end

		if on and not vim.o.relativenumber then
			-- print(vim.o.relativenumber)
			vim.o.relativenumber = true
		elseif vim.o.relativenumber then
			vim.o.relativenumber = false
		end
	end
end

Augroup('renu', {
	Autocmd('CursorHold', renu(true)),
	Autocmd('CursorMoved', renu(false)),
	Autocmd('ModeChanged', renu(false)),
}, true, false)

Augroup('Misc', {
	Autocmd('BufReadPost', function(data)
		local line = vim.fn.line('\'"')
		-- if line > 1 and line <= vim.fn.line('$') then Normal('g\'"') end

		-- Return to last edit position when opening files
		-- autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	end),

	-- Set to auto read when a file is changed from the outside
	Autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, function(data)
		if vim.fn.mode() ~= 'c' then vim.cmd.checktime() end
	end),
})
