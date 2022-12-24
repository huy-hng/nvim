function DeleteAllAutocmdsWithEvents(...) --
	for _, event in ipairs { ... } do
		local cmds = vim.api.nvim_get_autocmds { event = event }
		for _, cmd in ipairs(cmds) do
			print(cmd.group_name, cmp.desc)
			vim.api.nvim_clear_autocmds { event = event, group = cmd.group }
		end
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

function DeleteAllScratchBuffers()
	local bufs = vim.api.nvim_list_bufs()
	-- print(' ')
	for _, bufnr in ipairs(bufs) do
		if is_scratch_buffer(bufnr) then --
			Schedule(vim.api.nvim_buf_delete, bufnr, {})
		end
	end
end

function DeleteAllUnloadedBuffers()
	local bufs = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(bufs) do
		local is_loaded = vim.api.nvim_buf_is_loaded(bufnr)
		if not is_loaded then Schedule(vim.api.nvim_buf_delete, bufnr, {}) end
	end
end

function CloseAllFloatingWindows()
	local wins = vim.api.nvim_list_wins()
	for _, winid in ipairs(wins) do
		local config = vim.api.nvim_win_get_config(winid)
		if config.relative ~= '' then
			print(winid)
			vim.api.nvim_win_close(winid, false)
		end
	end
end

local has_notify, notify = pcall(require, 'notify')
if has_notify then Nmap('\\1', notify.dismiss, 'Dismiss all notifications') end
Nmap('\\2', CloseAllFloatingWindows, 'Close all floating windows')
Nmap('\\3', DeleteAllScratchBuffers, 'Delete all scratch buffers')
-- Nmap('\\4', DeleteAllUnloadedBuffers, 'Delete all unloaded buffers')
