if require('first_load')() then return end

NVIM_CONFIG_PATH = os.getenv('HOME') .. '/.config/nvim/'
package.path = NVIM_CONFIG_PATH .. '?.lua;' .. package.path

local require_dir = require('core.require_dir')


local function minimal_init()
	require_dir('lua/core')

	require('options') -- save
	require('colorscheme') -- catpuccin needs to be installed
	require('autocmd') --
	-- require('lazyloader') -- needs a crap ton of plugins

	require_dir('lua/functions') -- should come before keymaps
	require_dir('lua/keymaps')
end

local function extra_features()
	Prequire('plugins')
	Prequire('lazy_plugins')

	Prequire('plugins.lualine')
	Prequire('plugins.alpha')
	Prequire('plugins.packer_compiled')
	require_dir('lua/plugins/early_load_plugins')

	if vim.g.neovide then require('neovide') end
end

minimal_init()

if not vim.g.minimal then
	pcall(extra_features)
end
