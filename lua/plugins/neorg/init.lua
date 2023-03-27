local M = {
	'nvim-neorg/neorg',
	ft = 'norg',
	cmd = 'Neorg',
	-- event = 'VeryLazy',
	dependencies = {
		'nvim-neorg/neorg-telescope',
		'nvim-lua/plenary.nvim',
	},
}

local requirer = R

requirer('plugins.neorg.keymaps')
function M.config()

	requirer('neorg').setup {
		load = {
			['core.defaults'] = {},
			['core.norg.journal'] = requirer('plugins.neorg.modules.journal'),
			['core.norg.concealer'] = {},
			['core.norg.esupports.indent'] = {},
			-- ['core.norg.concealer'] = { config = requirer('plugins.neorg.modules.concealer') },
			-- ['core.norg.esupports.indent'] = { config = requirer('plugins.neorg.modules.indent') },
			['core.norg.completion'] = {
				config = {
					engine = 'nvim-cmp',
				},
			},
			['core.norg.dirman'] = {
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
