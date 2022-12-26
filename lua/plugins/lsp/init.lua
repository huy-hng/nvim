local M = {
	'neovim/nvim-lspconfig', -- enable LSP
	-- ft = { 'python', 'lua', 'c', 'json' },
	dependencies = {
		'williamboman/mason.nvim', -- install servers and more
		'folke/neodev.nvim',

		'williamboman/mason-lspconfig.nvim',
		'jose-elias-alvarez/null-ls.nvim',
		'jayp0521/mason-null-ls.nvim',

	},
}

-- print(package.path)
-- package.path = "../?.lua;" .. package.path
-- local file_path = ... -- pathOfThisFile is now 'lib.foo.bar'
-- print(file_path)

-- local require_path = (...):match('(.-)[^%.]+$') -- returns 'lib.foo.'
-- require(require_path .. 'mason')

function M.config()
	require('plugins.lsp.mason')
	require('plugins.lsp.handlers')
	require('plugins.lsp.diagnostic')
	require('plugins.lsp.server_setup')
	require('plugins.lsp.null-ls')
end

return M
