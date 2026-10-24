DEBUG_PRINT = true

Util = require('utils')
local dev = require('development')
P = dev.print
nrequire = dev.require

Map = require('keymap.map')
Keys = require('keymap.keys')
require('keymap.colemak').set_keymap()
require('keymap.basics')

require('plugins.lazy')

vim.cmd.colorscheme('catppuccin-mocha')
