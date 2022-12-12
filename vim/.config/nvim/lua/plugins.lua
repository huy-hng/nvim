local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system {
			'git',
			'clone',
			'--depth',
			'1',
			'https://github.com/wbthomason/packer.nvim',
			install_path,
		}
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local packer = require('packer')
local id = vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = 'plugins.lua',
	group = id,
	callback = function()
		print('Compiling Packer')
		require('plugins')
		packer.compile()
	end,
})

return packer.startup {
	function(use)
		use('wbthomason/packer.nvim')

		--===============================================================================
		--                             |=> Big Features <=|
		--===============================================================================
		use { 'vimwiki/vimwiki' } -- note taking
		-- use 'jceb/vim-orgmode'
		use('mbbill/undotree')

		-----------------------------------------
		--          -> Completion <-
		-----------------------------------------
		use { -- The completion plugin
			'hrsh7th/nvim-cmp',
			-- event = { 'VimEnter' },
			opt = false,
			-- event = { 'InsertEnter', 'CmdlineEnter', 'CmdwinEnter' },
			-- config = function()
			-- 	vim.schedule(FN(Prequire, 'plugins.cmp'))
			-- end,
		}
		use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' } -- buffer completions
		use { 'hrsh7th/cmp-path', after = 'nvim-cmp' } -- path completions
		use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' } -- cmdline completions
		-- nvim completion
		use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
		use { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
		use { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' }
		use { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' }

		use { 'dmitmel/cmp-cmdline-history', after = 'nvim-cmp' }
		use { 'andersevenrud/cmp-tmux', after = 'nvim-cmp' }

		use {
			'folke/neodev.nvim',
			config = function()
				require('neodev').setup { library = { plugins = { 'neotest' }, types = true } }
			end,
		}

		use {
			'L3MON4D3/LuaSnip',
			after = 'nvim-cmp',
			config = function() Prequire('plugins.snippets.init') end,
		} -- snippet engine
		use { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' } -- snippet completions

		use { 'rafamadriz/friendly-snippets', after = 'LuaSnip' } -- a bunch of snippets to use

		-----------------------------------------
		--              -> LSP <-
		-----------------------------------------
		use('williamboman/mason.nvim')

		use {
			'williamboman/mason-lspconfig.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'jayp0521/mason-null-ls.nvim',
		}

		use('neovim/nvim-lspconfig') -- enable LSP
		-- use 'dense-analysis/ale'
		use { 'glepnir/lspsaga.nvim', branch = 'main' }

		-----------------------------------------
		--           -> Telescope <-
		-----------------------------------------
		use {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.0',
			requires = 'nvim-lua/plenary.nvim',
		}

		use('stevearc/dressing.nvim') -- replace vim.input etc
		use('ziontee113/icon-picker.nvim') -- icon picker with telescope support
		use('ThePrimeagen/harpoon')

		-----------------------------------------
		--          -> Treesitter <-
		-----------------------------------------
		use {
			'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update { with_sync = true }
				ts_update()
			end,
			disable = false,
		}
		use { 'nvim-treesitter/playground', disable = false }
		use { 'nvim-treesitter/nvim-treesitter-context', disable = false }
		use { 'nvim-treesitter/nvim-treesitter-textobjects', disable = false }
		use { 'RRethy/nvim-treesitter-textsubjects', disable = false }
		use { 'p00f/nvim-ts-rainbow', disable = false } -- highlight parentheses in different colors

		use { 'mfussenegger/nvim-treehopper', requires = 'phaazon/hop.nvim' }

		--==================================================================================================
		--                                          Development
		--==================================================================================================

		---------------------------------------------Debugging----------------------------------------------

		use('mfussenegger/nvim-dap')
		use { 'mfussenegger/nvim-dap-python', requires = { 'mfussenegger/nvim-dap' } }
		use { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } }
		use { 'theHamsta/nvim-dap-virtual-text', requires = { 'mfussenegger/nvim-dap' } }

		----------------------------------------------Testing-----------------------------------------------

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

		---------------------------------------------Database-----------------------------------------------
		use('tpope/vim-dadbod')
		use('kristijanhusak/vim-dadbod-ui')

		--==================================================================================================
		--                                             Style
		--==================================================================================================

		----------------------------------------------Themes------------------------------------------------

		use { 'folke/tokyonight.nvim', branch = 'main' }
		use { 'catppuccin/nvim', as = 'catppuccin' }
		use('lunarvim/darkplus.nvim')

		------------------------------------------User Interface--------------------------------------------
		-- Packer
		use {
			'folke/noice.nvim',
			-- requires = {
			-- 	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				'MunifTanjim/nui.nvim',
			-- 	--   `nvim-notify` is only needed, if you want to use the notification view.
			-- 	--   If not available, we use `mini` as the fallback
			-- 	'rcarriga/nvim-notify',
			-- },
			after = 'nvim-cmp'
		}

		use('lukas-reineke/indent-blankline.nvim') -- indentation lines

		-- use 'glepnir/dashboard-nvim'
		use { 'mhinz/vim-startify', disable = true }
		use('goolord/alpha-nvim')

		-- colorize ansi escape colors (of which neither work well)
		use('powerman/vim-plugin-AnsiEsc')
		use { 'm00qek/baleia.nvim', tag = 'v1.2.0' }

		use('kyazdani42/nvim-web-devicons') -- file icons
		use('kyazdani42/nvim-tree.lua') -- file tree
		use('kevinhwang91/rnvimr') -- ranger

		use { 'akinsho/bufferline.nvim', tag = 'v2.*' } -- 'tabs' at the top
		use('tiagovla/scope.nvim') -- scope buffers to tabs
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		}

		-- better folding lines and column
		use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

		---------------------------------------------Zen Mode-----------------------------------------------
		use('folke/zen-mode.nvim')
		use('folke/twilight.nvim')

		--==================================================================================================
		--                                         Small Features
		--==================================================================================================
		-- syntax error
		use('folke/which-key.nvim')
		use('sindrets/diffview.nvim') -- side by side diff view
		use {
			'TimUntersberger/neogit', -- magit clone
			requires = { 'nvim-lua/plenary.nvim' },
		}
		-- test startup times
		use('dstein64/vim-startuptime')
		use('lewis6991/impatient.nvim')

		use { 'akinsho/toggleterm.nvim', tag = '*' }

		use('moll/vim-bbye') -- stop fucking closing my shit

		----------------------------------------------Motion------------------------------------------------

		use('unblevable/quick-scope')
		-- use 'ggandor/leap.nvim'
		-- use 'ggandor/lightspeed.nvim' -- older version of leap
		use { 'phaazon/hop.nvim', branch = 'v2' }
		-- use 'easymotion/vim-easymotion'

		use('tpope/vim-obsession') -- save vim sessions
		use { 'jedrzejboczar/possession.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- save vim sessions
		use('tpope/vim-fugitive') -- git stuff
		use('tpope/vim-surround')
		use('numToStr/Comment.nvim')

		use {
			'lewis6991/gitsigns.nvim',
			requires = { 'nvim-lua/plenary.nvim' },
		}

		use('windwp/nvim-autopairs') -- pair brackets

		use {
			'mg979/vim-visual-multi',
			branch = 'master',
			keys = { '<C-n>' },
		}

		--==================================================================================================
		--                                              End
		--==================================================================================================

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then packer.sync() end
	end,
	config = {
		compile_path = vim.fn.stdpath('config') .. '/lua/plugins/packer_compiled.lua',
		display = {
			open_fn = function() return require('packer.util').float { border = 'rounded' } end,
		},
		profile = {
			enable = true,
			threshold = 1, -- the amount in ms that a plugin's load time must be over for it to be included in the profile
		},
	},
}
