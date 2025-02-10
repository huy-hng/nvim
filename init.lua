-- if true then require('clean') return end
DEBUG_PRINT = true

NVIM_CONFIG_PATH = vim.fn.stdpath('config')
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

-- traceback where an option has been set
-- vim.api.nvim_create_autocmd('OptionSet', {
-- 	pattern = 'foldmethod',
-- 	callback = function(ev)
-- 		local traceback = debug.traceback('foldmethod', 1)
-- 		P(ev, traceback)
-- 	end,
-- })

vim.g.neovide_fullscreen = true
vim.g.has_neovide = vim.g.neovide
vim.g.neovide = nil

-- vim.cmd('let $PATH="/home/huy/.local/bin/:" .. $PATH')
vim.env.PATH = '/home/huy/.local/bin/:' .. vim.env.PATH

-- these should not depend on anything except for vim itself
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

require_dir('lua/keymaps')
require('keymaps.layout_changer.colemak').set_keymap()

local function lazy_load()
	require_dir('lua/modules/functions')
	require_dir('lua/keymaps')
	require('keymaps.layout_changer.colemak').set_keymap()
	require('core.autocmd')

	return true
end

Augroup('LazyLoad', { Autocmd('User', 'VeryLazy', lazy_load) })
