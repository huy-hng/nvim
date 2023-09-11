local M = {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'jay-babu/mason-null-ls.nvim',
	},
	event = 'VeryLazy',
}

function M.config()
	require('mason').setup {
		ui = {
			check_outdated_packages_on_open = true,
			border = 'none',
			width = 100,
			height = 0.9,
			icons = {
				package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
			},
			keymaps = {
				toggle_package_expand = '<CR>',
				install_package = 'y',
				update_package = 'u',
				update_all_packages = 'U',
				-- Keymap to check for new version for the package under the current cursor position
				check_package_version = 'c',
				-- Keymap to check which installed packages are outdated
				check_outdated_packages = 'C',
				uninstall_package = 'X',
				cancel_installation = '<C-c>',
				apply_language_filter = '<C-f>',
				toggle_package_install_log = '<CR>',
				toggle_help = '?',
			},
		},
	}

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
			'autopep8', -- python

			-- diagnostics
			'vimls',
		},
		automatic_installation = false,
	}
end

return M
