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

	local harpoonmap = Map.create('n', '<leader>a', '[Harpoon]')
	harpoonmap('h', harpoon_ui.toggle_quick_menu, 'Open Harpoon')
	harpoonmap('a', harpoon_mark.add_file, 'Add file')
	harpoonmap('c', require('harpoon.cmd-ui').toggle_quick_menu, '')

	harpoonmap = Map.create('n', '', '[Harpoon]')
	for i in ipairs(vim.fn.range(1, 9)) do
		local keymap = string.format('<A-%s>', i)
		harpoonmap(keymap, { harpoon_ui.nav_file, i }, 'Go to File')
	end
	harpoonmap('<A-0>', { harpoon_term.gotoTerminal, 1 }, 'Open Terminal')
end

return M
