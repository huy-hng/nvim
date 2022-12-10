local function diagnostic_float()
	local float_bufnr, win_id = vim.diagnostic.open_float()
	CurrentFloatWinId = win_id
end

local lsp_formatting = function(--[[ bufnr ]])
	vim.lsp.buf.format {
		async = true,
		filter = function(client)
			-- return client.name == "sumneko_lua"
			return client.name == 'null-ls'
		end,
	}
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local opts = { buffer = bufnr }

	local lsp_map = PrefixMap('n', '', '[LSP]', opts)
	local diag_map = PrefixMap('n', '', '[Diagnostic]', opts)

	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	diag_map('<leader>e', diagnostic_float, 'open Float')
	diag_map('[d', vim.diagnostic.goto_prev, 'Go to prev')
	diag_map(']d', vim.diagnostic.goto_next, 'Go to next')
	lsp_map('<leader>r', vim.diagnostic.setloclist)

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	lsp_map('K', vim.lsp.buf.hover, 'Hover')
	lsp_map('gD', vim.lsp.buf.declaration, 'Declaration')
	lsp_map('gd', vim.lsp.buf.definition, 'Definition')
	lsp_map('gi', require('lsp.handlers').implementation, 'Implementation')
	lsp_map('gs', vim.lsp.buf.signature_help, 'Signature Help')
	lsp_map('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')

	lsp_map('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add Workspace')
	lsp_map('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace')
	lsp_map('<leader>wl', function()
		vim.pretty_print(vim.lsp.buf.list_workspace_folders())
	end, 'List Workspaces')

	lsp_map('<F2>', vim.lsp.buf.rename, 'Rename')
	lsp_map('<F12>', vim.lsp.buf.references, 'References')
	lsp_map('<leader>ca', vim.lsp.buf.code_action, 'Code Actions')
	lsp_map('<leader>ff', lsp_formatting, 'Format Document')
	-- lsp_map('<leader>lr', require('lsp.codelens').run, 'codelens')
end
