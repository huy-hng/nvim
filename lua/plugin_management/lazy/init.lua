require('plugin_management.lazy.ensure_lazy')

local opts = require('plugin_management.lazy.config')
require('lazy').setup({
	{ 'huy-hng/metamap.nvim', dev = true },
	{ 'huy-hng/convenient_lua', config = true },

	'folke/neodev.nvim',
	'windwp/nvim-autopairs', -- pair brackets
	'tpope/vim-surround',
	'folke/zen-mode.nvim',
	'folke/twilight.nvim',
	'folke/which-key.nvim',
	'mbbill/undotree',
	'ThePrimeagen/harpoon',

	'kevinhwang91/rnvimr', -- ranger

	{ 'mg979/vim-visual-multi', branch = 'master', keys = { '<C-n>' } },

	'vimwiki/vimwiki',
	'jceb/vim-orgmode',
	'nvim-lua/plenary.nvim',
	{ 'nvim-telescope/telescope.nvim' },
	{ 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons' } },

	{ 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },

	'mfussenegger/nvim-dap',
	{ 'mfussenegger/nvim-dap-python', dependencies = { 'mfussenegger/nvim-dap' } },
	{ 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } },
	{ 'theHamsta/nvim-dap-virtual-text', dependencies = { 'mfussenegger/nvim-dap' } },

	'nvim-neotest/neotest-python',
	{
		'nvim-neotest/neotest',
		dependencies = { 'nvim-lua/plenary.nvim', 'nvim-treesitter/nvim-treesitter' },
	},
	'tpope/vim-dadbod',
	'kristijanhusak/vim-dadbod-ui',

	'folke/tokyonight.nvim',
	{ 'catppuccin/nvim', name = 'catppuccin', config = function() require('core.colorscheme') end },
	'lunarvim/darkplus.nvim',
	'stevearc/dressing.nvim', -- replace vim.input etc

	'ziontee113/icon-picker.nvim', -- icon picker with telescope support
	'simrat39/symbols-outline.nvim', -- show symbols in sidebar
	'rcarriga/nvim-notify', -- after = 'nvim-cmp'
	'MunifTanjim/nui.nvim',

	{
		'folke/noice.nvim',
		-- after = 'nvim-cmp',
		-- dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
	},
	'goolord/alpha-nvim',

	-- session management
	'tpope/vim-obsession',
	{ 'jedrzejboczar/possession.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- use('powerman/vim-plugin-AnsiEsc')
	-- use { 'm00qek/baleia.nvim', tag = 'v1.2.0' }

	'nvim-tree/nvim-web-devicons',

	{ 'tiagovla/scope.nvim', config = function() require('scope').setup() end }, -- scope buffers to tabs
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

	-- better folding lines and column
	{ 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },

	'tpope/vim-fugitive', -- git stuff
	'sindrets/diffview.nvim', -- side by side diff view
	{
		'TimUntersberger/neogit', -- magit clone
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'lewis6991/gitsigns.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},

	-- test startup times
	'dstein64/vim-startuptime',
	'lewis6991/impatient.nvim',

	'akinsho/toggleterm.nvim',

	'numToStr/Comment.nvim',
	'moll/vim-bbye', -- stop fucking closing my shit
	-- 'unblevable/quick-scope',
	{ 'phaazon/hop.nvim', branch = 'v2' },

	-- 'ggandor/leap.nvim',
	-- 'ggandor/lightspeed.nvim', -- older version of leap
	-- 'easymotion/vim-easymotion',

	-- lsp
	'williamboman/mason.nvim', -- install servers and more
	'neovim/nvim-lspconfig', -- enable LSP

	'williamboman/mason-lspconfig.nvim',
	'jose-elias-alvarez/null-ls.nvim',
	'jayp0521/mason-null-ls.nvim',

	'glepnir/lspsaga.nvim',

	-- completion
	'hrsh7th/nvim-cmp',

	'hrsh7th/cmp-buffer', -- buffer completions
	'hrsh7th/cmp-path', -- path completions
	'hrsh7th/cmp-cmdline', -- cmdline completions

	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-nvim-lsp-document-symbol',

	'ray-x/cmp-treesitter', -- source for treesitter nodes.
	'hrsh7th/cmp-omni',

	'dmitmel/cmp-cmdline-history',
	'andersevenrud/cmp-tmux',

	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip', -- snippet completions
	'rafamadriz/friendly-snippets', -- a bunch of snippets to use

	-- treesitter

	{
		'nvim-treesitter/nvim-treesitter',
		build = function()
			local ts_update = require('nvim-treesitter.install').update { with_sync = false }
			ts_update()
		end,
	},
	'nvim-treesitter/playground',
	'nvim-treesitter/nvim-treesitter-context',
	'nvim-treesitter/nvim-treesitter-textobjects',
	'RRethy/nvim-treesitter-textsubjects',
	'p00f/nvim-ts-rainbow', -- highlight parentheses in different colors
	{ 'mfussenegger/nvim-treehopper', dependencies = 'phaazon/hop.nvim' },
}, opts)
