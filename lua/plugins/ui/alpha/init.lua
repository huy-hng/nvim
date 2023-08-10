local M = {
	'goolord/alpha-nvim',
	lazy = false,
}

local winman = require('modules.window_manager')
Augroup('Alpha', {
	Autocmd('User', 'AlphaReady', function(data)
		winman.hide_ui()
		vim.o.showtabline = 0
		vim.wo.statuscolumn = ''
		-- vim.wo.cursorline = true
		-- vim.wo.cursorlineopt = 'both'
		-- TODO: hide cursor and use cursorline instead
		-- utils.hide_cursor()
		NestedAutocmd(data, 'BufUnload', nil, function()
			winman.show_ui()
			vim.o.showtabline = 2
			-- utils.show_cursor()
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
	Map.n(Keys.start_screen, open_alpha_in_tab, 'Open Start Screen')

	local layout = require('plugins.ui.alpha.layout')
	alpha.setup(layout)
end

return M
