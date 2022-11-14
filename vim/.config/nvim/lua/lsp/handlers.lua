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

local fn = require('helpers.wrappers').fn

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- buf_nnoremap(bufnr, 'gl', fn(vim.diagnostic.open_float, { border = 'rounded' }))
nmap('<leader>e', vim.diagnostic.open_float, 'lsp diagnostic float')
nmap('[d', vim.diagnostic.goto_prev)
nmap(']d', vim.diagnostic.goto_next)
-- nmap('<leader>q', vim.diagnostic.setloclist, opts)

local buf_nnoremap = function(lhs, rhs, bufnr, desc, opts)
	opts = opts or {}
	opts.buffer = bufnr
	nmap(lhs, rhs, desc, opts)
end

local lsp_formatting = function(--[[ bufnr ]])
	vim.lsp.buf.format {
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

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_nnoremap('gD', vim.lsp.buf.declaration, bufnr)
	buf_nnoremap('gd', vim.lsp.buf.definition, bufnr)
	buf_nnoremap('K', vim.lsp.buf.hover, bufnr)
	buf_nnoremap('gi', vim.lsp.buf.implementation, bufnr)
	-- buf_nnoremap('<C-k>', vim.lsp.buf.signature_help, bufnr)
	buf_nnoremap('<leader>wa', vim.lsp.buf.add_workspace_folder, bufnr)
	buf_nnoremap('<leader>wr', vim.lsp.buf.remove_workspace_folder, bufnr)
	buf_nnoremap(
		'<leader>wl',
		function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
		bufnr
	)
	buf_nnoremap('<leader>D', vim.lsp.buf.type_definition, bufnr)
	buf_nnoremap('<F2>', vim.lsp.buf.rename) -- <leader>r, bufnr)
	buf_nnoremap('<F12>', vim.lsp.buf.references) -- g, bufnr)
	buf_nnoremap('<leader>ca', vim.lsp.buf.code_action, bufnr)
	-- buf_nnoremap('<leader>ff', fn(vim.lsp.buf.format, { async = true }), bufnr, 'Format Document')
	-- buf_nnoremap('<leader>ff', lsp_formatting, bufnr, 'Format Document')

	buf_nnoremap(
		'<leader>ff',
		fn(vim.lsp.buf.format, {
			async = true,
			filter = function(client)
				--  only use null-ls for formatting instead of lsp server
				return client.name == 'null-ls'
			end,
		}),
		bufnr,
		'Format Document'
	)
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
