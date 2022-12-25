local M = {}

function M.delete_all_autocmds_with_events(...) --
	for _, event in ipairs { ... } do
		local cmds = vim.api.nvim_get_autocmds { event = event }
		for _, cmd in ipairs(cmds) do
			print(cmd.group_name, cmd.desc)
			vim.api.nvim_clear_autocmds { event = event, group = cmd.group }
		end
	end
end

function M.close_hidden_buffers()
	local buffers = vim.fn.getbufinfo { bufloaded = 1, buflisted = 1 }

	for _, buffer in ipairs(buffers) do
		if buffer.hidden == 1 then vim.cmd.bdelete(buffer.name) end
	end
end

local function is_scratch_buffer(bufnr)
	local is_loaded = vim.api.nvim_buf_is_loaded(bufnr)
	local name = vim.api.nvim_buf_get_name(bufnr)
	local hidden = vim.bo[bufnr].bufhidden
	local type = vim.bo[bufnr].buftype
	-- P(bufnr, type, hidden, is_loaded, name)
	if hidden == 'hide' and type == 'nofile' and name == '' then --
		return true
	end
end

function M.delete_all_scratch_buffers()
	local bufs = vim.api.nvim_list_bufs()
	-- print(' ')
	for _, bufnr in ipairs(bufs) do
		if is_scratch_buffer(bufnr) then --
			nvim.schedule(vim.api.nvim_buf_delete, bufnr, {})
		end
	end
end

function M.delete_all_unloaded_buffers()
	local bufs = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(bufs) do
		local is_loaded = vim.api.nvim_buf_is_loaded(bufnr)
		if not is_loaded then nvim.schedule(vim.api.nvim_buf_delete, bufnr, {}) end
	end
end

function M.close_all_floating_windows()
	local wins = vim.api.nvim_list_wins()
	for _, winid in ipairs(wins) do
		local config = vim.api.nvim_win_get_config(winid)
		if config.relative ~= '' then
			print(winid)
			vim.api.nvim_win_close(winid, false)
		end
	end
end

return M
