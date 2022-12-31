return {

	-- my plugins
	{ 'huy-hng/metamap.nvim', dev = true },
	{ 'huy-hng/convenient_lua', dev = true, config = true },

	-- full on features
	'jceb/vim-orgmode',

	-- extra features
	'tpope/vim-obsession',
	{ 'tiagovla/scope.nvim', config = function() require('scope').setup() end }, -- scope buffers to tabs
	'tpope/vim-surround',
	'tpope/vim-fugitive', -- git stuff
	'moll/vim-bbye', -- stop fucking closing my shit

	-- test startup times
	'dstein64/vim-startuptime',
	'lewis6991/impatient.nvim',

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
	'nvim-tree/nvim-web-devicons',

	-- etrxa ui
	'akinsho/toggleterm.nvim',
	{ 'folke/noice.nvim', -- dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' }, 
		enable = false, }, 
	{
		'ziontee113/icon-picker.nvim',
		config = function()
			require('icon-picker').setup { disable_legacy_commands = true }
			Nmap('<leader>fi', Util.wrap(vim.cmd.IconPickerNormal, 'nerd_font'), 'Icon Picker')
		end,
	}, -- icon picker with telescope support
}
