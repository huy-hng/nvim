local M = {
	'glacambre/firenvim',
	-- cond = not not vim.g.started_by_firenvim,
	lazy = false,
	build = function()
		require('lazy').load { plugins = 'firenvim', wait = true }
		vim.fn['firenvim#install'](0)
	end,
}

function M.config()
	if not vim.g.started_by_firenvim then return end

	vim.g.firenvim_config = {
		globalSettings = { alt = 'all' },
		localSettings = {
			['.*'] = {
				cmdline = 'firenvim',
				content = 'text',
				priority = 0,
				selector = 'textarea',
				takeover = 'never',
			},
		},
	}

	vim.o.laststatus = 0
	vim.o.showtabline = 0
	require('core.statuscolumn.statuscolumn').remove_statuscolumn()

	nvim.feedkeys('a')

	vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
		nested = true,
		command = 'silent write',
	})

	-- vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
	-- 	callback = function(e)
	-- 		if vim.g.timer_started == true then return end
	-- 		vim.g.timer_started = true
	-- 		vim.fn.timer_start(10000, function()
	-- 			vim.g.timer_started = false
	-- 			vim.cmd.write()
	-- 		end)
	-- 	end,
	-- })

	Augroup('Firenvim', {
		Autocmd('User', 'VeryLazy', function()
			Map.n('<esc>', function()
				nvim.save()
				vim.cmd.quit()
			end)
			return true
		end),
	})
end

return M
