local M = {}

local function unmapper(bufnr) Map.unmap('n', '<esc>', { buffer = bufnr }) end

function M.close_with_esc(win_id, bufnr)
	bufnr = bufnr or 0

	Map.n('<esc>', function()
		pcall(vim.api.nvim_win_close, win_id, true)
		unmapper(bufnr)
	end, 'close diagnostic float', { buffer = bufnr })
end

function M.diagnostic_float()
	local bufnr, win_id = vim.diagnostic.open_float()
	if not win_id then return end
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

return M
