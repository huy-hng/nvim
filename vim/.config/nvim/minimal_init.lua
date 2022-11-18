local map = vim.keymap.set
local unmap = vim.keymap.del
local o = vim.o
local g = vim.g
local go = vim.go


-- local require_dir = require 'helpers.require_dir'
-- require_dir 'lua/core'


g.mapleader = ' '

-- unmap('n', 'q')

map('n', ';', ':')
map('n', '<leader>w', '<cmd>w<cr>')
map('n', '<leader>q', '<cmd>q<cr>')

vim.go.laststatus = 3
