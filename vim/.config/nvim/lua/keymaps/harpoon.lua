local fn = require('helpers.wrappers').fn

local harpoon_ui   = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
local harpoon_term = require('harpoon.term')

local harpoon_prefix = '<leader>a'
nmap(harpoon_prefix .. 'h', harpoon_ui.toggle_quick_menu, 'Open Harpoon')
nmap(harpoon_prefix .. 'a', harpoon_mark.add_file, 'Add file')
nmap(harpoon_prefix .. 'c', require('harpoon.cmd-ui').toggle_quick_menu, '')

nmap('<leader>1', fn(harpoon_ui.nav_file, 1))
nmap('<leader>2', fn(harpoon_ui.nav_file, 2))
nmap('<leader>3', fn(harpoon_ui.nav_file, 3))
nmap('<leader>4', fn(harpoon_ui.nav_file, 4))
nmap('<leader>5', fn(harpoon_ui.nav_file, 5))
nmap('<leader>6', fn(harpoon_ui.nav_file, 6))
nmap('<leader>7', fn(harpoon_ui.nav_file, 7))
nmap('<leader>8', fn(harpoon_ui.nav_file, 8))
nmap('<leader>9', fn(harpoon_ui.nav_file, 9))
nmap('<leader>0', fn(harpoon_term.gotoTerminal, 1))

