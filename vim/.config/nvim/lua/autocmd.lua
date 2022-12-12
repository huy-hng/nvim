---@diagnostic disable: lowercase-global
-- autocmd(event, pattern, {cmd: string}|{fn: fn|table}, {*opts})
-- autocmd(event, nil, cmd|fn, {*opts})
-- autocmd(event, nil, cmd|fn)
-- autocmd(event, cmd|fn) <-- works only when the third argument is empty
function autocmd(events, pattern, command, opts)
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
		opts.callback = ExtractFnFromTable(command)
	else
		opts.callback = command
	end

	opts.pattern = pattern
	return { events, opts }
end

function create_autocmd(group, cmd)
	cmd[2].group = group
	vim.api.nvim_create_autocmd(cmd[1], cmd[2])
end

function nested_autocmd(data, events, pattern, command, opts)
	local cmd = autocmd(events, pattern, command, opts)
	create_autocmd(data.group, cmd)
end

function augroup(name, clear, autocmds)
	local group = vim.api.nvim_create_augroup(name, { clear = clear })
	for _, cmd in ipairs(autocmds) do
		create_autocmd(group, cmd)
	end
end

vim.o.updatetime = 2000
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

augroup('renu', true, {
	-- autocmd('CursorHold', renu(true)),
	-- autocmd('CursorMoved', renu(false)),
	-- autocmd('ModeChanged', renu(false)),
})

augroup('FileTypes', true, {
	autocmd({ 'BufNewFile', 'BufRead' }, '*.tmux', 'set filetype=tmux'),
	autocmd({ 'BufNewFile', 'BufRead' }, '*.vim', 'set filetype=vim'),
	autocmd({ 'BufNewFile', 'BufRead' }, '*.ron', 'set filetype=rust'),
	--stylua: ignore
	autocmd({ 'BufNewFile', 'BufRead' }, { '*.env', '*.profile', '*.rc', '*.login', '*.logout'},
		'set filetype=bash'), -- callback = vim.opt_local.filetype()
})

augroup('Testing', true, {
	-- autocmd('BufAdd', { print, 'add' }),
	-- autocmd('BufReadPre', { print, 'readpre' }),
	-- autocmd('BufRead', { print, 'read' }),
	-- autocmd('BufReadPost', { print, 'readpost' }),
	-- autocmd('BufWinEnter', { print, 'winenter' }),
	-- autocmd('BufEnter', { print, 'enter' }),
	autocmd({ 'WinEnter', 'WinNew' }, function(data)
		-- P(data)
		local wins = vim.api.nvim_list_wins()
		-- P(wins)
	end),
})

augroup('TS_FOLD_WORKAROUND', false, {
	autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, function()
		-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
	end),
})

-- highlight yanked text
augroup('AfterYank', true, {
	--stylua: ignore
	autocmd( 'TextYankPost',
		FN(vim.highlight.on_yank, { higroup = 'Visual', on_visual = false, timeout = 150 })
	),
})

augroup('Vimwiki', true, {
	autocmd('FileType', 'vimwiki', function()
		require('cmp').setup.buffer { enabled = false }
		vim.o.number = false
		vim.o.relativenumber = false

		vim.o.concealcursor = 'nc'
		-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
		-- Schedule(Exec, 'TSBufDisable highlight')
	end),

	-- add date in vimwikiw
	autocmd(
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

augroup('CommandlineWindow', true, {
	autocmd('CmdwinLeave', function() Exec('TSContextEnable') end),
	autocmd('CmdwinEnter', function()
		local opts = { buffer = true }
		nmap('<esc>', vim.cmd.quit, '', opts)
		-- nmap('<esc>', '<cmd>q<CR>', '', opts)
		nmap(';', ':', '', opts)
		Exec('TSContextDisable')
	end),

	autocmd('CmdlineEnter', function() vim.o.cmdheight = 1 end),
	autocmd('CmdlineLeave', function(data)
		vim.o.cmdheight = 0

		-- if vim.v.event.abort then
		-- 	vim.o.cmdheight = 0
		-- 	return
		-- end
		-- Defer(4000, function() vim.o.cmdheight = 0 end)
	end),
})

augroup('AutoSource', true, {
	-- autocmd('BufWritePost', '*.lua', 'so %'),
	-- autocmd('BufWritePost', '*.lua', 'so $HOME/.config/nvim/init.lua')
})

vim.cmd([[
set autoread

":h cmdwin
" function! CommandWindowCollapse(collapse=0)
" 	augroup CommandlineWindow 
" 		autocmd!
" 		
" 		autocmd CmdwinEnter * nnoremap <buffer> <ESC> <cmd>q<CR>
" 		autocmd CmdwinEnter * nnoremap <buffer> ; :
" 		autocmd CmdwinEnter * TSContextDisable
" 		autocmd CmdwinLeave * TSContextEnable
" 		autocmd CmdlineEnter * set cmdheight=1
" 		autocmd CmdlineLeave * set cmdheight=0
" 		" autocmd CmdwinEnter [/?]  startinsert
" 	augroup END
" 	if (a:collapse == 1)
" 		autocmd! CommandlineWindow
" 		set cmdheight=1
" 	endif
" endfunction

" call CommandWindowCollapse(0)

augroup somegroup
	autocmd!


	" Set to auto read when a file is changed from the outside
	" autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

	" Return to last edit position when opening files
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

augroup NoComment
	autocmd!
	autocmd BufEnter * :set formatoptions-=cro
	autocmd InsertEnter * :set formatoptions-=cro
	autocmd InsertLeave * :set formatoptions-=cro
augroup END


" augroup filetypes
" 	autocmd!
" 	autocmd BufNewFile,BufRead *.env     set filetype=bash
" 	autocmd BufNewFile,BufRead *.profile set filetype=bash
" 	autocmd BufNewFile,BufRead *.rc      set filetype=bash
" 	autocmd BufNewFile,BufRead *.login   set filetype=bash
" 	autocmd BufNewFile,BufRead *.logout  set filetype=bash

" 	autocmd BufNewFile,BufRead *.tmux    set filetype=tmux
" 	autocmd BufNewFile,BufRead *.vim     set filetype=vim

" 	autocmd BufNewFile,BufRead *.ron     set filetype=rust
" augroup END
]])
