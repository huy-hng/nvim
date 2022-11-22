NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'

local map = vim.keymap.set
local unmap = vim.keymap.del
local o = vim.o
local g = vim.g
local go = vim.go

require('core.keymaps')
-- local require_dir = require 'helpers.require_dir'
-- require_dir 'lua/core'

g.mapleader = ' '

-- unmap('n', 'q')

map('n', ';', ':')
map('n', '<leader>w', '<cmd>w<cr>')
map('n', '<leader>q', '<cmd>q<cr>')

vim.go.laststatus = 3

-- local path = NVIM_CONFIG_PATH .. 'vim/'
-- local maps_path = path .. 'key_bindings/'
-- local plugins_path = path .. 'plugins/'

-- vim.cmd.source(plugins_path .. 'startify.vim')

-- if vim.g.neovide then
-- 	require('neovide')
-- end
