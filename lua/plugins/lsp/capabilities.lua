local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = nrequire('cmp_nvim_lsp')
capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities(capabilities)

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

return capabilities
