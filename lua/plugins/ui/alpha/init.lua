local M = {
	'goolord/alpha-nvim',
	lazy = false,
}

Augroup('Alpha', {
	Autocmd('User', 'AlphaReady', function(data)
		vim.o.showtabline = 0
		NestedAutocmd(data, 'BufUnload', nil, function()
			vim.o.showtabline = 2
			-- require('core.statuscolumn').custom_statuscolumn()
		end, { buffer = 0 })
	end),
})

local function open_alpha_in_tab()
	local alpha = require('alpha')
	vim.cmd.tabnew()
	alpha.start(false)

	Augroup('AlphaTab', {
		Autocmd('BufLeave', nil, function()
			nvim.schedule(pcall, vim.cmd.tabclose)
			return true
		end, { buffer = 0 }),
	})
end

function M.config()
	local utils = require('plugins.ui.alpha.utils')
	if not utils.should_show() and not vim.g.has_neovide then return end

	utils.change_native_keymap_fn()

	local alpha = require('alpha')
	Map.n('<leader>S', open_alpha_in_tab, 'Open Start Screen')

	local layout = require('plugins.ui.alpha.layout')
	alpha.setup(layout)
end

return M
