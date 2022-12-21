Nmap('%', MatchCharacter, 'Jump to matching quote or whatever')
Nmap('<leader>m', '<cmd>50message<cr>', 'Show Messages')

MapSpaceCapital('n', 'M', '<cmd>message<cr>', 'Show Messages')
Nmap('<leader><leader>M', { vim.cmd.messages, 'clear' }, 'Clear Messages')

-- Nmap('\\9', ReloadAll)

Nmap('<leader>z', vim.cmd.ZenMode, 'Zen Mode')
Nmap('<leader>Z', vim.cmd.Twilight, 'Twilight')
Nmap('<F5>', vim.cmd.UndotreeToggle, 'Undo Tree')
Nmap('<A-e>', vim.cmd.RnvimrToggle, 'Open Ranger')
