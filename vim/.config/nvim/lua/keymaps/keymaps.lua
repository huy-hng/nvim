nmap('<esc>', function()
	Feedkeys('<esc>')
	vim.cmd.noh()
end)

local function buffers_opened()
	return vim.fn.len(vim.fn.getbufinfo { buflisted = 1 })
end

local function quit_last_buffer()
	if buffers_opened() == 1 then
		Exec('q')
	end
	Exec('Bdelete')
end

-- :W sudo saves the file
vim.api.nvim_create_user_command('W', "execute 'w !sudo tee % > /dev/null' <bar> edit!", {})
-- vim.api.nvim_create_user_command('W', "execute 'w !sudo tee >/dev/null %:p:S' | setl nomod", {})


nmap('<leader>w', CMD('w'))
nmap('<leader>q', quit_last_buffer)
nmap('<leader>Q', CMD('q'))
nmap('<leader>W', FN(vim.cmd.call, 'fn#save_and_load()'))
-- nmap('<leader><leader>w', FN(vim.cmd.call, 'fn#save_and_load()'))


nmap('<leader>x', CMD("w | !chmod u+x %<CR>:0r !echo '#!/usr/bin/bash'"))
-- nnoremap <leader>x <cmd>w<bar> :!chmod u+x %<CR>:0r !echo '\#\!/usr/bin/bash'<CR>



--==============================================================================
--                              |=> Folding <=|
--==============================================================================
-- nmap('za', 'zA', 'Fold toggle, including children')
-- nmap('zA', 'za', 'Fold toggle')
-- nmap('ZA', 'za', 'Fold toggle')

nmap('x', '"_x')
-- nmap <leader>d "_d
-- nmap <leader>c "_c
