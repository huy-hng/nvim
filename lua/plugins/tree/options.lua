return {
	prefer_startup_root = true, -- Prefer startup root directory when updating root directory of the tree.
	sync_root_with_cwd = true, -- Changes the tree root directory on `DirChanged` and refreshes the tree.
	reload_on_bufenter = true, -- Automatically reloads the tree on `BufEnter` nvim-tree.
	respect_buf_cwd = false, -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
	on_attach = 'disable',
	select_prompts = false,
	view = {
		adaptive_size = true,
		centralize_selection = false,
		width = 30,
		hide_root_folder = false,
		side = 'left',
		preserve_window_proportions = true,
		number = false,
		relativenumber = false,
		signcolumn = 'yes',
		mappings = {
			custom_only = true,
		},
		float = {
			enable = true,
			open_win_config = {
				relative = 'win', -- editor | win | cursor
				border = 'rounded', -- none | single | double | rounded | solid | shadow
				row = -1,
				col = 1,
				-- anchor = 'NE',
				-- col = vim.api.nvim_win_get_width(0) - 35,

				width = 30,
				height = vim.api.nvim_win_get_height(0) - 2,
			},
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = 'name',
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = '└',
				edge = '│',
				item = '│',
				bottom = '─',
				none = ' ',
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = 'after',
			padding = ' ',
			symlink_arrow = ' ➛ ',
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = '',
				symlink = '',
				bookmark = '',
				folder = {
					arrow_closed = '',
					arrow_open = '',
					default = '',
					open = '',
					empty = '',
					empty_open = '',
					symlink = '',
					symlink_open = '',
				},
				git = {
					staged = 'S',
					unstaged = '',
					untracked = 'U',

					-- unstaged = "✗",
					-- staged = "✓",
					-- untracked = "★",

					unmerged = '',
					renamed = '➜',
					deleted = '',
					ignored = '◌',
				},
			},
		},
		special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
		symlink_destination = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	update_focused_file = { -- uncollapses folders until it finds the file
		enable = false,
		update_root = false,
		debounce_delay = 15,
		-- ignore_list = { 'help' },
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = '',
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
		show_on_open_dirs = false,
		debounce_delay = 10,
		severity = {
			min = vim.diagnostic.severity.WARN,
			max = vim.diagnostic.severity.ERROR,
		},
		icons = {
			hint = '',
			info = '',
			warning = '',
			error = '',
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
		ignore = false,
		show_on_dirs = true,
		show_on_open_dirs = false,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		file_popup = {
			open_win_config = {
				col = 1,
				row = 1,
				relative = 'cursor',
				border = 'rounded',
				style = 'minimal',
			},
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
			window_picker = {
				enable = true,
				-- chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
				chars = 'asdfjkl;',
				exclude = {
					filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
					buftype = { 'nofile', 'terminal', 'help' },
				},
			},
		},
		remove_file = {
			close_window = false,
		},
	},
	trash = {
		cmd = 'gio trash',
		require_confirm = true,
	},
	live_filter = {
		prefix = '[FILTER]: ',
		always_show_folders = false,
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
