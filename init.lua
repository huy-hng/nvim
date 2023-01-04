---------------------------------------------Set Path-----------------------------------------------

NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

local require_dir = require('modules.require_dir')

require('functions.profiler') -- start profiler at the beginning
require('core.globals')
require('core.options')
require('core.colorscheme')
require('core.autocmd')

require_dir('lua/functions')

if vim.g.neovide then require('core.neovide') end
require('plugin_management')

-- to start neovim in minimal
-- $nvim --cmd "let g:minimal=1"
