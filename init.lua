---------------------------------------------Set Path-----------------------------------------------

NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

local require_dir = require('modules.require_dir')

require('core.globals')

require('functions.profiler') -- start profiler at the beginning

require('core.options')
-- require('core.colorscheme') -- catpuccin needs to be installed
require('core.autocmd')

require_dir('lua/functions') -- should come before keymaps
-- require_dir('lua/keymaps') -- is located in after folder
-- require('plugins.early_load_plugins.vimwiki')

require('plugin_management')
if vim.g.neovide then require('core.neovide') end

-- to start neovim in minimal
-- $nvim --cmd "let g:minimal=1"
