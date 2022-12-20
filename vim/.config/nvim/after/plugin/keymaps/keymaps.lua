Nmap('<C-CR>', 'g_', 'Go to end of line')

ICmap('<C-BS>', { Feedkeys, '<C-w>' }, 'Delete Word')
ICmap('<C-h>', '<C-w>', 'Delete Word')

Nmap('<esc>', '<esc>', 'Escape / no highlight', { callback = vim.cmd.noh })

Commander(
	'W',
	"execute 'w !sudo tee % > /dev/null' <bar> edit!",
	{ desc = ':W sudo saves the file' }
)
-- vim.api.nvim_create_user_command('W', "execute 'w !sudo tee >/dev/null %:p:S' | setl nomod", {})

-- nmap('<leader>w', { vim.api.nvim_exec, 'silent w', false }, 'Write File')
Nmap('<leader>w', vim.cmd.write, 'Write File')
Nmap('<leader>q', QuitLastBuffer, 'Close Buffer')
Nmap('<leader>Q', vim.cmd.quit, 'Quit')
Nmap('<S-Space>Q', vim.cmd.quit, 'Quit')
-- nmap('<leader>W', { vim.cmd.call, 'fn#save_and_load()' }, 'Save and reload File')
-- nmap('<S-Space>W', { vim.cmd.call, 'fn#save_and_load()' }, 'Save and reload File')
Nmap('<leader>W', SaveAndSource, 'Save and reload File')
Nmap('<S-Space>W', SaveAndSource, 'Save and reload File')
-- nmap('<leader><leader>w', FN(vim.cmd.call, 'fn#save_and_load()'))

Nmap('<A-m>', { Exec, 'w | ! %:p' }, 'Save and execute file')

-- add shebang
-- nmap('<leader>x', [[<cmd>w<bar>0r !echo '\#\!/usr/bin/bash'<CR>]])
-- nmap('<leader>x', CMD("w | !chmod u+x %<CR>:0r !echo '#!/usr/bin/bash'"))
-- nnoremap <leader>x <cmd>w<bar> :!chmod u+x %<CR>:0r !echo '\#\!/usr/bin/bash'<CR>

-- Nmap('<leader>x', '<cmd>!chmod u+x %<CR>', 'Make current file executable')
Nmap('<leader>x', { Exec, '!chmod u+x %' }, 'Make current file executable')

Nmap(
	'<leader>ss',
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	'Substitute word under cursor'
)

--==============================================================================
--                              |=> Folding <=|
--==============================================================================
-- nmap('za', 'zA', 'Fold toggle, including children')
-- nmap('zA', 'za', 'Fold toggle')
-- nmap('ZA', 'za', 'Fold toggle')

--==============================================================================
--                         |=> Blackhole Register <=|
--==============================================================================
-- nmap('x', '"_x')
-- nmap <leader>d "_d
-- nmap <leader>c "_c

--==============================================================================
--                              |=> Movement <=|
--==============================================================================
-- horizontal scrolling
Nmap('zh', '10zh')
Nmap('zl', '10zl')
-- nmap('<A-h>', '10zh')
-- nmap('<A-l>', '10zl')

Nmap('<C-d>', '<C-d>zz')
Nmap('<C-u>', '<C-u>zz')

-- Cursor movement in insert and command mode
ICmap('<A-h>', { Feedkeys, '<Left>' })
ICmap('<A-j>', { Feedkeys, '<Down>' })
ICmap('<A-k>', { Feedkeys, '<Up>' })
ICmap('<A-l>', { Feedkeys, '<Right>' })

-- Prev command in command mode
-- cmap('<C-j>', BindFeedkeys('<Down>'))
-- cmap('<C-k>', BindFeedkeys('<Up>'))
Cmap('<C-n>', { Feedkeys, '<Down>' })
Cmap('<C-p>', { Feedkeys, '<Up>' })

Nmap('A', 'A', 'Move to correct indentation, or normal A', {
	callback = function()
		local line_nr = vim.fn.line('.')
		if vim.fn.indent(line_nr) > 0 then return end

		local has_ts_indent, ts_indent = pcall(require, 'nvim-treesitter.indent')
		if not has_ts_indent then return end

		local total_indent = ts_indent.get_indent(line_nr)
		local indent_width = vim.bo.expandtab and vim.bo.shiftwidth or vim.bo.tabstop

		local tabs = total_indent / indent_width
		return string.format('A%s', Repeat('<tab>', tabs))
	end,
})
