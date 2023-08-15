return {
	cmdline = {
		-- enabled = not vim.g.has_neovide, -- enables the Noice cmdline UI
		enabled = true,
		view = 'cmdline_popup',
		opts = {},
		--@type table<string, CmdlineFormat>
		format = {
			-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
			-- view: (default is cmdline view)
			-- opts: any options passed to the view
			-- icon_hl_group: optional hl_group for the icon
			-- title: set to anything or empty string to hide
			-- stylua: ignore start
			cmdline =     { pattern = '^:', icon = '', lang = 'vim' },
			search_down = { pattern = '^/', icon = ' ', kind = 'search', lang = 'regex' },
			search_up =   { pattern = '^%?', icon = ' ', kind = 'search', lang = 'regex' },
			filter =      { pattern = '^:%s*!', icon = '$', lang = 'bash' },
			lua =         { pattern = '^:%s*lua%s+', icon = '', lang = 'lua' },
			help =        { pattern = '^:%s*he?l?p?%s+', icon = '' },
			input = {}, -- Used by input()
			-- stylua: ignore end
		},
	},
	messages = {
		-- enabled = not vim.g.has_neovide,
		enabled = true,
		-- view = 'mini_center', -- default view
		view = 'mini_left', -- default view
		view_warn = 'mini_center',
		view_error = 'mini_center',
		view_history = 'messages', -- view for :messages
		view_search = 'virtualtext', -- view for search count messages. Set to `false` to disable
	},
	popupmenu = {
		enabled = true, -- enables the Noice popupmenu UI
		---@type 'nui'|'cmp'
		backend = 'cmp', -- backend to use to show regular cmdline completions
		kind_icons = {}, -- set to `false` to disable icons
	},
	-- default options for require('noice').redirect
	-- see the section on Command Redirection
	redirect = {
		view = 'messages',
		filter = { event = 'msg_show' },
	},
	-- You can add any custom commands below that will be available with `:Noice command`
	commands = {
		output = {
			view = 'messages',
			opts = { enter = true },
			filter = {
				event = 'msg_show',
				kind = { '' },
			},
			-- filter_opts = { count = 1 },
		},
		editor = {
			view = 'messages',
			opts = { enter = true, lang = 'lua' },
			filter = {
				event = 'msg_show',
				kind = { 'echo', 'echomsg' },
				-- kind = { '' },
			},
			-- filter_opts = { count = 1 },
		},
		history = {
			-- options for the message history that you get with `:Noice`
			view = 'split',
			opts = { enter = true, format = 'details' },
			filter = {
				any = {
					{ event = 'notify' },
					{ error = true },
					{ warning = true },
					{ event = 'msg_show', kind = { '' } },
					{ event = 'lsp', kind = 'message' },
				},
			},
		},
		-- :Noice last
		last = {
			view = 'popup',
			opts = { enter = true, format = 'details' },
			filter = {
				any = {
					{ event = 'notify' },
					{ error = true },
					{ warning = true },
					{ event = 'msg_show', kind = { '' } },
					{ event = 'lsp', kind = 'message' },
				},
			},
			filter_opts = { count = 1 },
		},
		-- :Noice errors
		errors = {
			-- options for the message history that you get with `:Noice`
			view = 'popup',
			opts = { enter = true, format = 'details' },
			filter = { error = true },
			filter_opts = { reverse = true },
		},
	},
	notify = {
		-- Noice can be used as `vim.notify` so you can route any notification like other messages
		-- Notification messages have their level and other properties set.
		-- event is always "notify" and kind can be any log level as a string
		-- The default routes will forward notifications to nvim-notify
		-- Benefit of using Noice for this is the routing and consistent history view
		enabled = true,
		view = 'notify',
	},
	lsp = {
		progress = {
			enabled = true,
			-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
			-- See the section on formatting for more details on how to customize.
			--- @type NoiceFormat|string
			format = 'lsp_progress',
			--- @type NoiceFormat|string
			format_done = 'lsp_progress_done',
			throttle = 100, -- frequency to update lsp progress message
			view = 'mini',
		},
		override = {
			-- override the default lsp markdown formatter with Noice
			['vim.lsp.util.convert_input_to_markdown_lines'] = true,
			-- override the lsp markdown formatter with Noice
			['vim.lsp.util.stylize_markdown'] = true,
			-- override cmp documentation with Noice (needs the other options to work)
			['cmp.entry.get_documentation'] = true,
		},
		hover = {
			enabled = true,
			silent = true, -- set to true to not show a message if hover is not available
			view = nil, -- when nil, use defaults from documentation
			---@type NoiceViewOptions
			opts = {}, -- merged with defaults from documentation
		},
		signature = {
			enabled = true,
			auto_open = {
				enabled = true,
				trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
				luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
				throttle = 50, -- Debounce lsp signature help request by 50ms
			},
			view = nil, -- when nil, use defaults from documentation
			---@type NoiceViewOptions
			opts = {}, -- merged with defaults from documentation
		},
		message = {
			-- Messages shown by lsp servers
			enabled = true,
			view = 'mini',
			opts = {},
		},
		-- defaults for hover and signature help
		documentation = {
			view = 'hover',
			---@type NoiceViewOptions
			opts = {
				lang = 'markdown',
				replace = true,
				render = 'plain',
				format = { '{message}' },
				win_options = { concealcursor = 'n', conceallevel = 1 },
			},
		},
	},
	markdown = {
		hover = {
			['|(%S-)|'] = vim.cmd.help, -- vim help links
			['%[.-%]%((%S-)%)'] = require('noice.util').open, -- markdown links
		},
		highlights = {
			['|%S-|'] = '@text.reference',
			['@%S+'] = '@parameter',
			['^%s(Parameters:)'] = '@text.title',
			['^%s(Return:)'] = '@text.title',
			['^%s(See also:)'] = '@text.title',
			['{%S-}'] = '@parameter',
		},
	},
	smart_move = {
		-- noice tries to move out of the way of existing floating windows.
		enabled = true, -- you can disable this behaviour here
		-- add any filetypes here, that shouldn't trigger smart move.
		excluded_filetypes = { 'cmp_menu', 'cmp_docs', 'notify' },
	},
	presets = {
		-- you can enable a preset by setting it to true, or a table that will override the preset config
		-- you can also add custom presets that you can enable/disable with enabled=true
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = false, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	throttle = 100, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
	views = require('plugins.ui.noice.views'),
	routes = require('plugins.ui.noice.routes'),
	status = {},
	format = {
		spinner = {
			name = 'sand',
			hl_group = nil,
		},
	},
}
