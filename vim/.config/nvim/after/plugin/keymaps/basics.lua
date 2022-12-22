ICmap('<C-BS>', { Feedkeys, '<C-w>' }, 'Delete Word')
ICmap('<C-h>', '<C-w>', 'Delete Word')

Nmap('<esc>', '<esc>', 'Escape / no highlight', { callback = vim.cmd.noh, nowait = true })
