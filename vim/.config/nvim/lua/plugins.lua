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
		use('vimwiki/vimwiki') -- note taking
		-- use 'jceb/vim-orgmode'
		use('mbbill/undotree')

		-----------------------------------------
		--          -> Completion <-
		-----------------------------------------
		use('hrsh7th/nvim-cmp') -- The completion plugin
		use('hrsh7th/cmp-buffer') -- buffer completions
		use('hrsh7th/cmp-path') -- path completions
		use('hrsh7th/cmp-cmdline') -- cmdline completions
		-- use 'folke/neodev.nvim'
		use {
			'folke/neodev.nvim',
			config = function()
				require('neodev').setup {
					library = { plugins = { 'neotest' }, types = true },
				}
			end,
		}

		-- nvim completion
		use('hrsh7th/cmp-nvim-lsp')
		use('hrsh7th/cmp-nvim-lua')
		use('hrsh7th/cmp-nvim-lsp-signature-help')
		use('hrsh7th/cmp-nvim-lsp-document-symbol')

		use('dmitmel/cmp-cmdline-history')
		use('andersevenrud/cmp-tmux')

		use('L3MON4D3/LuaSnip') -- snippet engine
		use('saadparwaiz1/cmp_luasnip') -- snippet completions

		use('rafamadriz/friendly-snippets') -- a bunch of snippets to use

		-----------------------------------------
		--              -> LSP <-
		-----------------------------------------
		use {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'jose-elias-alvarez/null-ls.nvim',
			'jayp0521/mason-null-ls.nvim',
		}
		use('neovim/nvim-lspconfig') -- enable LSP
		-- use 'dense-analysis/ale'
		use { 'glepnir/lspsaga.nvim', branch = 'main' }
		-- use {
		-- 	'glepnir/lspsaga.nvim',
		-- 	branch = 'main',
		-- 	config = function()
		-- 		local saga = require 'lspsaga'

		-- 		saga.init_lsp_saga {
		-- 			-- your configuration
		-- 		}
		-- 	end,
		-- }

		-----------------------------------------
		--           -> Telescope <-
		-----------------------------------------
		use {
			'nvim-telescope/telescope.nvim',
			tag = '0.1.0',
			requires = 'nvim-lua/plenary.nvim',
		}
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
		}
		use('nvim-treesitter/playground')
		use('nvim-treesitter/nvim-treesitter-context')
		use('nvim-treesitter/nvim-treesitter-textobjects')

		use('RRethy/nvim-treesitter-textsubjects')
		use('p00f/nvim-ts-rainbow') -- highlight parentheses in different colors

		use { 'mfussenegger/nvim-treehopper', requires = 'phaazon/hop.nvim' }

		--===============================================================================
		--                             |=> Development <=|
		--===============================================================================

		use('mfussenegger/nvim-dap') -- debugging

		----------------------------------------
		--           -> Testing <-
		----------------------------------------
		use('vim-test/vim-test') -- for pytest and other testing frameworks
		use('nvim-neotest/neotest-python')
		use {
			'nvim-neotest/neotest',
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-treesitter/nvim-treesitter',
			},
		}

		-----------------------------------------
		--           -> Database <-
		-----------------------------------------
		use('tpope/vim-dadbod')
		use('kristijanhusak/vim-dadbod-ui')

		--===============================================================================
		--                                 |=> Style <=|
		--===============================================================================

		-----------------------------------------
		--            -> Themes <-
		-----------------------------------------
		use { 'folke/tokyonight.nvim', branch = 'main' }
		use { 'catppuccin/nvim', as = 'catppuccin' }
		use('lunarvim/darkplus.nvim')

		-----------------------------------------
		--        -> User Interface <-
		-----------------------------------------
		-- startscreens
		-- use 'glepnir/dashboard-nvim'
		use('mhinz/vim-startify')
		-- use 'goolord/alpha-nvim'

		use('kyazdani42/nvim-web-devicons') -- file icons
		use('kyazdani42/nvim-tree.lua') -- file tree
		use('kevinhwang91/rnvimr') -- ranger

		use { 'akinsho/bufferline.nvim', tag = 'v2.*' } -- 'tabs' at the top
		use('tiagovla/scope.nvim') -- scope buffers to tabs
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		}

		use('moll/vim-bbye') -- stop fucking closing my shit

		-----------------------------------------
		--           -> Zen Mode <-
		-----------------------------------------
		use('junegunn/limelight.vim')
		use('junegunn/goyo.vim')

		--===============================================================================
		--                          |=> Smaller Features <=|
		--===============================================================================
		-- syntax error
		use('folke/which-key.nvim')
		use('TimUntersberger/neogit') -- magit clone
		use('sindrets/diffview.nvim') -- side by side diff view

		use { 'akinsho/toggleterm.nvim', tag = '*' }

		----------------------------------------
		--            -> Motion <-
		----------------------------------------
		use 'unblevable/quick-scope'
		-- use 'ggandor/leap.nvim'
		-- use 'ggandor/lightspeed.nvim' -- older version of leap
		use { 'phaazon/hop.nvim', branch = 'v2' }
		-- use 'easymotion/vim-easymotion'

		use('tpope/vim-obsession') -- save vim sessions
		use('tpope/vim-fugitive') -- git stuff
		use('tpope/vim-surround')
		use('numToStr/Comment.nvim')

		use {
			'lewis6991/gitsigns.nvim',
			requires = { 'nvim-lua/plenary.nvim' },
			config = function()
				require('gitsigns').setup()
			end,
		}

		use('windwp/nvim-autopairs') -- pair brackets
		use { 'mg979/vim-visual-multi', branch = 'master' }
		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			packer.sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float { border = 'rounded' }
			end,
		},
	},
}
