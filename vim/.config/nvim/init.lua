NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'

package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path
-- package.path = "../?.lua;" .. package.path
-- print(package.path)

vim.cmd('source ~/.config/nvim/vimrc')

REQUIRE_DIRS = {
	'lua/plugins',
	'lua/user',
	'lua/functions',
	'lua/lsp',
}

local require_dir = require 'helpers.require_dir'
for _, import in ipairs(REQUIRE_DIRS) do
	require_dir(import)
end

-- return {}
