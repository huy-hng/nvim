local M = {
	'goolord/alpha-nvim',
	lazy = false,
}

function M.config()

	local utils = require('plugins.ui.alpha.utils')
	if not utils.should_show() and not vim.g.has_neovide then return end

	utils.change_native_keymap_fn()

	local alpha = require('alpha')
	Nmap('<leader>S', { alpha.start, false }, 'Open Start Screen')

	local layout = require('plugins.ui.alpha.layout')
	alpha.setup(layout)
end

return M
