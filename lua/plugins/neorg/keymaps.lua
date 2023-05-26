local nmap = Map.create('n', '<leader>n', '[Neorg]')
local open_popup = R('plugins.neorg.float').open_popup

nmap('n', vim.cmd.Neorg, 'Main Menu')
nmap('e', open_popup(), 'Open last view')

nmap('b', { vim.cmd.Neorg, 'index' }, 'Open Index')
nmap('i', open_popup('index'), 'Float Index')

nmap('j', { vim.cmd.Neorg, 'journal' }, 'Journal Menu')

nmap('t', open_popup('journal', 'today'), 'Float Journal')
nmap('d', { vim.cmd.Neorg, 'journal', 'today' }, 'Todays Journal')


