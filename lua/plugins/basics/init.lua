
-- checkout link below for organizing plugins
-- https://github.com/folke/LazyVim/blob/main/lua/lazyvim/plugins/coding.lua
return {
	-- extra features
	-- plugins below mess up key maps
	-- 'tpope/vim-obsession',
	-- 'tpope/vim-repeat',
	-- 'tpope/vim-surround',
	-- 'tpope/vim-fugitive', -- git stuff

	{ 'moll/vim-bbye', lazy = false }, -- stop fucking closing my shit
	-- { 'tiagovla/scope.nvim', config = function() require('scope').setup() end }, -- scope buffers to tabs

	-- movement
	{ 'phaazon/hop.nvim', branch = 'v2' },
	-- 'ggandor/leap.nvim',
	-- 'ggandor/lightspeed.nvim', -- older version of leap
	-- 'easymotion/vim-easymotion',

	-- Appearance
	'folke/tokyonight.nvim',
	'lunarvim/darkplus.nvim',

	-- dependencies
	'nvim-lua/plenary.nvim',

	-- etxra ui
	{
		'ziontee113/icon-picker.nvim',
		config = function()
			require('icon-picker').setup { disable_legacy_commands = true }
			-- Nmap('<leader>fi', { vim.cmd.IconPickerNormal, 'nerd_font' }, 'Icon Picker')
		end,
	}, -- icon picker with telescope support
}
