local M = {
	'ThePrimeagen/harpoon',
	event = 'VeryLazy',
}

function M.config()
	require('harpoon').setup {
		save_on_toggle = false,

		-- saves the harpoon file upon every change. disabling is unrecommended.
		save_on_change = true,

		-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
		enter_on_sendcmd = false,

		-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
		tmux_autoclose_windows = false,

		-- filetypes that you want to prevent from adding to the harpoon list menu.
		excluded_filetypes = { 'harpoon' },

		-- set marks specific to each git branch inside git repository
		mark_branch = false,

		menu = {
			-- width = vim.api.nvim_win_get_width(0) - 4,
			width = 100,
		},
		projects = {
			-- Yes $HOME works
			['$HOME/personal/vim-with-me/server'] = {
				term = {
					cmds = {
						'./env && npx ts-node src/index.ts',
					},
				},
			},
		},
	}

	local harpoon_ui = require('harpoon.ui')
	local harpoon_mark = require('harpoon.mark')
	local harpoon_term = require('harpoon.term')

	-- local harpoonmap = Map.create('n', Keys.leader.harpoon, '[Harpoon]')
	local map = Map.new(Keys.leader.harpoon, '','[Harpoon]')
	map.n('h', harpoon_ui.toggle_quick_menu, 'Open Harpoon')
	map.n('a', harpoon_mark.add_file, 'Add file')
	map.n('c', require('harpoon.cmd-ui').toggle_quick_menu, 'Commands')
	map.n('t', { harpoon_term.gotoTerminal, 1 }, 'Open Terminal')

	map.n('u', { harpoon_ui.nav_file, 1 }, 'Go to File 1')
	map.n('y', { harpoon_ui.nav_file, 2 }, 'Go to File 2')
	map.n('j', { harpoon_ui.nav_file, 3 }, 'Go to File 3')
	map.n('e', { harpoon_ui.nav_file, 4 }, 'Go to File 4')
	map.n('i', { harpoon_ui.nav_file, 5 }, 'Go to File 5')
	map.n('o', { harpoon_ui.nav_file, 6 }, 'Go to File 6')

end

return M
