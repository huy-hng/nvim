local functions = require('plugins.tree.functions')
-- local api = require('nvim-tree.api')

-- nmap('<leader>mn', api.marks.navigate.next)
-- nmap('<leader>mp', api.marks.navigate.prev)
-- nmap('<leader>ms', api.marks.navigate.select)

return {
	--==============================================================================
	--                          |=> custom mappings <=|
	--==============================================================================

	{ key = { 'l', '<CR>' }, action = 'edit_no_picker' },
	-- { key = { "l", "<CR>" }, action = "edit" },
	{ key = { '<esc>', '<C-e>' }, action = 'close' },
	{ key = 'h', action = 'close_node' },
	-- { key = "v", action = "vsplit" },
	{ key = '?', action = 'toggle_help' },
	{ key = '<Tab>', action = 'preview', action_cb = functions.preview },

	--==============================================================================
	--                          |=> default mappings <=|
	--==============================================================================

	----------------------------------------
	--            -> editor <-
	----------------------------------------
	-- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- { key = "<C-e>", action = "edit_in_place" },
	-- { key = 'O', action = 'edit_no_picker' },
	-- { key = { "<C-]>", "<2-RightMouse>" }, action = "cd" },
	{ key = '<C-v>', action = 'vsplit' },
	{ key = '<C-x>', action = 'split' },
	{ key = '<C-t>', action = 'tabnew' },

	----------------------------------------
	--           -> movement <-
	----------------------------------------
	-- { key = "[e", action = "prev_diag_item" },
	-- { key = "]e", action = "next_diag_item" },
	{ key = '[c', action = 'prev_git_item' },
	{ key = ']c', action = 'next_git_item' },

	-- { key = "-", action = "dir_up" },
	-- { key = "<", action = "prev_sibling" },
	-- { key = ">", action = "next_sibling" },
	-- { key = "P", action = "parent_node" },
	-- { key = "<BS>", action = "close_node" },
	-- { key = '<Tab>', action = 'preview' },

	{ key = 'K', action = 'first_sibling' },
	{ key = 'J', action = 'last_sibling' },

	----------------------------------------
	--      -> file manipulation <-
	----------------------------------------
	{ key = 'a', action = 'create' },
	{ key = 'r', action = 'rename' },
	{ key = 'x', action = 'cut' },
	{ key = 'c', action = 'copy' },
	{ key = 'p', action = 'paste' },
	{ key = 'd', action = 'remove' },
	{ key = 'D', action = 'trash' },
	{ key = '<C-r>', action = 'full_rename' },

	----------------------------------------
	--          -> file info <-
	----------------------------------------
	{ key = 'y', action = 'copy_name' },
	{ key = 'Y', action = 'copy_path' },
	{ key = 'gy', action = 'copy_absolute_path' },

	----------------------------------------
	--       -> nvimtree actions <-
	----------------------------------------
	{ key = 'q', action = 'close' },
	{ key = 'R', action = 'refresh' },

	----------------------------------------
	--             -> view <-
	----------------------------------------
	{ key = 'W', action = 'collapse_all' },
	{ key = 'E', action = 'expand_all' },

	{ key = 'I', action = 'toggle_git_ignored' },
	{ key = 'H', action = 'toggle_dotfiles' },
	{ key = 'U', action = 'toggle_custom' },

	----------------------------------------
	--           -> unsorted <-
	----------------------------------------
	{ key = 'f', action = 'live_filter' },
	{ key = 'F', action = 'clear_live_filter' },
	{ key = 'S', action = 'search_node' },

	{ key = 's', action = 'system_open' },
	{ key = '.', action = 'run_file_command' },

	{ key = '<C-k>', action = 'toggle_file_info' },
	-- { key = "g?", action = "toggle_help" },
	{ key = 'm', action = 'toggle_mark' },
	{ key = 'bmv', action = 'bulk_move' },
}
