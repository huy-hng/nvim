local M = {
	'neovim/nvim-lspconfig',
	-- ft = { 'python', 'lua', 'c', 'json' },
	-- event = 'BufReadPre',
	-- event = 'VeryLazy',
	lazy = false,
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'folke/neodev.nvim',
	},
}

-- package.path = "../?.lua;" .. package.path
-- local file_path = ... -- pathOfThisFile is now 'lib.foo.bar'
-- print(file_path)

-- local require_path = (...):match('(.-)[^%.]+$') -- returns 'lib.foo.'
-- require(require_path .. 'mason')

function M.config()
	require('plugins.lsp.core.neodev')
	require('plugins.lsp.core.diagnostics')
	require('plugins.lsp.null_ls')
	require('plugins.lsp.core.handlers')

	Map.n(Keys.K, function()
		local peek_fold = require('plugins.ui.ufo.functions').peek_fold

		if peek_fold() then return end
		vim.lsp.buf.hover()
	end, 'Hover')

	require('plugins.lsp.core.server_setup').setup()
end

return M
