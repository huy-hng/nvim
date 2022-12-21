---@diagnostic disable: missing-parameter
local M = {}

local function unmapper(bufnr) UNmap('n', '<esc>', { buffer = bufnr }) end

function M.close_with_esc(win_id, bufnr)
	bufnr = bufnr or 0

	-- augroup('FloatingWindowManager', false, {
	-- 	autocmd('WinClosed', '*', { unmapper, bufnr }, { buffer = bufnr }),
	-- })

	Nmap('<esc>', function()
		pcall(vim.api.nvim_win_close, win_id, true)
		unmapper(bufnr)
	end, 'close diagnostic float', { buffer = bufnr })
end

local function diagnostic_float()
	local bufnr, win_id = vim.diagnostic.open_float()
	M.close_with_esc(win_id)
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

M.implementation = function()
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, 'textDocument/implementation', params, function(err, result, ctx, config)
		local bufnr = ctx.bufnr
		local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

		-- In go code, I do not like to see any mocks for impls

		vim.lsp.handlers['textDocument/implementation'](err, result, ctx, config)
		vim.cmd([[normal! zz]])
	end)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local lsp_keymaps = function(bufnr)
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
	lsp_map('gi', M.implementation, 'Implementation')
	lsp_map('gs', vim.lsp.buf.signature_help, 'Signature Help')
	lsp_map('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')

	lsp_map('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add Workspace')
	lsp_map('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace')
	lsp_map(
		'<leader>wl',
		function() vim.pretty_print(vim.lsp.buf.list_workspace_folders()) end,
		'List Workspaces'
	)

	local layout = require('plugins.telescope.layouts').vert_list_normal
	local references = require('telescope.builtin').lsp_references
	lsp_map('gr', { references, layout }, '[Telescope] LSP References')
	lsp_map('<F2>', vim.lsp.buf.rename, 'Rename')
	-- telescope references defined in telescope keymaps
	-- lsp_map('<F12>', vim.lsp.buf.references, 'References')
	lsp_map('<leader>ca', vim.lsp.buf.code_action, 'Code Actions')
	lsp_map('<leader>ff', lsp_formatting, 'Format Document')
	-- lsp_map('<leader>lr', require('lsp.codelens').run, 'codelens')
end

M.on_attach = function(client, bufnr)
	-- autoformat on save
	-- if client.supports_method 'textDocument/formatting' then
	-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 	vim.api.nvim_create_autocmd('BufWritePre', {
	-- 		group = augroup,
	-- 		buffer = bufnr,
	-- 		callback = function() lsp_formatting(bufnr) end,
	-- 	})
	-- end
	-- TODO: refactor this into a method that checks if string in list
	lsp_keymaps(bufnr)
	-- lsp_highlight_document(client)
end

return M
