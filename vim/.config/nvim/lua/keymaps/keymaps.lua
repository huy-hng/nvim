nmap('<C-CR>', 'g_', 'Go to end of line')
icmap('<C-BS>', BindFeedkeys('<C-w>'), 'Delete Word')
icmap('<C-h>', '<C-w>', 'Delete Word')

nmap('<space>', '<nop>')
nmap('<S-SPACE>', '<nop>')
nmap('<C-SPACE>', '<nop>')

nmap('<esc>', function()
	Feedkeys('<esc>')
	vim.cmd.noh()
	if CurrentFloatWinId then
		pcall(vim.api.nvim_win_close, CurrentFloatWinId, false)
		CurrentFloatWinId = nil
	end
end)

local function buffers_opened()
	return vim.fn.len(vim.fn.getbufinfo { buflisted = 1 })
end

local function quit_last_buffer()
	if buffers_opened() == 1 then Exec('q') end
	Exec('Bdelete')
end

-- :W sudo saves the file
vim.api.nvim_create_user_command('W', "execute 'w !sudo tee % > /dev/null' <bar> edit!", {})
-- vim.api.nvim_create_user_command('W', "execute 'w !sudo tee >/dev/null %:p:S' | setl nomod", {})

-- make file executable
nmap('<leader>x', [[<cmd>w<bar> :!chmod u+x %<CR>:0r !echo '\#\!/usr/bin/bash'<CR>]])

nmap('<leader>w', CMD('w'), 'Write File')
nmap('<leader>q', quit_last_buffer, 'Close Buffer')
nmap('<leader>Q', CMD('q'), 'Quit')
nmap('<S-Space>Q', CMD('q'), 'Quit')
nmap('<leader>W', FN(vim.cmd.call, 'fn#save_and_load()'), 'Save and reload File')
-- nmap('<leader><leader>w', FN(vim.cmd.call, 'fn#save_and_load()'))

nmap('<leader>x', CMD("w | !chmod u+x %<CR>:0r !echo '#!/usr/bin/bash'"))
-- nnoremap <leader>x <cmd>w<bar> :!chmod u+x %<CR>:0r !echo '\#\!/usr/bin/bash'<CR>

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
nmap('<A-h>', '10zh')
nmap('<A-l>', '10zl')
-- nmap('<A-H>', 'zH')
-- nmap('<A-L>', 'zL')

-- causes weird behavior in neovide >10.0.1
-- nmap('<C-d>', '<C-d>zz')
-- nmap('<C-u>', '<C-u>zz')

-- Cursor movement in insert and command mode
icmap('<A-h>', BindFeedkeys('<Left>'))
icmap('<A-j>', BindFeedkeys('<Down>'))
icmap('<A-k>', BindFeedkeys('<Up>'))
icmap('<A-l>', BindFeedkeys('<Right>'))

-- Prev command in command mode
cmap('<C-j>', BindFeedkeys('<Down>'))
cmap('<C-k>', BindFeedkeys('<Up>'))
