-- checkout link below for organizing plugins
-- https://github.com/folke/LazyVim/blob/main/lua/lazyvim/plugins/coding.lua
return {
	-- my plugins
	{ 'huy-hng/convenience.nvim', lazy = false, dev = true, config = true, priority = 100 },
	{ 'huy-hng/metamap.nvim', lazy = false, dev = true, dependencies = 'convenience.nvim' },
	{
		'huy-hng/column_line.nvim',
		dev = true,
		dependencies = 'convenience.nvim',
		config = true,
		event = 'VeryLazy',
	},

	-- full on features
	'jceb/vim-orgmode',

	-- extra features
	'tpope/vim-obsession',
	{ 'tiagovla/scope.nvim', config = function() require('scope').setup() end }, -- scope buffers to tabs
	'tpope/vim-surround',
	'tpope/vim-fugitive', -- git stuff
	{ 'moll/vim-bbye', lazy = false }, -- stop fucking closing my shit

	-- test startup times
	{
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
		config = function()
			vim.g.startuptime_event_width = 40
			vim.g.startuptime_tries = 10
			vim.g.startuptime_sourced = 0
			vim.g.startuptime_exe_args = { '--noplugin' }
			vim.g.startuptime_exe_args = {}
		end,
	},
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
	{
		'ziontee113/icon-picker.nvim',
		config = function()
			require('icon-picker').setup { disable_legacy_commands = true }
			Nmap('<leader>fi', { vim.cmd.IconPickerNormal, 'nerd_font' }, 'Icon Picker')
		end,
	}, -- icon picker with telescope support
}
