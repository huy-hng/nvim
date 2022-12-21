local debug = false

local M = {}

local function handler(name, fn, config) vim.lsp.handlers[name] = vim.lsp.with(fn, config) end

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
		-- Feedkeys('K')
		vim.lsp.handlers.hover(_, result, ctx, lsp_config)
		return
	end

	local content = vim.fn.split(result.contents.value, '\n')
	local line_lengths = vim.tbl_map(string.len, content)

	if vim.tbl_isempty(line_lengths) then line_lengths = { 1 } end
	local content_width = math.max(unpack(line_lengths))

	local max_window_width, max_window_height = max_window_size()

	if max_window_width > 1 then --
		lsp_config.wrap_at = math.min(content_width, max_window_width)
	end
	-- lsp_config.border = { '█', '▀', '█', '█', '█', '▄', '█', '█' }

	lsp_config.border = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' }
	-- lsp_config.border = 'rounded'
	local bufnr, winnr = vim.lsp.handlers.hover(_, result, ctx, lsp_config)
	if winnr == nil then return end

	require('plugins.lsp.keymaps').close_with_esc(winnr)

	local win_config = vim.api.nvim_win_get_config(winnr)

	if max_window_height > 1 then
		win_config.height = math.min(win_config.height, max_window_height)
	end

	if max_window_width > 1 then --
		win_config.width = math.min(win_config.width, max_window_width)
	end

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
		vim.lsp.util.jump_to_location(result[1], 'utf-8', true)
	else
		vim.lsp.util.jump_to_location(result, 'utf-8', true)
	end
end

-- vim.lsp.handlers['window/showMessage'] = require('plugins.lsp.show_message')

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

-- vim.lsp.util.open_floating_preview({'asd', 'asd2' })
-- vim.lsp.util.preview_location()

return M
