---@diagnostic disable: lowercase-global
local dev = require('modules.development')
nrequire = dev.nrequire
npcall = dev.npcall
I = vim.inspect
P = vim.pretty_print
R = dev.reload_require
LOADED = dev.loaded
RESET = dev.reset
RELOAD = dev.reload


local tryer = require('modules.error_handling')
Try = tryer.try
TryWrap = tryer.try_wrap


pcall(require, 'convenient_lua')

Util = require('modules.utils')
Types = require('modules.types')

nvim = require('modules.nvim_wrappers')
F = vim.F


local keymappers = require('modules.keymappers')
MapCreator = keymappers.map_creator
MapSpaceCapital = keymappers.map_space_capital
Unmap = vim.keymap.del
Map = keymappers.map_creator { 'n', 'v', 'o' }

Nmap = keymappers.map_creator('n') -- actually nnoremap, everything below as well
NVmap = keymappers.map_creator { 'n', 'v' }
Vmap = keymappers.map_creator('v') -- visual and select
Imap = keymappers.map_creator('i')
ICmap = keymappers.map_creator('!') -- insert and commandline
Cmap = keymappers.map_creator('c') -- commandline
Smap = keymappers.map_creator('s') -- select mode
Xmap = keymappers.map_creator('x') -- only visual mode
Omap = keymappers.map_creator('o') -- operator pending mode
Tmap = keymappers.map_creator('t') -- terminal

local au = require('modules.autocommander')
Autocmd = au.autocmd
CreateAutocmd = au.createAutocmd
NestedAutocmd = au.nestedAutocmd
Augroup = au.augroup
CreateaAugroup = au.CreateaAugroup
RestoreAugroup = au.restoreAugroup
DeleteAugroup = au.deleteAugroup

-- nvim = vim.api
