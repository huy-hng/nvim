local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
	    dynamicRegistration = false,
	    lineFoldingOnly = true
}

local has_cmp_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp_lsp then M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities) end

return capabilities
