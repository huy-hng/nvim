---@diagnostic disable: lowercase-global
local dev = require('modules.development')
Dev = dev
require_dir = require('modules.require_dir')
nrequire = dev.nrequire
npcall = dev.npcall
I = vim.inspect
P = vim.print
PrintKeys = dev.print_keys
R = dev.reload_require
LOADED = dev.loaded
RELOAD = dev.reload

local error_handler = require('modules.error_handling')
Try = error_handler.try
TryWrap = error_handler.try_wrap

Util = require('modules.utils')

nvim = require('modules.nvim_wrappers')
F = vim.F

DEBUG = vim.log.levels.DEBUG
INFO = vim.log.levels.INFO
WARN = vim.log.levels.WARN
ERROR = vim.log.levels.ERROR

require('modules.lua_extension')
Map = require('modules.keymap.map')

local mappers = require('modules.keymap.mappers')
Map.create = mappers.map_creator
Map.parse = mappers.parse_map

MapSpaceCapital = mappers.map_space_capital

local au = require('modules.autocommander')
Autocmd = au.autocmd
CreateAutocmd = au.createAutocmd
NestedAutocmd = au.nestedAutocmd
Augroup = au.augroup
CreateAugroup = au.createAugroup
RestoreAugroup = au.restoreAugroup
DeleteAugroup = au.deleteAugroup
