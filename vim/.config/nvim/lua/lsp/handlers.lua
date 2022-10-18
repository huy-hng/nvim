local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

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
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		width = 60,
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		width = 60,
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

local buf_nnoremap = function(bufnr, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.buffer = bufnr
	nmap(lhs, rhs, desc, opts)
end

local fn = require('helpers.wrappers').fn
local function lsp_keymaps(bufnr)
	buf_nnoremap(bufnr, 'gD', vim.lsp.buf.declaration)
	buf_nnoremap(bufnr, 'gd', vim.lsp.buf.definition)
	buf_nnoremap(bufnr, 'K', vim.lsp.buf.hover)
	buf_nnoremap(bufnr, 'gi', vim.lsp.buf.implementation)
	-- buf_nnoremap(bufnr, '<C-k>', vim.lsp.buf.signature_help)
	buf_nnoremap(bufnr, '<F2>', vim.lsp.buf.rename)
	buf_nnoremap(bufnr, '<F12>', vim.lsp.buf.references)
	buf_nnoremap(bufnr, '<leader>ca', vim.lsp.buf.code_action)
	buf_nnoremap(bufnr, '<leader>f', vim.diagnostic.open_float)
	buf_nnoremap(bufnr, '[d', fn(vim.diagnostic.goto_prev, { border = 'rounded' }))
	buf_nnoremap(bufnr, 'gl', fn(vim.diagnostic.open_float, { border = 'rounded' }))
	buf_nnoremap(bufnr, ']d', fn(vim.diagnostic.goto_next, { border = 'rounded' }))
	-- buf_nnoremap(bufnr, '<leader>q', vim.diagnostic.setloclist)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format{async=true}' ]])
end

M.on_attach = function(client, bufnr)
	-- vim.notify(client.name .. " starting...")
	-- TODO: refactor this into a method that checks if string in list
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
