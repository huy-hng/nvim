local M = {
	'glepnir/lspsaga.nvim',
	event = 'VeryLazy',
}

function M.config()
	require('lspsaga').setup {
		lightbulb = {
			enable = false,
			enable_in_insert = true,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
		},
		outline = {
			win_position = 'right',
			win_with = '',
			win_width = 40,
			show_detail = true,
			auto_preview = true,
			auto_refresh = true,
			auto_close = true,
			custom_sort = nil,
			keys = {
				jump = 'o',
				expand_collapse = 'u',
				quit = 'q',
			},
		},
		callhierarchy = {
			show_detail = false,
			keys = {
				edit = 'e',
				vsplit = 's',
				split = 'i',
				tabe = 't',
				jump = 'o',
				quit = 'q',
				expand_collapse = 'u',
			},
		},
		symbol_in_winbar = {
			enable = false,
			separator = ' ',
			hide_keyword = true,
			show_file = true,
			folder_level = 2,
		},
		ui = {
			-- currently only round theme
			theme = 'round',
			-- border type can be single,double,rounded,solid,shadow.
			border = 'solid',
			winblend = 0,
			expand = '',
			collapse = '',
			preview = ' ',
			-- code_action = '💡',
			code_action = ' ',
			diagnostic = '🐞',
			incoming = ' ',
			outgoing = ' ',
			colors = {
				--float window normal bakcground color
				normal_bg = '#1d1536',
				--title background color
				title_bg = '#afd700',
				red = '#e95678',
				magenta = '#b33076',
				orange = '#FF8700',
				yellow = '#f7bb3b',
				green = '#afd700',
				cyan = '#36d0e0',
				blue = '#61afef',
				purple = '#CBA6F7',
				white = '#d1d4cf',
				black = '#1c1c19',
			},
			kind = {},
		},
	}
	if true then return end
	require('lspsaga').setup {
		border_style = 'rounded', -- "single" | "double" | "rounded" | "bold" | "plus"
		--the range of 0 for fully opaque window (disabled) to 100 for fully
		--transparent background. Values between 0-30 are typically most useful.
		saga_winblend = 0,
		-- when cursor in saga window you config these to move
		move_in_saga = { prev = '<C-p>', next = '<C-n>' },
		-- Error, Warn, Info, Hint
		-- use emoji like
		-- { "🙀", "😿", "😾", "😺" }
		-- or
		-- { "😡", "😥", "😤", "😐" }
		-- and diagnostic_header can be a function type
		-- must return a string and when diagnostic_header
		-- is function type it will have a param `entry`
		-- entry is a table type has these filed
		-- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
		diagnostic_header = { ' ', ' ', ' ', 'ﴞ ' },
		-- preview lines above of lsp_finder
		preview_lines_above = 0,
		-- preview lines of lsp_finder and definition preview
		max_preview_lines = 10,
		-- use emoji lightbulb in default
		code_action_icon = ' ', -- 💡
		-- if true can press number to execute the codeaction in codeaction window
		code_action_num_shortcut = true,
		-- same as nvim-lightbulb but async
		code_action_lightbulb = {
			enable = false,
			enable_in_insert = false,
			cache_code_action = false,
			sign = false,
			update_time = 150,
			sign_priority = 20,
			virtual_text = false,
		},
		-- finder icons
		finder_icons = {
			def = '  ',
			ref = '諭 ',
			link = '  ',
		},
		-- finder do lsp request timeout
		-- if your project big enough or your server very slow
		-- you may need to increase this value
		finder_request_timeout = 1500,
		finder_action_keys = {
			open = { 'o', '<CR>' },
			vsplit = 's',
			split = 'i',
			tabe = 't',
			quit = { 'q', '<ESC>' },
		},
		code_action_keys = {
			quit = 'q',
			exec = '<CR>',
		},
		definition_action_keys = {
			edit = '<C-c>o',
			vsplit = '<C-c>v',
			split = '<C-c>i',
			tabe = '<C-c>t',
			quit = 'q',
		},
		rename_action_quit = '<C-c>',
		rename_in_select = true,
		-- show symbols in winbar must nightly
		-- in_custom mean use lspsaga api to get symbols
		-- and set it to your custom winbar or some winbar plugins.
		-- if in_cusomt = true you must set in_enable to false
		symbol_in_winbar = {
			in_custom = true,
			enable = false,
			separator = '  ',
			show_file = false,
			-- define how to customize filename, eg: %:., %
			-- if not set, use default value `%:t`
			-- more information see `vim.fn.expand` or `expand`
			-- ## only valid after set `show_file = true`
			file_formatter = '%:.',
			click_support = function(node, clicks, button, modifiers)
				-- To see all avaiable details: vim.pretty_print(node)
				local start = node.range.start
				local end_range = node.range['end']
				if button == 'l' then
					if clicks == 2 then
					-- double left click to do nothing
					else -- jump to node's starting line+char
						vim.fn.cursor { start.line + 1, start.character + 1 }
					end
				elseif button == 'r' then
					if modifiers == 's' then
						print('lspsaga') -- shift right click to print "lspsaga"
					end -- jump to node's ending line+char
					vim.fn.cursor { end_range.line + 1, end_range.character + 1 }
				elseif button == 'm' then
					-- middle click to visual select node
					vim.fn.cursor { start.line + 1, start.character + 1 }
					vim.cmd('normal v')
					vim.fn.cursor { end_range.line + 1, end_range.character + 1 }
				end
			end,
		},
		-- show outline
		show_outline = {
			win_position = 'right',
			--set special filetype win that outline window split.like NvimTree neotree
			-- defx, db_ui
			win_with = '',
			win_width = 30,
			auto_enter = false,
			auto_preview = true,
			virt_text = '┃',
			jump_key = '<cr>',
			-- auto refresh when change buffer
			auto_refresh = true,
		},
		-- custom lsp kind
		-- usage { Field = 'color code'} or {Field = {your icon, your color code}}
		custom_kind = {},
		-- if you don't use nvim-lspconfig you must pass your server name and
		-- the related filetypes into this table
		-- like server_filetype_map = { metals = { "sbt", "scala" } }
		server_filetype_map = {},
	}
end

return M
