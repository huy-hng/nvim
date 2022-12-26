-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
local status, neodev = pcall(require, 'neodev')
if status then
	neodev.setup {
		library = {
			enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
			-- these settings will be used for your Neovim config directory
			runtime = true, -- runtime path
			types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
			-- plugins = true, -- installed opt or start plugins in packpath
			-- you can also specify the list of plugins to make available as a workspace library
			plugins = { 'nvim-treesitter', 'plenary.nvim', 'telescope.nvim', 'neotest' },
		},
		setup_jsonls = false, -- configures jsonls to provide completion for project specific .luarc.json files
		-- for your Neovim config directory, the config.library settings will be used as is
		-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
		-- for any other directory, config.library.enabled will be set to false
		override = function(root_dir, options) end,
		-- With lspconfig, Neodev will automatically setup your lua-language-server
		-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
		-- in your lsp start options
		lspconfig = true,
	}
end

return {
	settings = {
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { 'vim', 'pcall', 'require' },
			},
			workspace = {
				-- make language server aware of runtime files
				-- library = vim.api.nvim_get_runtime_file('', true),
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				},
			},
		},
	},
}
