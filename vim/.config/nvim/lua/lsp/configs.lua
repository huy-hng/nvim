local lspconfig = require('lspconfig')

local servers = {
	'jsonls',
	'sumneko_lua',
	'pyright',
	-- 'yamlfmt'
}

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local opts = {
	on_attach = require('lsp.handlers').on_attach,
	capabilities = require('lsp.handlers').capabilities,
	flags = lsp_flags,
}

for _, server in pairs(servers) do
	local has_custom_opts, server_custom_opts = pcall(require, 'lsp.servers.' .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend('force', opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
