local nmap = Map.create('n', '<leader>n', '[Neorg]')

nmap('n', vim.cmd.Neorg, 'Main Menu')
nmap('i', { vim.cmd.Neorg, 'index' }, 'Open Index')
nmap('j', { vim.cmd.Neorg, 'journal' }, 'Journal Menu')
nmap('k', { vim.cmd.Neorg, 'journal', 'today' }, 'Journal Menu')
