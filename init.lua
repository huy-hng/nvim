---------------------------------------------Set Path-----------------------------------------------

NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

vim.g.has_neovide = vim.g.neovide
vim.g.neovide = nil

local require_dir = require('modules.require_dir')

require('functions.profiler') -- start profiler at the beginning
require('core.globals')
require('core.options')
require('core.colorscheme')

require('plugin_management')
require('core.autocmd')

require_dir('lua/functions')

if vim.g.has_neovide then require('core.neovide') end
