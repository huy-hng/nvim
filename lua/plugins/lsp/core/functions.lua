local M = {}

local function unmapper(bufnr) Map.unmap('n', '<esc>', { buffer = bufnr }) end

function M.close_with_esc(win_id, bufnr)
	bufnr = bufnr or 0

	Map.n('<esc>', function()
		pcall(vim.api.nvim_win_close, win_id, true)
		unmapper(bufnr)
	end, 'close diagnostic float', { buffer = bufnr })
end

local function get_diagnostics(opts, bufnr, line_nr, client_id)
	bufnr = bufnr or 0
	line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
	opts = opts or { ['lnum'] = line_nr }

	local line_diagnostics = vim.diagnostic.get(bufnr, opts)
	if vim.tbl_isempty(line_diagnostics) then return end

	local messages = {}
	for i, diagnostic in ipairs(line_diagnostics) do
		P(line_diagnostics)
		local message = string.format('%d: %s', i, diagnostic.message or '')
		-- if i ~= #line_diagnostics then message = message .. '\n' end
		table.insert(messages, message)
	end
	-- vim.api.nvim_echo({ { diagnostic_message, 'Normal' } }, false, {})
	return messages
end

function M.diagnostic_float()
	local bufnr, win_id = vim.diagnostic.open_float()
	if not win_id then return end

	local config = vim.api.nvim_win_get_config(win_id)
	-- P(config)
	config.col[false] = 0
	-- config.anchor = 'NE'
	vim.api.nvim_win_set_config(win_id, config)

	M.close_with_esc(win_id, bufnr)
end

----------------------------------------------Formatting--------------------------------------------

function M.lsp_format(outer_opts)
	local opts = {
		async = true,
		-- filter = function(client)
		-- 	-- return client.name == "sumneko_lua"
		-- 	return client.name == 'null-ls'
		-- end,
		name = 'null-ls',
	}
	opts = vim.tbl_extend('force', opts, outer_opts or {})
	vim.lsp.buf.format(opts)
end

function M.format_range_operator()
	local old_func = vim.go.operatorfunc
	---@diagnostic disable-next-line: duplicate-set-field
	_G.op_func_formatting = function()
		local start = vim.api.nvim_buf_get_mark(0, '[')
		local finish = vim.api.nvim_buf_get_mark(0, ']')
		-- P(start, finish)
		-- vim.lsp.buf.range_formatting({}, start, finish)
		M.lsp_format { range = { start, finish } }

		vim.go.operatorfunc = old_func
		_G.op_func_formatting = nil
	end
	vim.go.operatorfunc = 'v:lua.op_func_formatting'
	-- vim.api.nvim_feedkeys('g@', 'n', false)
	return 'g@'
end

function M.implementation()
	---@diagnostic disable-next-line: missing-parameter
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, 'textDocument/implementation', params, function(err, result, ctx, config)
		local bufnr = ctx.bufnr
		local ft = vim.api.nvim_buf_get_option(bufnr, 'filetype')

		-- In go code, I do not like to see any mocks for impls

		vim.lsp.handlers['textDocument/implementation'](err, result, ctx, config)
		vim.cmd([[normal! zz]])
	end)
end

-- peek definition
local function preview_location_callback(_, result)
	if result == nil or vim.tbl_isempty(result) then return nil end
	vim.lsp.util.preview_location(result[1])
end

function M.PeekDefinition()
	local params = vim.lsp.util.make_position_params()
	return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end


return M
