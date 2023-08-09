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

function M.config()
	if vim.g.started_by_firenvim == true then return end

	local config = get_config()
	-- config = test_spinners(config)

	require('noice').setup(config)
	vim.cmd('highlight NoiceMini blend=75')

	Map.n(Keys.message_history, function()
		if not vim.g.has_neovide or Util.is_cmdwin() then
			vim.cmd.messages()
			return
		end
		enable_messages(true)
		nvim.schedule(function()
			vim.cmd.messages()
			nvim.defer(100, nvim.feedkeys, 'G')
			enable_messages(false)
		end)
	end)
end

return M
