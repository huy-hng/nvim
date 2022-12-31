local M = {
	'nvim-neorg/neorg',
	ft = 'norg',
	cmd = 'Neorg',
	dependencies = {
		'nvim-neorg/neorg-telescope',
		'nvim-lua/plenary.nvim',
	},
}

function M.config()
	Nmap('<leader>n', vim.cmd.Neorg)

	require('neorg').setup {
		load = {
			-- ['core.defaults'] = {},
			['core.norg.concealer'] = { config = require('plugins.neorg.modules.concealer') },
			['core.integrations.telescope'] = {}, -- Enable the telescope module
			['core.norg.esupports.indent'] = { config = require('plugins.neorg.modules.indent') },
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
		},
	}
end

return M
