---------------------------------------------Set Path-----------------------------------------------

NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

vim.g.has_neovide = vim.g.neovide
vim.g.neovide = nil


require('core.options')
require('core.globals')
require('core.colorscheme')

require('plugin_management')
require('core.neovide')

Augroup('LazyLoad', {
	Autocmd('User', 'VeryLazy', function()
		local require_dir = require('modules.require_dir')

		require('core.autocmd')
		require_dir('lua/functions')
		require_dir('lua/keymaps')
		return true
	end),
})
