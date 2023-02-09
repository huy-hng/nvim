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

require('plugin_management.lazy')
require('core.neovide')

-- local files = vim.api.nvim_get_runtime_file(vim.fn.stdpath('config'), true)
-- local file_paths = vim.api.nvim_get_runtime_file(dir .. '/**/*.lua', true)
-- local files = vim.api.nvim_get_runtime_file('lua/**/*.lua', true)
-- print('============')
-- for _, item in ipairs(files) do
-- 	local relative = string.match(item, 'nvim/lua/(.*).lua$')
-- 	if relative then print(item) end
-- end

Augroup('LazyLoad', {
	Autocmd('User', 'VeryLazy', function()
		local require_dir = require('modules.require_dir')
		require('core.autocmd')
		require_dir('lua/functions')
		require_dir('lua/keymaps')
		return true
	end),
})
