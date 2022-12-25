return function(use)
	use('neovim/nvim-lspconfig') -- enable LSP
	use('williamboman/mason.nvim') -- install servers and more

	use {
		'williamboman/mason-lspconfig.nvim',
		'jose-elias-alvarez/null-ls.nvim',
		'jayp0521/mason-null-ls.nvim',
	}

	use { 'glepnir/lspsaga.nvim', branch = 'main' }
end
