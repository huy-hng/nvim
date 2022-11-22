local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = 'DiagnosticSignError', text = '' },
		{ name = 'DiagnosticSignWarn', text = '' },
		{ name = 'DiagnosticSignHint', text = '' },
		{ name = 'DiagnosticSignInfo', text = '' },
	}

	-- for _, sign in ipairs(signs) do
	-- vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
	-- end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = 'rounded', --[[ width = 60 ]]
	})

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'rounded', --[[ width = 60 ]]
	})
end

local fn = require('core.wrappers').fn

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- buf_nnoremap(bufnr, 'gl', fn(vim.diagnostic.open_float, { border = 'rounded' }))
nmap('<leader>e', vim.diagnostic.open_float, 'lsp diagnostic float')
nmap('[d', vim.diagnostic.goto_prev)
nmap(']d', vim.diagnostic.goto_next)
-- nmap('<leader>q', vim.diagnostic.setloclist, opts)

local lsp_formatting = function(--[[ bufnr ]])
	vim.lsp.buf.format {
		async = true,
		filter = function(client)
			-- return client.name == "sumneko_lua"
			return client.name == 'null-ls'
		end,
		-- async = true,
	}
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local lsp_keymaps = function(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	local opts = { buffer = bufnr }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	nmap('gD', vim.lsp.buf.declaration, 'Declaration', opts)
	nmap('gd', vim.lsp.buf.definition, 'Definition', opts)
	nmap('K', vim.lsp.buf.hover, 'Hover', opts)
	nmap('gi', vim.lsp.buf.implementation, 'Implementation', opts)
	-- nmap('<C-k>', vim.lsp.buf.signature_help, '', opts)
	nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Add Workspace', opts)
	nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace', opts)
	-- nmap('<leader>wl', FN(vim.pretty_print, FN(vim.lsp.buf.list_workspace_folders)), 'List Workspaces', opts)
	nmap('<leader>wl', function()
		vim.pretty_print(vim.lsp.buf.list_workspace_folders())
	end, 'List Workspaces', opts)
	nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition', opts)
	nmap('<F2>', vim.lsp.buf.rename, 'Rename')
	nmap('<F12>', vim.lsp.buf.references, 'References')
	nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Actions', opts)
	nmap('<leader>ff', lsp_formatting, 'Format Document', opts)
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, 'illuminate')
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

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
	-- vim.notify(client.name .. ' starting...')
	-- TODO: refactor this into a method that checks if string in list
	if client.name == 'tsserver' then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	-- lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- local lsp_flags = {
-- 	-- This is the default in Nvim 0.7+
-- 	debounce_text_changes = 150,
-- }
-- require('lspconfig')['pyright'].setup {
-- 	on_attach = M.on_attach,
-- 	flags = lsp_flags,
-- }
-- require('lspconfig')['tsserver'].setup {
-- 	on_attach = M.on_attach,
-- 	flags = lsp_flags,
-- }
-- require('lspconfig')['rust_analyzer'].setup {
-- 	on_attach = M.on_attach,
-- 	flags = lsp_flags,
-- 	-- Server-specific settings...
-- 	settings = {
-- 		['rust-analyzer'] = {}
-- 	}
-- }

return M
