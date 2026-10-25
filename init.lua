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

-- vim.cmd('let $PATH="/home/huy/.local/bin/:" .. $PATH')
vim.env.PATH = '/home/huy/.local/bin/:' .. vim.env.PATH

-- these should not depend on anything except for vim itself
Keys = require('core.keymaps.layout_changer.keymaps')

require('core.ui.colors')
require('core.ui.icons')

require('core.options')
require('core.globals')
require('core.colorscheme')
require('core.keymaps')
require('core.types')
require('core.autocmd')

-- require('core.menus')
require('modules.statuscolumn')
require('modules.detect_indentation')

require('core.neovide')


require('plugins')
