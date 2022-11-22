NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

REQUIRE_DIRS = {
	'lua/core',
	'lua/keymaps',
	'lua/plugins',
	'lua/user',
	'lua/functions',
}

require('options')
require('colorscheme')
require('plugins')
require('autocmd')

local require_dir = require('core.require_dir')
for _, path in ipairs(REQUIRE_DIRS) do
	require_dir(path)
end

-- require('statusline')
require('lsp.init')

if vim.g.neovide then
	require('neovide')
else
	vim.o.winblend = 15
	vim.o.pumblend = 15
end

--==============================================================================
--                          |=> Vim config files <=|
--==============================================================================

local path = NVIM_CONFIG_PATH .. 'vim/'
local maps_path = path .. 'key_bindings/'
local plugins_path = path .. 'plugins/'

vim.cmd.source(maps_path .. 'key_maps.vim')
vim.cmd.source(maps_path .. 'misc.vim')
vim.cmd.source(maps_path .. 'movement.vim')
vim.cmd.source(maps_path .. 'navigation.vim')
vim.cmd.source(maps_path .. 'plugin_bindings.vim')
vim.cmd.source(maps_path .. 'rebinds.vim')
vim.cmd.source(maps_path .. 'text_editing.vim')
vim.cmd.source(plugins_path .. 'ranger.vim')
vim.cmd.source(plugins_path .. 'startify.vim')
vim.cmd.source(plugins_path .. 'vimwiki.vim')
-- vim.cmd.source(path .. 'functions.vim')
vim.cmd.source(path .. 'autocmds.vim')
