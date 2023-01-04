local M = {
	'phaazon/mind.nvim',
	branch = 'v2.2',
	dependencies = { 'nvim-lua/plenary.nvim' },
}

local file = vim.fn.expand('%')
Augroup('AutoreloadNoice', {
	Autocmd('BufWritePost', file, function() --
		vim.notify('autoreload')
		M.config()
	end),
}, true, true)

function M.config()
	local cmds = require('mind.commands')
	local data = require('mind.data')
	local indexing = require('mind.indexing')
	local keymap = require('mind.keymap')
	local node = require('mind.node')
	local ui = require('mind.ui')

	require('mind').setup {
		-- persistence, both for the tree state and data files
		persistence = {
			-- path where the global mind tree is stored
			state_path = '~/.local/share/mind.nvim/mind.json',

			-- directory where to create global data files
			data_dir = '~/.local/share/mind.nvim/data',
		},
		-- edit options
		edit = {
			-- file extension to use when creating a data file
			data_extension = '.md',

			-- default header to put in newly created data files
			data_header = '# %s',

			-- format string for copied links
			copy_link_format = '[](%s)',
		},
		-- tree options
		tree = {
			-- automatically create nodes (when looking for paths for example)
			automatic_creation = true,

			-- automatically create data file when trying to open one that doesn’t
			-- have any data yet
			automatic_data_creation = false,
		},
		-- UI options
		ui = {
			-- commands used to open URLs
			url_open = 'xdg-open', -- 'open' Darwin | 'start ""' Windows

			-- default width of the tree view window
			width = 30,

			-- marker used for empty indentation
			empty_indent_marker = '│',

			-- marker used for node indentation
			node_indent_marker = '└',

			-- marker used to identify the root of the tree (left to its name)
			root_marker = ' ',

			-- marker used to identify a local root (right to its name)
			local_marker = 'local',

			-- marker used to show that a node has an associated data file
			data_marker = '',

			-- marker used to show that a node has an URL
			url_marker = ' ',

			-- marker used to show that a node is currently selected
			select_marker = '',

			-- highlight options
			highlight = {
				-- highlight used on closed marks
				closed_marker = 'LineNr',

				-- highlight used on open marks
				open_marker = 'LineNr',

				-- highlight used on the name of the root node
				node_root = 'Function',

				-- highlight used on regular nodes with no children
				node_leaf = 'String',

				-- highlight used on regular nodes with children
				node_parent = 'Title',

				-- highlight used on the local marker
				local_marker = 'Comment',

				-- highlight used on the data marker
				data_marker = 'Comment',

				-- highlight used on the url marker
				url_marker = 'Comment',

				-- highlight used on empty nodes (i.e. no children and no data)
				modifier_empty = 'Comment',

				-- highlight used on the selection marker
				select_marker = 'Error',
			},

			-- preset of icons
			icon_preset = {
				{ ' ', 'Sub-project' },
				{ ' ', 'Journal, newspaper, weekly and daily news' },
				{ ' ', 'For when you have an idea' },
				{ ' ', 'Note taking?' },
				{ '陼', 'Task management' },
				{ ' ', 'Uncheck, empty square or backlog' },
				{ ' ', 'Full square or on-going' },
				{ ' ', 'Check or done' },
				{ ' ', 'Trash bin, deleted, cancelled, etc.' },
				{ ' ', 'GitHub' },
				{ ' ', 'Monitoring' },
				{ ' ', 'Internet, Earth, everyone!' },
				{ ' ', 'Frozen, on-hold' },
			},
		},
		-- default keymaps; see 'mind.commands' for a list of commands that can be mapped to keys here
		keymaps = {
			-- keybindings when navigating the tree normally
			normal = {
				['<cr>'] = 'open_data',
				['<s-cr>'] = 'open_data_index',
				l = 'toggle_node',
				h = function(args)
					local tree = args.get_tree()

					local line = vim.api.nvim_win_get_cursor(0)[1] - 1
					local current_node = node.get_node_by_line(tree, line)

					if not current_node.is_expanded then
						current_node, _ = node.get_node_and_parent_by_line(tree, line)
					end

					if current_node ~= nil then
						cmds.toggle_node(tree, current_node, args.save_tree, args.opts)
					end
				end,

				-- h = 'toggle_parent',
				['/'] = 'select_path',
				['$'] = 'change_icon_menu',
				c = 'add_inside_end_index',
				I = 'add_inside_start',
				i = 'add_inside_end',
				y = 'copy_node_link',
				Y = 'copy_node_link_index',
				d = 'delete',
				D = 'delete_file',
				O = 'add_above',
				o = 'add_below',
				q = 'quit',
				r = 'rename',
				R = 'change_icon',
				u = 'make_url',
				x = 'select',
			},

			-- keybindings when a node is selected
			selection = {
				['<cr>'] = 'open_data',
				['<tab>'] = 'toggle_node',
				['<s-tab>'] = 'toggle_parent',
				['/'] = 'select_path',
				I = 'move_inside_start',
				i = 'move_inside_end',
				O = 'move_above',
				o = 'move_below',
				q = 'quit',
				x = 'select',
			},
		},
	}
end

return M
