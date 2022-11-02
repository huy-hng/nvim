local status, wk = pcall(require, 'which-key')
if not status then return end

local wrappers = require 'helpers.wrappers'
local cmd = wrappers.cmd

----------------------------------------
--           -> Plugins <-
----------------------------------------
local nt_api = require("nvim-tree.api")
nmap('<C-e>', function() nt_api.tree.toggle(true) end, 'Toggle Nvim Tree')

nmap('<leader>?', cmd('Limelight!!'), 'Toggle Limelight')
nmap('<leader>S', cmd('Startify'), 'Open Start Screen')

----------------------------------------
--             -> LSP <-
----------------------------------------
wk.register({['<leader>l'] = {name = '+LSP'}})
