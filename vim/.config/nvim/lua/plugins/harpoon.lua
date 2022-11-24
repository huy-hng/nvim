local status, harpoon = pcall(require, 'harpoon')
if not status then
	return
end

harpoon.setup {
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
		width = 60,
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

local prefix = '<leader>a'
nmap(prefix .. 'h', harpoon_ui.toggle_quick_menu, 'Open Harpoon')
nmap(prefix .. 'a', harpoon_mark.add_file, 'Add file')
nmap(prefix .. 'c', require('harpoon.cmd-ui').toggle_quick_menu, '')

nmap('<leader>1', FN(harpoon_ui.nav_file, 1))
nmap('<leader>2', FN(harpoon_ui.nav_file, 2))
nmap('<leader>3', FN(harpoon_ui.nav_file, 3))
nmap('<leader>4', FN(harpoon_ui.nav_file, 4))
nmap('<leader>5', FN(harpoon_ui.nav_file, 5))
nmap('<leader>6', FN(harpoon_ui.nav_file, 6))
nmap('<leader>7', FN(harpoon_ui.nav_file, 7))
nmap('<leader>8', FN(harpoon_ui.nav_file, 8))
nmap('<leader>9', FN(harpoon_ui.nav_file, 9))
nmap('<leader>0', FN(harpoon_term.gotoTerminal, 1))
