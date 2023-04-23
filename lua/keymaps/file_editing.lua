Map.n('<leader>w', function() pcall(vim.api.nvim_exec, 'silent w', false) end, 'Write File')
-- Nmap('<leader>w', vim.cmd.write, 'Write File')
Map.n('<leader>q', Util.quit_last_buffer, 'Close Buffer')

-- NOTE: use <C-w>q or <C-w>c instead
-- Nmap('<leader>Q', { pcall, vim.cmd.close }, 'Quit')
-- Nmap('<S-Space>Q', { pcall, vim.cmd.close }, 'Quit')

-- nmap('<leader>W', { vim.cmd.call, 'fn#save_and_load()' }, 'Save and reload File')
-- nmap('<S-Space>W', { vim.cmd.call, 'fn#save_and_load()' }, 'Save and reload File')
Map.n('<leader>W', Util.save_and_source, 'Save and reload File')
Map.n('<S-Space>W', Util.save_and_source, 'Save and reload File')
-- nmap('<leader><leader>w', FN(vim.cmd.call, 'fn#save_and_load()'))

Map.n('<A-m>', { nvim.exec, 'w | ! %:p' }, 'Save and execute file')

-- add shebang
-- nmap('<leader>x', [[<cmd>w<bar>0r !echo '\#\!/usr/bin/bash'<CR>]])
-- nmap('<leader>x', CMD("w | !chmod u+x %<CR>:0r !echo '#!/usr/bin/bash'"))
-- nnoremap <leader>x <cmd>w<bar> :!chmod u+x %<CR>:0r !echo '\#\!/usr/bin/bash'<CR>

-- Nmap('<leader>x', '<cmd>!chmod u+x %<CR>', 'Make current file executable')
Map.n('<leader>x', { nvim.exec, '!chmod u+x %' }, 'Make current file executable')
