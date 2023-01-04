local M = {
	'nvim-neorg/neorg',
	ft = 'norg',
	-- cmd = 'Neorg',
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
			-- ['core.norg.concealer'] = { config = {} },
			['core.integrations.telescope'] = {},
			['core.norg.esupports.indent'] = { config = requirer('plugins.neorg.modules.indent') },
			['core.norg.completion'] = { config = { engine = 'nvim-cmp' } },
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
-- M.config()

return M
