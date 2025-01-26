DEBUG_PRINT = true

Util = require('utils')
local dev = require('development')
P = dev.print
nrequire = dev.require

Map = require('keymap.map')
Keys = require('keymap.keys')
require('keymap.colemap').set_keymap()


require('plugins.lazy')

vim.cmd.colorscheme('catppuccin-mocha')
