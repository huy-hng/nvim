NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

local require_dir = require('core.require_dir')
require_dir('lua/core')

require('options')
require('colorscheme')
require('plugins')
require('autocmd')

if vim.g.neovide then
	require('neovide')
end

REQUIRE_DIRS = {
	'lua/keymaps',
	'lua/plugins',
	'lua/functions',
}

require('lsp.init')

for _, path in ipairs(REQUIRE_DIRS) do
	require_dir(path)
end

-- require('statusline')
