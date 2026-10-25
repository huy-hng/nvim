local layout = require('plugins.editor.telescope.layouts').vert_list_normal
local references = require('telescope.builtin').lsp_references
local fns = require('plugins.lsp.core.functions')

Map.nv('<leader>ll', fns.lsp_format, 'Format Document or Selection')

return function(bufnr)
	vim.api.nvim_set_option_value('omnifunc',  'v:lua.vim.lsp.omnifunc', {buf=bufnr})

	local opts = { buffer = bufnr }

	local no_prefix_map = Map.new('', '', '[LSP]', opts)
	local lsp_map = Map.new('<leader>l', '', '[LSP]', opts)

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
	require('plugins.lsp.lspsaga').keymaps()

end
