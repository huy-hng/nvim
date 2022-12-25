return function(use)
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
end
