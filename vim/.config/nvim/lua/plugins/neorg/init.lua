local requirer = R
-- AutoReloadFolder(true)


local has_neorg, neorg = pcall(requirer, 'neorg')
if not has_neorg then return end

-- local concealer = require('neorg.modules.core.norg.concealer')
-- concealer.clear_conceal()

Nmap('<leader>n', vim.cmd.Neorg)

neorg.setup {
	load = {
		['core.defaults'] = {},
		['core.norg.concealer'] = {
			config = requirer('plugins.neorg.modules.concealer'),
		},
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
		['core.norg.esupports.indent'] = {
			config = requirer('plugins.neorg.modules.indent'),
		},
	},
}
