-- if true then require('clean') return end

NVIM_CONFIG_PATH = vim.fn.stdpath('config')
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

vim.g.neovide_fullscreen = true
vim.g.has_neovide = vim.g.neovide
vim.g.neovide = nil

require('core.options')
require('core.globals')
require('core.types')
require('core.colorscheme')
require('core.statuscolumn')

local colemak = require('keymaps.layout_changer.colemak')
colemak.set_langmap()

require('plugin_management.lazy')
require('core.neovide')

Augroup('LazyLoad', {
	Autocmd('User', 'VeryLazy', function()
		Nmap('<C-S-P>', require('lazy').home)
		local require_dir = require('modules.require_dir')
		require('core.autocmd')
		require_dir('lua/functions')

		require_dir('lua/keymaps')
		colemak.set_keymap()

		Nmap('QQ', { vim.cmd, 'qa' })
		return true
	end),
})
