-- if true then require('clean') return end

NVIM_CONFIG_PATH = vim.fn.stdpath('config')
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

vim.g.neovide_fullscreen = true
vim.g.has_neovide = vim.g.neovide
vim.g.neovide = nil

-- these shouldnt depend on anything except for vim itself
require('config.keymaps')
require('config.ui.colors')

require('core.options')
require('core.globals')
require('core.types')
require('core.colorscheme')
require('core.statuscolumn')
require('core.menus')
require('modules.detect_indentation')

require('core.neovide')

require('plugin_manager.lazy')
SetColors('catppuccin-mocha')

Map('QQ', '<cmd>qa<cr>')
Augroup('LazyLoad', {
	Autocmd('User', 'VeryLazy', function()
		Map.n(Keys.plugin_manager, require('lazy').home)
		local require_dir = require('modules.require_dir')
		require_dir('lua/functions')
		require_dir('lua/keymaps')
		require('keymaps.layout_changer.colemak').set_keymap()
		require('core.autocmd')
		vim.cmd('let $PATH="/home/huy/.local/bin/:" .. $PATH')

		return true
	end),
})
