local status, wk = pcall(require, 'which-key')
if not status then
	return
end

local wrappers = require 'helpers.wrappers'
local cmd = wrappers.cmd

----------------------------------------
--           -> Plugins <-
----------------------------------------
nmap('<leader>?', cmd 'Limelight!!', 'Toggle Limelight')
nmap('<leader>S', cmd 'Startify', 'Open Start Screen')

----------------------------------------
--             -> LSP <-
----------------------------------------
wk.register { ['<leader>l'] = { name = '+LSP' } }
