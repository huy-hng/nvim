return function(bufnr)
	local functions = require('plugins.editor.nvim-tree.functions')
	local tree = require('nvim-tree.api').tree

	local api = require('nvim-tree.api')

	local function opts(desc)
		return {
			desc = 'nvim-tree: ' .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true,
		}
	end

	-- Default mappings not inserted as:
	--  remove_keymaps = true
	--  OR
	--  view.mappings.custom_only = true
	local map = Map.create('n', '', '[Nvim Tree]', { buffer = bufnr })

	-- Mappings migrated from view.mappings.list
	--
	-- You will need to insert 'your code goes here' for any mappings with a custom action_cb
	map('l', api.node.open.no_window_picker, 'Open: No Window Picker')
	map('<CR>', api.node.open.no_window_picker, 'Open: No Window Picker')
	map('<esc>', api.tree.close, 'Close')
	map('<C-e>', api.tree.close, 'Close')
	map('h', api.node.navigate.parent_close, 'Close Directory')
	map('?', api.tree.toggle_help, 'Help')
	map('<Tab>', api.node.open.preview, 'Open Preview')
	map('<C-v>', api.node.open.vertical, 'Open: Vertical Split')
	map('<C-x>', api.node.open.horizontal, 'Open: Horizontal Split')
	map('<C-t>', api.node.open.tab, 'Open: New Tab')
	map('[c', api.node.navigate.git.prev, 'Prev Git')
	map(']c', api.node.navigate.git.next, 'Next Git')
	map('K', api.node.navigate.sibling.first, 'First Sibling')
	map('J', api.node.navigate.sibling.last, 'Last Sibling')
	map('a', api.fs.create, 'Create')
	map('r', api.fs.rename, 'Rename')
	map('x', api.fs.cut, 'Cut')
	map('c', api.fs.copy.node, 'Copy')
	map('p', api.fs.paste, 'Paste')
	map('d', api.fs.remove, 'Delete')
	map('D', api.fs.trash, 'Trash')
	map('<C-r>', api.fs.rename_sub, 'Rename: Omit Filename')
	map('y', api.fs.copy.filename, 'Copy Name')
	map('Y', api.fs.copy.relative_path, 'Copy Relative Path')
	map('gy', api.fs.copy.absolute_path, 'Copy Absolute Path')
	map('q', api.tree.close, 'Close')
	map('R', api.tree.reload, 'Refresh')
	map('W', api.tree.collapse_all, 'Collapse')
	map('E', api.tree.expand_all, 'Expand All')
	map('I', api.tree.toggle_gitignore_filter, 'Toggle Git Ignore')
	map('H', api.tree.toggle_hidden_filter, 'Toggle Dotfiles')
	map('U', api.tree.toggle_custom_filter, 'Toggle Hidden')
	map('f', api.live_filter.start, 'Filter')
	map('F', api.live_filter.clear, 'Clean Filter')
	map('S', api.tree.search_node, 'Search')
	map('s', api.node.run.system, 'Run System')
	map('.', api.node.run.cmd, 'Run Command')
	map('<C-k>', api.node.show_info_popup, 'Info')
	map('m', api.marks.toggle, 'Toggle Bookmark')
	map('bmv', api.marks.bulk.move, 'Move Bookmarked')
end

-- return {
-- 	-----------------------------------------Custom Mappings----------------------------------------

-- 	{ key = { 'l', '<CR>' }, action = 'edit_no_picker' },
-- 	-- { key = { "l", "<CR>" }, action = "edit" },
-- 	{ key = { '<esc>', '<C-e>' }, action = 'close' },
-- 	{ key = 'h', action = 'close_node' },
-- 	-- { key = "v", action = "vsplit" },
-- 	{ key = '?', action = 'toggle_help' },
-- 	{ key = '<Tab>', action = 'preview', action_cb = functions.preview },

-- 	-----------------------------------------Default Mappings---------------------------------------

-- 	----------------------------------------
-- 	--            -> editor <-
-- 	----------------------------------------
-- 	-- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
-- 	-- { key = "<C-e>", action = "edit_in_place" },
-- 	-- { key = 'O', action = 'edit_no_picker' },
-- 	-- { key = { "<C-]>", "<2-RightMouse>" }, action = "cd" },
-- 	{ key = '<C-v>', action = 'vsplit' },
-- 	{ key = '<C-x>', action = 'split' },
-- 	{ key = '<C-t>', action = 'tabnew' },

-- 	----------------------------------------
-- 	--           -> movement <-
-- 	----------------------------------------
-- 	-- { key = "[e", action = "prev_diag_item" },
-- 	-- { key = "]e", action = "next_diag_item" },
-- 	{ key = '[c', action = 'prev_git_item' },
-- 	{ key = ']c', action = 'next_git_item' },

-- 	-- { key = "-", action = "dir_up" },
-- 	-- { key = "<", action = "prev_sibling" },
-- 	-- { key = ">", action = "next_sibling" },
-- 	-- { key = "P", action = "parent_node" },
-- 	-- { key = "<BS>", action = "close_node" },
-- 	-- { key = '<Tab>', action = 'preview' },

-- 	{ key = 'K', action = 'first_sibling' },
-- 	{ key = 'J', action = 'last_sibling' },

-- 	----------------------------------------
-- 	--      -> file manipulation <-
-- 	----------------------------------------
-- 	{ key = 'a', action = 'create' },
-- 	{ key = 'r', action = 'rename' },
-- 	{ key = 'x', action = 'cut' },
-- 	{ key = 'c', action = 'copy' },
-- 	{ key = 'p', action = 'paste' },
-- 	{ key = 'd', action = 'remove' },
-- 	{ key = 'D', action = 'trash' },
-- 	{ key = '<C-r>', action = 'full_rename' },

-- 	----------------------------------------
-- 	--          -> file info <-
-- 	----------------------------------------
-- 	{ key = 'y', action = 'copy_name' },
-- 	{ key = 'Y', action = 'copy_path' },
-- 	{ key = 'gy', action = 'copy_absolute_path' },

-- 	----------------------------------------
-- 	--       -> nvimtree actions <-
-- 	----------------------------------------
-- 	{ key = 'q', action = 'close' },
-- 	{ key = 'R', action = 'refresh' },

-- 	----------------------------------------
-- 	--             -> view <-
-- 	----------------------------------------
-- 	{ key = 'W', action = 'collapse_all' },
-- 	-- { key = 'W', action = 'collapse_all', action_cb = function() tree.collapse_all(true) end },
-- 	{ key = 'E', action = 'expand_all' },

-- 	{ key = 'I', action = 'toggle_git_ignored' },
-- 	{ key = 'H', action = 'toggle_dotfiles' },
-- 	{ key = 'U', action = 'toggle_custom' },

-- 	----------------------------------------
-- 	--           -> unsorted <-
-- 	----------------------------------------
-- 	{ key = 'f', action = 'live_filter' },
-- 	{ key = 'F', action = 'clear_live_filter' },
-- 	{ key = 'S', action = 'search_node' },

-- 	{ key = 's', action = 'system_open' },
-- 	{ key = '.', action = 'run_file_command' },

-- 	{ key = '<C-k>', action = 'toggle_file_info' },
-- 	-- { key = "g?", action = "toggle_help" },
-- 	{ key = 'm', action = 'toggle_mark' },
-- 	{ key = 'bmv', action = 'bulk_move' },
-- }
