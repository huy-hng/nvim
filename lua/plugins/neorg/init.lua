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

local requirer = require
requirer('plugins.neorg.keymaps')

function M.config()
	requirer('neorg').setup {
		load = {
			['core.defaults'] = {},
			['core.journal'] = requirer('plugins.neorg.modules.journal'),
			-- ['core.concealer'] = { config = { performance = { timeout = 200 } } },
			['core.concealer'] = {},
			['core.summary'] = { config = { strategy = 'default' }, },
			['core.esupports.indent'] = requirer('plugins.neorg.modules.indent'),
			-- ['core.norg.concealer'] = { config = requirer('plugins.neorg.modules.concealer') },
			-- ['core.norg.esupports.indent'] = { config = requirer('plugins.neorg.modules.indent') },
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
