---@diagnostic disable: lowercase-global
local dev = require('modules.development')
Dev = dev
require_dir = require('modules.require_dir')
nrequire = dev.nrequire
npcall = dev.npcall
I = vim.inspect
P = vim.pretty_print
PrintKeys = dev.print_keys
R = dev.reload_require
LOADED = dev.loaded
RELOAD = dev.reload

local tryer = require('modules.error_handling')
Try = tryer.try
TryWrap = tryer.try_wrap

Util = require('modules.utils')

nvim = require('modules.nvim_wrappers')
F = vim.F

DEBUG = vim.log.levels.DEBUG
INFO = vim.log.levels.INFO
WARN = vim.log.levels.WARN
ERROR = vim.log.levels.ERROR

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
CreateAugroup = au.createAugroup
RestoreAugroup = au.restoreAugroup
DeleteAugroup = au.deleteAugroup
