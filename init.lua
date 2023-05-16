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
require('config.native_keymaps')

local colemak = require('keymaps.layout_changer.colemak')

require('plugin_management.lazy')
require('core.neovide')

Augroup('LazyLoad', {
	Autocmd('User', 'VeryLazy', function()
		Map.n('<C-S-P>', require('lazy').home)
		local require_dir = require('modules.require_dir')
		require('core.autocmd')
		require_dir('lua/functions')

		require_dir('lua/keymaps')
		colemak.set_keymap()

		return true
	end),
})
