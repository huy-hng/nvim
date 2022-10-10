local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then return end

local options = {
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	disable_netrw = false,
	hijack_cursor = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,
	focus_empty_on_setup = false,
	ignore_buf_on_tab_change = {},
	sort_by = "name",
	root_dirs = {},
	prefer_startup_root = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	respect_buf_cwd = false,
	on_attach = "disable",
	remove_keymaps = false,
	select_prompts = false,
	view = {
		adaptive_size = false,
		centralize_selection = false,
		width = 20,
		hide_root_folder = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
		mappings = {
			custom_only = true,
		},
		float = {
			enable = true,
			open_win_config = {
				relative = "win", -- editor | win | cursor
				border = "rounded", -- none | single | double | rounded | solid | shadow
				-- border = { "A", "B", "C", "D" },
				-- border = { "A", "B", "C", "D", "E", "F", "G", "H" },
				-- border = { " ", " ", " ", " ", "", "", "", "" },

				width = 30,
				height = vim.api.nvim_win_get_height(0) - 1,

				row = 0,
				col = 1,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = true,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = "yes",
		root_folder_modifier = ":~",
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					staged = "S",
					unstaged = "",
					untracked = "U",

					-- unstaged = "✗",
					-- staged = "✓",
					-- untracked = "★",

					unmerged = "",
					renamed = "➜",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = {
		enable = false,
		update_root = false,
		ignore_list = {},
		update_cwd = false,
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = "",
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			-- hint = "",
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	filesystem_watchers = {
		enable = true,
		debounce_delay = 50,
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = true,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = "cursor",
				border = "shadow",
				style = "minimal",
			},
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = true,
				chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
				exclude = {
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = "gio trash",
		require_confirm = true,
	},
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
}
options.view.mappings.list = {
--==============================================================================
--                          |=> custom mappings <=|
--==============================================================================

	{ key = { "l", "<CR>" }, action = "edit_no_picker" },
	-- { key = { "l", "<CR>" }, action = "edit" },
	{ key = { "<esc>", "<C-e>" }, action = "close" },
	{ key = "h", action = "close_node" },
	-- { key = "v", action = "vsplit" },
	{ key = "?", action = "toggle_help" },


--==============================================================================
--                          |=> default mappings <=|
--==============================================================================

	----------------------------------------
	--            -> editor <-
	----------------------------------------
	-- { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- { key = "<C-e>", action = "edit_in_place" },
	{ key = "O", action = "edit_no_picker" },
	-- { key = { "<C-]>", "<2-RightMouse>" }, action = "cd" },
	{ key = "<C-v>", action = "vsplit" },
	{ key = "<C-x>", action = "split" },
	{ key = "<C-t>", action = "tabnew" },

	----------------------------------------
	--           -> movement <-
	----------------------------------------
	-- { key = "[e", action = "prev_diag_item" },
	-- { key = "]e", action = "next_diag_item" },
	{ key = "[c", action = "prev_git_item" },
	{ key = "]c", action = "next_git_item" },

	-- { key = "-", action = "dir_up" },
	-- { key = "<", action = "prev_sibling" },
	-- { key = ">", action = "next_sibling" },
	-- { key = "P", action = "parent_node" },
	-- { key = "<BS>", action = "close_node" },
	-- { key = "<Tab>", action = "preview" },

	{ key = "K", action = "first_sibling" },
	{ key = "J", action = "last_sibling" },

	----------------------------------------
	--      -> file manipulation <-
	----------------------------------------
	{ key = "a", action = "create" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "d", action = "remove" },
	{ key = "D", action = "trash" },
	{ key = "<C-r>", action = "full_rename" },

	----------------------------------------
	--          -> file info <-
	----------------------------------------
	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },


	----------------------------------------
	--       -> nvimtree actions <-
	----------------------------------------
	{ key = "q", action = "close" },
	{ key = "R", action = "refresh" },

	----------------------------------------
	--             -> view <-
	----------------------------------------
	{ key = "W", action = "collapse_all" },
	{ key = "E", action = "expand_all" },

	{ key = "I", action = "toggle_git_ignored" },
	{ key = "H", action = "toggle_dotfiles" },
	{ key = "U", action = "toggle_custom" },

	----------------------------------------
	--           -> unsorted <-
	----------------------------------------
	{ key = "f", action = "live_filter" },
	{ key = "F", action = "clear_live_filter" },
	{ key = "S", action = "search_node" },

	{ key = "s", action = "system_open" },
	{ key = ".", action = "run_file_command" },

	{ key = "<C-k>", action = "toggle_file_info" },
	-- { key = "g?", action = "toggle_help" },
	{ key = "m", action = "toggle_mark" },
	{ key = "bmv", action = "bulk_move" },
}
nvim_tree.setup(options)
