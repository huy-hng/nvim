NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'

package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path
-- package.path = "../?.lua;" .. package.path
-- print(package.path)

vim.cmd('source ~/.config/nvim/vimrc')


local require_dir = require 'helpers.require_dir'

-- for _, import in ipairs(REQUIRE_DIRS) do
-- 	require_dir(import)
-- end

require_dir('lua/helpers')
require_dir('lua/keymaps')
require_dir('lua/user')

require 'lsp.init'

require_dir('lua/plugins')
require_dir('lua/functions')

require 'statusline'

