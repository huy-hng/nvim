local layout = require('plugins.editor.telescope.layouts').vert_list_normal
local references = require('telescope.builtin').lsp_references
local fns = require('plugins.lsp.core.functions')

Map.nv('<leader>ll', fns.lsp_format, 'Format Document or Selection')

return function(bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local opts = { buffer = bufnr }

	local no_prefix_map = Map.new('', '', '[LSP]', opts)
	local lsp_map = Map.new('<leader>l', '', '[LSP]', opts)
	local diag_map = Map.new('<leader>l', '', '[Diagnostic]', opts)
	local saga_map = Map.new('<leader>l', '', '[Saga]', opts)

	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	-- diag_map.n('o', fns.diagnostic_float, 'open Float')
	no_prefix_map.n('N', fns.diagnostic_float, 'open Float')

	diag_map.n('n', vim.diagnostic.goto_prev, 'Go to prev Diagnostic')
	diag_map.n('e', vim.diagnostic.goto_next, 'Go to next Diagnostic')

	lsp_map.n('gl', vim.diagnostic.setloclist)
	lsp_map.n('P', fns.PeekDefinition)

	-- lsp_map.n('m', fns.format_range_operator, 'Format Motion')
	lsp_map.n('D', vim.lsp.buf.declaration, 'Declaration')
	-- lsp_map.n('D', vim.lsp.buf.type_definition, 'Type Definition')
	lsp_map.n('d', vim.lsp.buf.definition, 'Definition')

	lsp_map.n('i', vim.lsp.buf.implementation, 'Implementation')
	-- lsp_map.n('i', fns.implementation, 'Implementation')
	lsp_map.n('h', vim.lsp.buf.signature_help, 'Signature Help')

	local list_workspace_folders = function() vim.print(vim.lsp.buf.list_workspace_folders()) end
	lsp_map.n('wl', list_workspace_folders, 'List Workspaces')
	lsp_map.n('wa', vim.lsp.buf.add_workspace_folder, 'Add Workspace')
	lsp_map.n('wr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace')

	lsp_map.n('s', { references, layout }, '[Telescope] LSP References')
	lsp_map.n('r', vim.lsp.buf.rename, 'Rename')
	lsp_map.n('a', vim.lsp.buf.code_action, 'Code Actions')
	lsp_map.n('c', require('plugins.lsp.core.codelens').run, 'codelens')

	if not nrequire('lspsaga') then return end
	local diags = require('lspsaga.diagnostic.show')

	-- no_prefix_map.n('N', { vim.cmd.Lspsaga, 'show_line_diagnostics', '++unfocus' }, 'open Float')
	-- no_prefix_map.n('N', function()
	-- 	diags:show_diagnostics { line = true, args = { '++float' } }
	-- 	vim.schedule(function()
	-- 		print(diags.winid)
	-- 		local config = vim.api.nvim_win_get_config(diags.winid)
	-- 		config.anchor = 'NE'
	-- 		vim.api.nvim_win_set_config(diags.winid, config)
	-- 	end)
	-- end, 'open Float')

	saga_map.n('o', { vim.cmd.Lspsaga, 'show_workspace_diagnostics' }, 'open workspace diagnostics')
	saga_map.n('O', { vim.cmd.Lspsaga, 'show_line_diagnostics' }, 'open Float')
	saga_map.n('f', { vim.cmd.Lspsaga, 'finder' }, 'Lsp finder')
	saga_map.n('a', { vim.cmd.Lspsaga, 'code_action' }, 'Code Actions')
	saga_map.n('p', { vim.cmd.Lspsaga, 'peek_definition' }, 'Peek Definition')

	local saga_diag = require('lspsaga.diagnostic')
	local severity = { severity = vim.diagnostic.severity.WARN }
	saga_map.n('e', function() saga_diag:goto_prev(severity) end, 'Go to prev Diagnostic')
	saga_map.n('n', function() saga_diag:goto_next(severity) end, 'Go to next Diagnostic')
end
