NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

local require_dir = require('core.require_dir')
require_dir('lua/core')

require('options')
require('colorscheme')
require('plugins')
require('autocmd')
require('lazyloader')

if vim.g.neovide then
	require('neovide')
end

REQUIRE_DIRS = {
	'lua/functions', -- should come before keymaps
	'lua/keymaps',
	-- 'lua/plugins',
}

for _, path in ipairs(REQUIRE_DIRS) do
	require_dir(path)
end

local g = vim.g
g.startuptime_event_width = 40
g.startuptime_tries = 10
g.startuptime_sourced = 0
g.startuptime_exe_args = {'--noplugin'}
g.startuptime_exe_args = {}
