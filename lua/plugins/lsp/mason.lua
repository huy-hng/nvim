local mason = nrequire('mason')
local mason_lspconfig = nrequire('mason-lspconfig')
local mason_null_ls = nrequire('mason-null-ls')

if not mason then return end
if not mason_lspconfig then return end
if not mason_null_ls then return end

-- enable mason
mason.setup()

mason_lspconfig.setup {
	-- list of servers for mason to install
	ensure_installed = {
		-- 'lua-language-server',
		'sumneko_lua',
		'pyright',
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = false, -- not the same as ensure_installed
}

mason_null_ls.setup {
	-- list of formatters & linters for mason to install
	ensure_installed = {
		'autopep8', -- python linter
		'prettier', -- ts/js formatter
		'stylua', -- lua formatter
		'yamlfmt',
		'fixjson',
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
}
