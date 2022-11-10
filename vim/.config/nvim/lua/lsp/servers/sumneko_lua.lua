-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
-- require("neodev").setup()

return {
	settings = {
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				},
			},
		},
	},
}
