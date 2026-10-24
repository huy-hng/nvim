local map = Map.new('<leader>n', '', '[Neorg]')
local open_popup = R('plugins.editor.neorg.float').open_popup

map.n('n', vim.cmd.Neorg, 'Main Menu')
map.n('e', open_popup(), 'Open last view')

map.n('b', { vim.cmd.Neorg, 'index' }, 'Open Index')
map.n('i', open_popup('index'), 'Float Index')

map.n('j', { vim.cmd.Neorg, 'journal' }, 'Journal Menu')

map.n('t', open_popup('journal', 'today'), 'Float Todays Journal')
map.n('d', { vim.cmd.Neorg, 'journal', 'today' }, 'Todays Journal')

map.n('y', open_popup('journal', 'yesterday'), 'Float Yesterdays Journal')
