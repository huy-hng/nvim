local maps = require 'helpers.keymaps'
local nor = maps.nor

local harpoon_ui   = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
local harpoon_term = require('harpoon.term')

local harpoon_prefix = '<leader>h'
nor(harpoon_prefix .. 'h', harpoon_ui.toggle_quick_menu, 'Open Harpoon')
nor(harpoon_prefix .. 'a', harpoon_mark.add_file, 'Add file')
nor(harpoon_prefix .. 'c', require('harpoon.cmd-ui').toggle_quick_menu, '')

-- nor('<C-1>', harpoon_ui.nav_file(1), '')
-- nor('<C-2>', harpoon_ui.nav_file(2), '')
-- nor('<C-3>', harpoon_ui.nav_file(3), '')
-- nor('<C-4>', harpoon_ui.nav_file(4), '')
-- nor('<C-5>', harpoon_ui.nav_file(5), '')
-- nor('<C-^>', harpoon_ui.nav_file(6), '')
-- nor('<C-7>', harpoon_ui.nav_file(7), '')
-- nor('<C-8>', harpoon_ui.nav_file(8), '')
-- nor('<C-9>', harpoon_ui.nav_file(9), '')
-- nor('<C-0>', harpoon_term.gotoTerminal(1), '')

