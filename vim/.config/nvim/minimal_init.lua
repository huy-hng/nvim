local require_dir = require 'helpers.require_dir'
require_dir 'lua/core'

local cmd = require('helpers.wrappers').cmd
nmap('<leader>w', cmd 'w')

vim.go.laststatus = 3
