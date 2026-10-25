local M = {
	'nvim-neorg/neorg',
	ft = 'norg',
	cmd = 'Neorg',
	-- event = 'VeryLazy',
	dependencies = {
		'nvim-neorg/neorg-telescope',
		'nvim-lua/plenary.nvim',
		'MunifTanjim/nui.nvim',
	},
}

require('plugins.editor.neorg.keymaps')

function M.config()
	require('neorg').setup {
		load = {
			['core.defaults'] = {},
			['core.journal'] = require('plugins.editor.neorg.modules.journal'),
			-- ['core.concealer'] = { config = { performance = { timeout = 200 } } },
			['core.concealer'] = {},
			['core.summary'] = { config = { strategy = 'default' }, },
			['core.esupports.indent'] = require('plugins.editor.neorg.modules.indent'),
			-- ['core.norg.concealer'] = { config = require('plugins.editor.neorg.modules.concealer') },
			-- ['core.norg.esupports.indent'] = { config = require('plugins.editor.neorg.modules.indent') },
			['core.completion'] = {
				config = {
					engine = 'nvim-cmp',
				},
			},
			['core.dirman'] = {
				config = {
					default_workspace = 'home',
					workspaces = {
						home = '~/.dotfiles/personal/personal/neorg',
						nvim = '~/.dotfiles/vim/.config/nvim',
					},
					open_last_workspace = true, -- bool or 'default' for default_workspace
				},
			},
			-- ['core.integrations.telescope'] = {},
		},
	}
end

return M
