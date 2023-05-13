local layout = require('plugins.editor.telescope.layouts').vert_list_normal
local references = require('telescope.builtin').lsp_references
local fns = require('plugins.lsp.config.functions')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { buffer = bufnr, langmap = false }

	local lsp_map = Map.create('n', '<leader>l', '[LSP]', opts)
	local diag_map = Map.create('n', '<leader>l', '[Diagnostic]', opts)

	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	diag_map('', fns.diagnostic_float, 'open Float')
	diag_map('n', vim.diagnostic.goto_prev, 'Go to prev')
	diag_map('e', vim.diagnostic.goto_next, 'Go to next')
	-- lsp_map('<leader>r', vim.diagnostic.setloclist)

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- lsp_map('K', vim.lsp.buf.hover, 'Hover')
	-- lsp_map('m', fns.format_range_operator, 'Format Motion')
	lsp_map('D', vim.lsp.buf.declaration, 'Declaration')
	-- lsp_map('D', vim.lsp.buf.type_definition, 'Type Definition')
	lsp_map('d', vim.lsp.buf.definition, 'Definition')
	lsp_map('i', fns.implementation, 'Implementation')
	lsp_map('h', vim.lsp.buf.signature_help, 'Signature Help')

	local list_workspace_folders = function() vim.print(vim.lsp.buf.list_workspace_folders()) end
	lsp_map('wl', list_workspace_folders, 'List Workspaces')
	lsp_map('wa', vim.lsp.buf.add_workspace_folder, 'Add Workspace')
	lsp_map('wr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace')

	lsp_map('s', { references, layout }, '[Telescope] LSP References')
	lsp_map('r', vim.lsp.buf.rename, 'Rename')
	-- telescope references defined in telescope keymaps
	-- lsp_map('<F12>', vim.lsp.buf.references, 'References')
	lsp_map('ca', vim.lsp.buf.code_action, 'Code Actions')
	lsp_map('cl', require('plugins.lsp.config.codelens').run, 'codelens')
	-- lsp_map('f', fns.lsp_format, 'Format Document or Selection', { mode = { 'n', 'v' } })
	lsp_map('l', fns.lsp_format, 'Format Document or Selection', { mode = { 'n', 'v' } })
end
