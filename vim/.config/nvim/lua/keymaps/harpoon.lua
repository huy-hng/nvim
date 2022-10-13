local harpoon_ui   = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
local harpoon_term = require('harpoon.term')

local harpoon_prefix = '<leader>h'
nmap(harpoon_prefix .. 'h', harpoon_ui.toggle_quick_menu, 'Open Harpoon')
nmap(harpoon_prefix .. 'a', harpoon_mark.add_file, 'Add file')
nmap(harpoon_prefix .. 'c', require('harpoon.cmd-ui').toggle_quick_menu, '')

-- nmap('<C-1>', harpoon_ui.nav_file(1), '')
-- nmap('<C-2>', harpoon_ui.nav_file(2), '')
-- nmap('<C-3>', harpoon_ui.nav_file(3), '')
-- nmap('<C-4>', harpoon_ui.nav_file(4), '')
-- nmap('<C-5>', harpoon_ui.nav_file(5), '')
-- nmap('<C-^>', harpoon_ui.nav_file(6), '')
-- nmap('<C-7>', harpoon_ui.nav_file(7), '')
-- nmap('<C-8>', harpoon_ui.nav_file(8), '')
-- nmap('<C-9>', harpoon_ui.nav_file(9), '')
-- nmap('<C-0>', harpoon_term.gotoTerminal(1), '')

