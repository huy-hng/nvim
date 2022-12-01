---@diagnostic disable: missing-parameter

local M = {}

local function handler(name, fn, config)
	vim.lsp.handlers[name] = vim.lsp.with(fn, config)
end

handler('textDocument/hover', vim.lsp.handlers.hover, {
	border = 'rounded', --[[ width = 60 ]]
	row = 10,
	col = 10,
	-- TODO: params so that the floating window stays inside the main window
})

handler('textDocument/signatureHelp', vim.lsp.handlers.signature_help, {
	border = 'rounded', --[[ width = 60 ]]
})

-- Jump directly to the first available definition every time.
vim.lsp.handlers['textDocument/definition'] = function(_, result)
	if not result or vim.tbl_isempty(result) then
		print('[LSP] Could not find definition')
		return
	end

	if vim.tbl_islist(result) then
		vim.lsp.util.jump_to_location(result[1], 'utf-8')
	else
		vim.lsp.util.jump_to_location(result, 'utf-8')
	end
end

vim.lsp.handlers['window/showMessage'] = require('lsp.show_message')

-- handler('textDocument/publishDiagnostics', vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	update_in_insert = true,
-- 	signs = {
-- 		severity_limit = 'Error',
-- 	},
-- 	underline = {
-- 		severity_limit = 'Warning',
-- 	},
-- 	virtual_text = true,
-- })

-- local function lsp_highlight_document(client)
-- 	-- Set autocommands conditional on server_capabilities
-- 	local status_ok, illuminate = pcall(require, 'illuminate')
-- 	if not status_ok then
-- 		return
-- 	end
-- 	illuminate.on_attach(client)
-- end
M.implementation = function()
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, 'textDocument/implementation', params, function(err, result, ctx, config)
		local bufnr = ctx.bufnr
		local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

		-- In go code, I do not like to see any mocks for impls
		if ft == 'go' then
			local new_result = vim.tbl_filter(function(v)
				return not string.find(v.uri, 'mock_')
			end, result)

			if #new_result > 0 then result = new_result end
		end

		vim.lsp.handlers['textDocument/implementation'](err, result, ctx, config)
		vim.cmd([[normal! zz]])
	end)
end

-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_keymaps = require('lsp.keymaps')

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

local capabilities = vim.lsp.protocol.make_client_capabilities()

local has_cmp_lsp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if has_cmp_lsp then M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities) end

-- vim.lsp.util.open_floating_preview({'asd', 'asd2' })
-- vim.lsp.util.preview_location()

return M
