local M = {
	'folke/which-key.nvim',
	-- event = 'VeryLazy',
	lazy = false,
}

function M.config()
	require('plugins.ui.whichkey.ignores')
	require('plugins.ui.whichkey.whichkey')

	require('which-key').setup {
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			spelling = {
				enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			presets = {
				operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = false, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
		-- add operators that will trigger motion and text object completion
		-- to enable all native operators, set the preset / operators plugin above
		operators = { gc = 'Comments' },
		key_labels = {
			-- override the label used to display some keys. It doesn't effect WK in any other way.
			-- For example:
			-- ['<SPACE>'] = 'SPC',
			-- ['<CR>'] = 'RET',
			-- ['<Tab>'] = 'TAB',
			-- ['Tab'] = 'ATAB',
		},
		icons = {
			breadcrumb = '➜', -- symbol used in the command line area that shows your active key combo
			separator = '»', -- symbol used between a key and it's label
			group = '+', -- symbol prepended to a group
		},
		popup_mappings = {
			-- binding to scroll inside the popup
			scroll_down = Keys.ctrl.j,
			scroll_up = Keys.ctrl.k,
		},
		window = {
			border = 'none', -- none, single, double, shadow
			position = 'top', -- bottom, top
			padding = { 1, 4, 1, 4 }, -- extra window padding [top, right, bottom, left]
			margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
			winblend = vim.o.pumblend,
		},
		layout = {
			height = { min = 10, max = 20 }, -- min and max height of the columns
			width = { min = 60, max = 80 }, -- min and max width of the columns
			spacing = 16, -- spacing between columns
			align = 'center', -- align columns left, center or right
		},
		ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
		hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
		show_help = false, -- show help message on the command line when the popup is visible
		show_keys = false, -- show the currently pressed key and its label as a message in the command line
		triggers = { '<leader>', '<localleader>', 'z', '<C-w>', '"', "'", '`' }, -- 'auto', automatically setup triggers
		-- triggers_blacklist = {
		-- 	-- list of mode / prefixes that should never be hooked by WhichKey
		-- 	-- this is mostly relevant for key maps that start with a native binding
		-- 	-- most people should not need to change this
		-- 	i = { 'j', 'k' },
		-- 	v = { 'j', 'k' },
		-- 	-- i = { 'n', 'e' },
		-- 	-- v = { 'n', 'e' },
		-- },
		-- disable the WhichKey popup for certain buf types and file types.
		-- Disabled by deafult for Telescope
		disable = {
			buftypes = {},
			filetypes = { 'TelescopePrompt' },
		},
	}
end
-- M.config()

return M
