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

vim.cmd.cnoreabbrev('telp', 'tab help')
vim.cmd.cnoreabbrev('hvw', 'tab help vimwiki')
vim.cmd.cnoreabbrev('sovim', 'so $HOME/.config/nvim/init.vim')
vim.cmd.cnoreabbrev('solua', 'so $HOME/.config/nvim/init.lua')

vim.cmd.cnoreabbrev('h', 'vertical h')
vim.cmd.cnoreabbrev('vwtoc', 'VimwikiTOC')
vim.cmd.cnoreabbrev('packi', 'PackerInstall')


vim.api.nvim_create_user_command('HighlightFile', 'so $VIMRUNTIME/syntax/hitest.vim', {})
-- vim.cmd [[command! -nargs=1 -complete=help Help :enew | :set buftype=help | :h <args>]]
vim.api.nvim_create_user_command('Help', function(data)
	Exec('enew | set buftype=help | h ' .. data.args)
end, {nargs=1, complete='help'})
