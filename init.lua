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
require('core.menus')
require('config.native_keymaps')
require('core.neovide')

require('plugin_manager.lazy')
SetColors('catppuccin-mocha')

-- Map('QQ', '<cmd>qa!<cr>')
Augroup('LazyLoad', {
	Autocmd('User', 'VeryLazy', function()
		Map.n('<C-S-P>', require('lazy').home)
		local require_dir = require('modules.require_dir')
		require_dir('lua/functions')
		require_dir('lua/keymaps')
		require('keymaps.layout_changer.colemak').set_keymap()
		require('core.autocmd')

		return true
	end),
})
