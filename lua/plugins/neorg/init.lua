local M = {
	'nvim-neorg/neorg',
	ft = 'norg',
	cmd = 'Neorg',
	dependencies = {
		'nvim-neorg/neorg-telescope',
		'nvim-lua/plenary.nvim',
	},
}

local file = vim.fn.expand('%')
Augroup('AutoreloadNoice', {
	Autocmd('BufWritePost', file, function() --
		vim.notify('autoreload')
		M.config()
	end),
}, true, true)

local requirer = R

function M.config()
	Nmap('<leader>n', vim.cmd.Neorg)

	requirer('neorg').setup {
		load = {
			['core.defaults'] = {},
			['core.norg.concealer'] = { config = requirer('plugins.neorg.modules.concealer') },
			['core.norg.esupports.indent'] = { config = requirer('plugins.neorg.modules.indent') },
			['core.norg.completion'] = { config = { engine = 'nvim-cmp' } },
			['core.norg.dirman'] = {
				config = {
					default_workspace = 'home',
					workspaces = {
						home = '~/.dotfiles/personal/personal/neorg',
						nvim = '~/.dotfiles/vim/.config/nvim',
						example_gtd = '~/repositories/example_workspaces',
					},
					open_last_workspace = true, -- bool or 'default' for default_workspace
				},
			},

			['core.integrations.telescope'] = {},

			-- gtd
			['core.gtd.base'] = { config = {
				workspace = 'example_gtd',
			} },
			['core.gtd.ui'] = { config = {} },
		},
	}
end
-- M.config()

return M
