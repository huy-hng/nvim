local layout = require('plugins.editor.telescope.layouts').vert_list_normal
local references = require('telescope.builtin').lsp_references
local fns = require('plugins.lsp.core.functions')

return function(bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { buffer = bufnr }

	local no_prefix_map = Map.create('n', '', '[LSP]', opts)
	local lsp_map = Map.create('n', '<leader>l', '[LSP]', opts)
	local diag_map = Map.create('n', '<leader>l', '[Diagnostic]', opts)
	local saga_map = Map.create('n', '<leader>l', '[Saga]', opts)

	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	diag_map('o', fns.diagnostic_float, 'open Float')
	diag_map('n', vim.diagnostic.goto_prev, 'Go to prev Diagnostic')
	diag_map('e', vim.diagnostic.goto_next, 'Go to next Diagnostic')

	lsp_map('gl', vim.diagnostic.setloclist)

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
	lsp_map('a', vim.lsp.buf.code_action, 'Code Actions')
	lsp_map('c', require('plugins.lsp.core.codelens').run, 'codelens')

	if not nrequire('lspsaga') then return end

	no_prefix_map('N', { vim.cmd.Lspsaga, 'show_line_diagnostics', '++unfocus' }, 'open Float')

	saga_map('o', { vim.cmd.Lspsaga, 'show_line_diagnostics', '++unfocus' }, 'open Float')
	saga_map('O', { vim.cmd.Lspsaga, 'show_line_diagnostics' }, 'open Float')
	saga_map('f', { vim.cmd.Lspsaga, 'lsp_finder' }, 'Lsp finder')
	saga_map('a', { vim.cmd.Lspsaga, 'code_action' }, 'Code Actions')
	saga_map('p', { vim.cmd.Lspsaga, 'peek_definition' }, 'Peek Definition')

	local saga_diag = require('lspsaga.diagnostic')
	local severity = { severity = vim.diagnostic.severity.WARN }
	saga_map('e', function() saga_diag:goto_prev(severity) end, 'Go to prev Diagnostic')
	saga_map('n', function() saga_diag:goto_next(severity) end, 'Go to next Diagnostic')
end
