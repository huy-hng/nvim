local capabilities = vim.lsp.protocol.make_client_capabilities()

---@module 'cmp_nvim_lsp'
local cmp_nvim_lsp = nrequire('cmp_nvim_lsp')
if cmp_nvim_lsp then --
	cmp_nvim_lsp.default_capabilities(capabilities)
end
-- capabilities.textDocument.completion.completionItem.snippetSupport = false
-- capabilities.textDocument.completion.contextSupport = false

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local function on_attach(client, bufnr)
	-- if vim.lsp.semantic_tokens then vim.lsp.semantic_tokens.stop(bufnr, client.id) end
	require('plugins.lsp.core.keymaps')(bufnr)

	-- TODO: refactor this to the clangd server file ../servers/clangd.lua (shortcut 'gf' or 'jf' with colemak)
	if client.name == 'clangd' then
		require('clangd_extensions.inlay_hints').setup_autocmd()
		require('clangd_extensions.inlay_hints').set_inlay_hints()
	end
end

return {
	on_attach = on_attach,
	capabilities = capabilities,
}
