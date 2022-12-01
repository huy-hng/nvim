if require('first_load')() then return end

NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

local require_dir = require('core.require_dir')
require_dir('lua/core')

require('options')
require('colorscheme')
require('plugins')
require('autocmd')
require('lazyloader')

if vim.g.neovide then require('neovide') end

require_dir('lua/functions') -- should come before keymaps
require_dir('lua/keymaps')

require('plugins.lualine')
-- require('plugins.bufferline')
-- require('plugins.quickscope')
-- require('plugins.startify')
-- require('plugins.vimwiki')
-- require('plugins.zen')

-- pcall(require, 'plugins.tree')
