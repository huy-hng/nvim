Nmap('<leader>w', function() pcall(vim.api.nvim_exec, 'silent w', false) end, 'Write File')
-- Nmap('<leader>w', vim.cmd.write, 'Write File')
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

