local M = {
	'folke/noice.nvim',
	dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
	event = 'VeryLazy',
}

local function get_config() --
	return R('plugins.ui.noice.config')
end

local function enable_messages(enable)
	local config = get_config()
	config.messages.enabled = enable
	require('noice').setup(config)
end

local function test_spinners(config)
	config.format.spinner.name = 'bounce'
	local Progress = require('noice.lsp.progress')
	Map.n('<localleader>e', function()
		local msg = { token = 1, value = { kind = 'end' } }
		Progress.progress(_, msg, { client_id = 1 })
	end)

	local msg = {
		token = 1,
		value = {
			kind = 'report',
			-- message = i .. ' / 100',
			message = '1',
			percentage = 100,
		},
	}
	Progress.progress(_, msg, { client_id = 1 })
	return config
end

-- Augroup('Statuscolumn', {
-- 	Autocmd({ 'WinEnter', 'WinNew', 'TabEnter', 'VimEnter' }, function(data)
-- 		local winid = vim.api.nvim_get_current_win()
-- 		local wintype = Util.win_type(winid)
-- 		local buftype = vim.bo.buftype
-- 		local filetype = vim.bo.filetype

-- 		P(data)
-- 		print(winid, wintype, buftype, filetype)
-- 	end),
-- })
local winman = R('modules.window_manager')

---@param min_lines number? min count of lines to get
---@param float boolean? TODO: should get float window
local function get_noice_win(min_lines, float)
	min_lines = min_lines or 2

	for _, win in ipairs(winman.list_wins()) do
		local bufnr = winman.get_win_buf(win)
		local filetype = vim.bo[bufnr].filetype
		local line_count = vim.api.nvim_buf_line_count(bufnr)

		local config = winman.get_win_config(win)
		local is_split = config.relative == ''

		-- if (not float or is_split) and filetype == 'noice' and line_count >= min_lines then
		if is_split and filetype == 'noice' and line_count >= min_lines then
			return { id = win, bufnr = bufnr, line_count = line_count }
		end
	end
end

local function scroll_to_bottom(win)
	win = win or get_noice_win()
	if not win then return end
	pcall(winman.set_win_cursor, win.id, { win.line_count, 0 })
end

local function toggle_noice_window(cmd)
	local win = get_noice_win(20)
	if win then
		winman.close_win_keep_layout(win.id, false)
		return
	end

	cmd()
	scroll_to_bottom()
end

-- Map.n("<C-'>", { toggle_noice_window, vim.cmd.NoiceOutput })
Map.n("<C-'>", function()
	vim.cmd.NoiceOutput()
	nvim.defer(100, scroll_to_bottom)
end)

function M.config()
	if vim.g.started_by_firenvim == true then return end

	local config = get_config()
	-- config = test_spinners(config)

	require('noice').setup(config)
	if vim.g.has_neovide == true then --
		vim.cmd('highlight NoiceMini blend=75')
	end

	Map.c('<A-Enter>', function()
		-- if vim.g.has_neovide then enable_messages(true) end
		vim.notify('redirect')
		vim.schedule(function()
			require('noice').redirect(vim.fn.getcmdline())
			-- if vim.g.has_neovide then enable_messages(false) end
		end)
	end, 'Redirect Cmdline')

	Map.n(Keys.message_history, function()
		if not vim.g.has_neovide or Util.is_cmdwin() then
			vim.cmd.messages()
			return
		end
		-- enable_messages(true)
		nvim.schedule(function()
			vim.cmd.messages()
			-- vim.cmd.Noice('messages')
			-- nvim.defer(100, nvim.feedkeys, 'G')
			-- enable_messages(false)
		end)
	end)
end

return M
