local M = {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'jayp0521/mason-null-ls.nvim',
	},
	event = 'VeryLazy',
}

function M.config()
	require('mason').setup()

	require('mason-lspconfig').setup {
		ensure_installed = {
			'pyright',
		},
		automatic_installation = true, -- not the same as ensure_installed
	}

	require('mason-null-ls').setup {
		ensure_installed = {
			-- formatting
			'beautysh', -- bash and other shell languages
			'prettier', -- ts/js formatter
			'stylua', -- lua formatter
			'yamlfmt',
			'fixjson',

			-- diagnostics
			'autopep8', -- python linter
			'vimls',
		},
		automatic_installation = true,
	}
end

return M
