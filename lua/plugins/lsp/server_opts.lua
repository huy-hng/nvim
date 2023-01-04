local capabilities = vim.lsp.protocol.make_client_capabilities()

---@module 'cmp_nvim_lsp'
local cmp_nvim_lsp = nrequire('cmp_nvim_lsp')
capabilities = cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities(capabilities)

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local layout = require('plugins.telescope.layouts').vert_list_normal
local references = require('telescope.builtin').lsp_references
local fns = R('plugins.lsp.functions')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local function lsp_keymaps(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { buffer = bufnr }
	local lsp_map = MapCreator('n', '', '[LSP]', opts)
	local vlsp = MapCreator('v', '', '[LSP]', opts)
	local diag_map = MapCreator('n', '', '[Diagnostic]', opts)

	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	diag_map('<leader>e', fns.diagnostic_float, 'open Float')
	diag_map('[d', vim.diagnostic.goto_prev, 'Go to prev')
	diag_map(']d', vim.diagnostic.goto_next, 'Go to next')
	lsp_map('<leader>r', vim.diagnostic.setloclist)

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- lsp_map('K', vim.lsp.buf.hover, 'Hover')
	lsp_map('gm', fns.format_range_operator, 'Format Motion')
	lsp_map('gD', vim.lsp.buf.declaration, 'Declaration')
	lsp_map('gd', vim.lsp.buf.definition, 'Definition')
	lsp_map('gi', fns.implementation, 'Implementation')
	lsp_map('gs', vim.lsp.buf.signature_help, 'Signature Help')
	lsp_map('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')

	lsp_map('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add Workspace')
	lsp_map('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace')
	lsp_map(
		'<leader>wl',
		function() vim.pretty_print(vim.lsp.buf.list_workspace_folders()) end,
		'List Workspaces'
	)

	lsp_map('gr', { references, layout }, '[Telescope] LSP References')
	lsp_map('<F2>', vim.lsp.buf.rename, 'Rename')
	-- telescope references defined in telescope keymaps
	-- lsp_map('<F12>', vim.lsp.buf.references, 'References')
	lsp_map('<leader>ca', vim.lsp.buf.code_action, 'Code Actions')
	lsp_map('<leader>ff', fns.lsp_format, 'Format Document')
	vlsp('<leader>ff', fns.lsp_format, 'Format Visual Selection')
	-- lsp_map('<leader>lr', require('lsp.codelens').run, 'codelens')
end

local function on_attach(client, bufnr)
	pcall(function()
		if client.server_capabilities.semanticTokensProvider then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end)

	-- vim.lsp.semantic_tokens.stop(vim.api.nvim_get_current_buf(), 3)
	-- vim.lsp.semantic_tokens.start()
	-- vim.treesitter.stop()

	lsp_keymaps(bufnr)
	-- lsp_highlight_document(client)
end

return {
	on_attach = on_attach,
	capabilities = capabilities,
}
