-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require('neodev').setup {
	library = {
		enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
		-- these settings will be used for your Neovim config directory
		runtime = true, -- runtime path
		types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
		-- plugins = true, -- installed opt or start plugins in packpath
		plugins = {
			'nvim-cmp',
			'plenary.nvim',
			'noice.nvim',
			'toggleterm.nvim',
			'anyline.nvim',
			'bufman.nvim',
			'alpha-nvim',
			'possession.nvim',
		},
	},
	setup_jsonls = false, -- configures jsonls to provide completion for project specific .luarc.json files
	-- for your Neovim config directory, the config.library settings will be used as is
	-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
	-- for any other directory, config.library.enabled will be set to false
	-- override = function(root_dir, options)
	-- 	P(root_dir, options)
	-- end,

	-- With lspconfig, Neodev will automatically setup your lua-language-server
	-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
	-- in your lsp start options
	lspconfig = true,

	pathStrict = true,
}
