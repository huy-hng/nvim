local M = {
	'goolord/alpha-nvim',
	lazy = false,
}

function M.config()
	Augroup('Alpha', {
		Autocmd('User', 'AlphaReady', function(data)
			nvim.schedule(function()
				vim.wo.statuscolumn = ''
			end)

			NestedAutocmd(data, 'BufUnload', nil, function() --
				print('unloaded')
				require('core.statuscolumn').custom_statuscolumn()
				end, { buffer = 0 })

		end),
	})

	local utils = require('plugins.ui.alpha.utils')
	if not utils.should_show() and not vim.g.has_neovide then return end

	utils.change_native_keymap_fn()

	local alpha = require('alpha')
	Nmap('<leader>S', { alpha.start, false }, 'Open Start Screen')

	local layout = require('plugins.ui.alpha.layout')
	alpha.setup(layout)
end

return M
