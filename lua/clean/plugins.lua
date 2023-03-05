require('plugin_management.ensure_lazy')

require('lazy').setup({
	{ 'huy-hng/convenience.nvim', lazy = false, dev = true, config = true, priority = 100 },
	{
		'huy-hng/anyline.nvim',
		-- dev = true,
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = true,
		-- event = 'VeryLazy',
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
	},
}, require('plugin_management.config'))
