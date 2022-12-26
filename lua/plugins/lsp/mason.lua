local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_null_ls = require('mason-null-ls')

mason.setup()

mason_lspconfig.setup {
	ensure_installed = {
		'sumneko_lua',
		'pyright',
		-- 'json-lsp',
	},
	automatic_installation = true, -- not the same as ensure_installed
}

mason_null_ls.setup {
	ensure_installed = {
		'autopep8', -- python linter
		'prettier', -- ts/js formatter
		'stylua', -- lua formatter
		'yamlfmt',
		'fixjson',
	},
	automatic_installation = true,
}
