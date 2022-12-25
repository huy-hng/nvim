local lspconfig = require('lspconfig')

local language_servers = {
	'jsonls',
	'sumneko_lua',
	'pyright',
	'clangd',
}

local lsp_flags = {
	debounce_text_changes = 1000,
	allow_incremental_sync = false,
}

local opts = {
	on_attach = require('plugins.lsp.keymaps').on_attach,
	capabilities = require('plugins.lsp.capabilities'),
	flags = lsp_flags,
}

for _, server in ipairs(language_servers) do
	local server_opts = nrequire('plugins.lsp.servers.' .. server)
	if server_opts then --
		opts = vim.tbl_deep_extend('force', opts, server_opts)
	end
	lspconfig[server].setup(opts)
end
