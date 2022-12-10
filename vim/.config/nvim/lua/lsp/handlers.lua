---@diagnostic disable: missing-parameter

local debug = false

local M = {}

local function handler(name, fn, config)
	vim.lsp.handlers[name] = vim.lsp.with(fn, config)
end

-- local function max_window_size()
-- 	local width = vim.api.nvim_win_get_width(0)
-- 	local height = vim.api.nvim_win_get_height(0)
-- 	local pos = vim.fn.getcurpos()
-- 	-- local pos = vim.fn.getcursorcharpos()
-- 	local max_width = width - pos[5]
-- 	local max_height = height - pos[2]
-- 	return max_width, max_height
-- end

local api = vim.api
local function window_gutter_sizes()
	local win_nrs = api.nvim_tabpage_list_wins(0)

	local cur_win_nr = api.nvim_get_current_win()
	local cur_win_pos = api.nvim_win_get_position(cur_win_nr)

	local cur_win_width = api.nvim_win_get_width(0)
	P(cur_win_width)
	P(cur_win_pos)

	for _, winnr in ipairs(win_nrs) do
		local pos = api.nvim_win_get_position(winnr)
		P(pos)
	end
end

-- window_gutter_sizes()

local function max_window_size()
	local ui = api.nvim_list_uis()[1]
	local ui_height = ui.height
	local ui_width = ui.width

	local cur_win_nr = api.nvim_get_current_win()
	local cur_win_pos = api.nvim_win_get_position(cur_win_nr)

	local cursor_pos = vim.fn.getcursorcharpos()

	local rel_cursor_line = cur_win_pos[1] + cursor_pos[2]
	local rel_cursor_column = cur_win_pos[2] + cursor_pos[5]

	local max_width = ui_width - rel_cursor_column
	local max_height = ui_height - rel_cursor_line

	-- adjustments:
	max_width = max_width - 8 -- for gutter TODO: find a way to calc this properly
	max_height = max_height - 2 -- for tabline and statusline?

	max_height = max_height - 2 -- for top and bottom borders (remove this when no borders)
	max_width = max_width - 2 -- for borders

	if debug then
		print('max_window_size()')
		print('                              line | column')
		print('                      cur_win:  ', cur_win_pos[1], '|', cur_win_pos[2])
		print('                       cursor: ', cursor_pos[2], '|', cursor_pos[5])
		print('cur_win + cursor = rel cursor: ', rel_cursor_line, '|', rel_cursor_column)

		print('                           ui: ', ui_height, '|', ui_width)
		print('      ui - rel cursor = final: ', max_height, '|', max_width)
	end
	return max_width, max_height
end

handler('textDocument/hover', function(_, result, ctx, lsp_config)
	if result == nil then
		vim.lsp.handlers.hover(_, result, ctx, lsp_config)
		return
	end

	local content = vim.fn.split(result.contents.value, '\n')
	local line_lengths = vim.tbl_map(string.len, content)
	local content_width = math.max(unpack(line_lengths))

	local max_window_width, max_window_height = max_window_size()

	if max_window_width > 1 then --
		lsp_config.wrap_at = math.min(content_width, max_window_width)
	end

	lsp_config.border = 'rounded'
	local _--[[ bufnr ]], winnr = vim.lsp.handlers.hover(_, result, ctx, lsp_config)
	if winnr == nil then return end

	local win_config = vim.api.nvim_win_get_config(winnr)
	-- P(win_config.height, win_config.width)

	if max_window_height > 1 then
		win_config.height = math.min(win_config.height, max_window_height)
	end

	if max_window_width > 1 then --
		win_config.width = math.min(win_config.width, max_window_width)
	end

	-- P(win_config.height, win_config.width)

	-- win_config.anchor = 'SE'
	vim.api.nvim_win_set_config(winnr, win_config)
end, {})

-- handler('textDocument/signatureHelp', vim.lsp.handlers.signature_help, {
-- 	border = 'rounded', --[[ width = 60 ]]
-- })

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
