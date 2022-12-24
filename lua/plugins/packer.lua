local packer = require('packer')

Augroup('Packer', {
	Autocmd('BufWritePost', 'packer.lua', function()
		vim.notify('Compiling Packer', 'info', { title = 'Packer', render = 'minimal' })
		R('plugins.packer')
		packer.compile()
	end),
})

return packer.startup {
	function(use)
		use('wbthomason/packer.nvim')

		------------------------------------------My Plugins----------------------------------------

		use(NVIM_CONFIG_PATH .. 'plugins/metamap')

		-------------------------------------------Utility------------------------------------------

		use('windwp/nvim-autopairs') -- pair brackets
		use('tpope/vim-surround')

		use {
			'mg979/vim-visual-multi',
			branch = 'master',
			keys = { '<C-n>' },
		}
		use('folke/zen-mode.nvim')
		use('folke/twilight.nvim')

		use('folke/which-key.nvim')
		use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim' }
		use('mbbill/undotree')
		use('ThePrimeagen/harpoon')

		use('vimwiki/vimwiki')
		use { 'nvim-neorg/neorg', requires = 'nvim-lua/plenary.nvim' }
		use('jceb/vim-orgmode')

		use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
		use('kevinhwang91/rnvimr') -- ranger
		use {
			'akinsho/bufferline.nvim',
			-- after = 'catppuccin',
			tag = 'v3.*',
			requires = 'nvim-tree/nvim-web-devicons',
		}

		------------------------------------------Completion----------------------------------------

		use { 'hrsh7th/nvim-cmp' } -- event = { 'InsertEnter', 'CmdlineEnter', 'CmdwinEnter' },

		use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer completions
		use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path completions
		use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline completions

		use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
		use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
		use { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' }
		use { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' }

		use { 'ray-x/cmp-treesitter', after = 'nvim-cmp' } -- source for treesitter nodes.
		use { 'hrsh7th/cmp-omni', after = 'nvim-cmp' }

		use { 'dmitmel/cmp-cmdline-history', after = 'nvim-cmp' }
		use { 'andersevenrud/cmp-tmux', after = 'nvim-cmp' }

		------------------Snippet-----------------

		use { 'L3MON4D3/LuaSnip' }
		use { 'saadparwaiz1/cmp_luasnip', after = { 'LuaSnip', 'nvim-cmp' } } -- snippet completions
		use { 'rafamadriz/friendly-snippets', after = 'LuaSnip' } -- a bunch of snippets to use

		--------------------LSP-------------------

		use('neovim/nvim-lspconfig') -- enable LSP
		use('williamboman/mason.nvim') -- install servers and more

		use {
			'williamboman/mason-lspconfig.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'jayp0521/mason-null-ls.nvim',
		}

		use { 'glepnir/lspsaga.nvim', branch = 'main' }

		------------------------------------------Treesitter----------------------------------------
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update { with_sync = true }
				ts_update()
			end,
		}
		use { 'nvim-treesitter/playground' }
		use { 'nvim-treesitter/nvim-treesitter-context' }
		use { 'nvim-treesitter/nvim-treesitter-textobjects' }
		use { 'RRethy/nvim-treesitter-textsubjects' }
		use { 'p00f/nvim-ts-rainbow' } -- highlight parentheses in different colors
		use { 'mfussenegger/nvim-treehopper', requires = 'phaazon/hop.nvim' }

		--=======================================Development========================================

		------------------------------------------Debugging-----------------------------------------

		use('mfussenegger/nvim-dap')
		use { 'mfussenegger/nvim-dap-python', requires = { 'mfussenegger/nvim-dap' } }
		use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
		use { 'theHamsta/nvim-dap-virtual-text', requires = { 'mfussenegger/nvim-dap' } }

		-------------------------------------------Testing------------------------------------------

		-- use('vim-test/vim-test') -- for pytest and other testing frameworks
		use { 'nvim-neotest/neotest-python' }
		-- use { 'nvim-neotest/neotest-python', ft = 'python' }
		use {
			'nvim-neotest/neotest',
			requires = {
				'nvim-lua/plenary.nvim',
				-- 'nvim-treesitter/nvim-treesitter',
			},
		}

		-----------------------------------------Other Tools----------------------------------------

		use('tpope/vim-dadbod')
		use('kristijanhusak/vim-dadbod-ui')

		use {
			'folke/neodev.nvim',
			config = function()
				require('neodev').setup { library = { plugins = { 'neotest' }, types = true } }
			end,
		}

		--------------------------------------------Themes------------------------------------------

		use { 'folke/tokyonight.nvim', branch = 'main' }
		use { 'catppuccin/nvim', as = 'catppuccin' }
		use('lunarvim/darkplus.nvim')

		----------------------------------------User Interface--------------------------------------

		use('stevearc/dressing.nvim') -- replace vim.input etc
		use('ziontee113/icon-picker.nvim') -- icon picker with telescope support

		use { 'simrat39/symbols-outline.nvim' } -- show symbols in sidebar
		use { 'rcarriga/nvim-notify', after = 'nvim-cmp' }
		use { 'MunifTanjim/nui.nvim' }
		use {
			'folke/noice.nvim',
			after = 'nvim-cmp',
			requires = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
		}

		-- use 'glepnir/dashboard-nvim'
		use { 'mhinz/vim-startify', disable = true }
		use('goolord/alpha-nvim')
		use('tpope/vim-obsession') -- save vim sessions
		use { 'jedrzejboczar/possession.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- save vim sessions

		-- colorize ansi escape colors (of which neither work well)
		-- use('powerman/vim-plugin-AnsiEsc')
		-- use { 'm00qek/baleia.nvim', tag = 'v1.2.0' }

		use('nvim-tree/nvim-web-devicons')

		use {
			'tiagovla/scope.nvim',
			config = function() require('scope').setup() end,
		} -- scope buffers to tabs

		use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } }

		-- better folding lines and column
		use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

		---------------------------------------------Zen Mode-----------------------------------------------

		--------------------Git-------------------

		use('tpope/vim-fugitive') -- git stuff
		use('sindrets/diffview.nvim') -- side by side diff view
		use {
			'TimUntersberger/neogit', -- magit clone
			requires = { 'nvim-lua/plenary.nvim' },
		}
		use {
			'lewis6991/gitsigns.nvim',
			requires = { 'nvim-lua/plenary.nvim' },
		}

		-- test startup times
		use('dstein64/vim-startuptime')
		use('lewis6991/impatient.nvim')

		use { 'akinsho/toggleterm.nvim', tag = '*' }

		----------------------------------------------Motion------------------------------------------------

		use('numToStr/Comment.nvim')
		use('moll/vim-bbye') -- stop fucking closing my shit
		use('unblevable/quick-scope')
		use { 'phaazon/hop.nvim', branch = 'v2' }

		-- use 'ggandor/leap.nvim'
		-- use 'ggandor/lightspeed.nvim' -- older version of leap
		-- use 'easymotion/vim-easymotion'

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
	end,
	config = {
		compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer_compiled.lua',
		display = {
			open_fn = function() return require('packer.util').float { border = 'rounded' } end,
		},
		profile = {
			enable = false,
			threshold = 1, -- the amount in ms that a plugin's load time must be over for it to be included in the profile
		},
	},
}
