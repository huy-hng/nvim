require("harpoon").setup({
	save_on_toggle = false,

	-- saves the harpoon file upon every change. disabling is unrecommended.
	save_on_change = true,

	-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
	enter_on_sendcmd = false,

	-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
	tmux_autoclose_windows = false,

	-- filetypes that you want to prevent from adding to the harpoon list menu.
	excluded_filetypes = { "harpoon" },

	-- set marks specific to each git branch inside git repository
	mark_branch = false,

	menu = {
			-- width = vim.api.nvim_win_get_width(0) - 4,
		width = 60
	},
	projects = {
		-- Yes $HOME works
		["$HOME/personal/vim-with-me/server"] = {
			term = {
				cmds = {
					"./env && npx ts-node src/index.ts"
				}
			}
		}
	}
})