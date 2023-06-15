local M = {
	'neovim/nvim-lspconfig',
	-- ft = { 'python', 'lua', 'c', 'json' },
	-- event = 'BufReadPre',
	-- event = 'VeryLazy',
	lazy = false,
	dependencies = {
		{ 'folke/neodev.nvim', config = function() require('plugins.lsp.core.neodev') end },
		-- 'hrsh7th/cmp-nvim-lsp',
		'jose-elias-alvarez/null-ls.nvim',
	},
}

-- package.path = "../?.lua;" .. package.path
-- local file_path = ... -- pathOfThisFile is now 'lib.foo.bar'
-- print(file_path)

-- local require_path = (...):match('(.-)[^%.]+$') -- returns 'lib.foo.'
-- require(require_path .. 'mason')

function M.config()
	-- require('plugins.lsp.core.neodev')
	require('plugins.lsp.core.setup')
	require('plugins.lsp.core.handlers')

	local base_opts = require('plugins.lsp.core.server_opts')

	local language_servers = {
		'jsonls',
		'lua_ls',
		'pyright',
		'clangd',
		'vimls',
	}

	local lspconfig = require('lspconfig')
	for _, server in ipairs(language_servers) do
		local server_opts = nrequire('plugins.lsp.servers.' .. server)
		local opts = base_opts
		if server_opts then --
			opts = vim.tbl_deep_extend('force', base_opts, server_opts)
		end
		lspconfig[server].setup(opts)
	end
end

return M
