local status, wk = pcall(require, 'which-key')
if not status then return end

local maps = require 'helpers.keymaps'
local nor = maps.nor

local wrappers = require 'helpers.wrappers'
local cmd = wrappers.cmd

----------------------------------------
--           -> Plugins <-
----------------------------------------
local nt_api = require("nvim-tree.api")
nor('<C-e>', function() nt_api.tree.toggle(true) end, 'Toggle Nvim Tree')

nor('<leader>?', cmd('Limelight!!'), 'Toggle Limelight')
nor('<leader>S', cmd('Startify'), 'Open Start Screen')

----------------------------------------
--             -> LSP <-
----------------------------------------
wk.register({['<leader>l'] = {name = '+LSP'}})
nor('<leader>lf', vim.lsp.buf.formatting, 'Format Document')
