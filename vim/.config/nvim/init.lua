NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'

package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path
-- package.path = "../?.lua;" .. package.path
-- print(package.path)

vim.cmd('source ~/.config/nvim/vimrc')

REQUIRE_DIRS = {
	'lua/helpers',
	'lua/plugins',
	'lua/functions',
	'lua/keymaps',
	'lua/user',
	-- 'lua/lsp',
}

require 'lsp.init'
require 'statusline'

local require_dir = require 'helpers.require_dir'
for _, import in ipairs(REQUIRE_DIRS) do
	require_dir(import)
end

-- require 'plugins/requires'
-- require 'user/requires'
-- require 'functions/requires'
-- require 'keymaps/requires'
