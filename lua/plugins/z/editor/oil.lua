local M = {
	'stevearc/oil.nvim',
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	-- Optional dependencies
	dependencies = { { 'echasnovski/mini.icons', opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	-- event = 'VeryLazy',
}

function M.config()
	local oil = require('oil')
	oil.setup {
		default_file_explorer = true,
		columns = {
			'icon',
			-- "permissions",
			-- 'size',
			-- 'mtime',
		},
		delete_to_trash = true,
		-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
		skip_confirm_for_simple_edits = true,
		-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
		-- (:help prompt_save_on_select_new_entry)
		prompt_save_on_select_new_entry = true,
		-- Set to `false` to remove a keymap
		keymaps = {
			['<C-c>'] = { 'actions.close', mode = 'n' },
			['<C-p>'] = { 'actions.close', mode = 'n' },
			['<esc>'] = { 'actions.close', mode = 'n' },
			['q'] = { 'actions.close', mode = 'n' },

			[Keys.h] = { 'actions.parent', mode = 'n' },
			[Keys.l] = { 'actions.select', mode = 'n' },
			['<CR>'] = 'actions.select',

			[Keys.alt.h] = { 'h', mode = 'n' },
			[Keys.alt.j] = { 'j', mode = 'n' },
			[Keys.alt.k] = { 'k', mode = 'n' },
			[Keys.alt.l] = { 'l', mode = 'n' },


			['N'] = { 'actions.preview_scroll_down', mode = 'n' },
			['E'] = { 'actions.preview_scroll_up', mode = 'n' },
			-- ['<C-p>'] = 'actions.preview',

			['?'] = { 'actions.show_help', mode = 'n' },
			['<C-v>'] = { 'actions.select', opts = { vertical = true } },
			['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
			['<C-t>'] = { 'actions.select', opts = { tab = true } },
			['<C-l>'] = 'actions.refresh',
			['_'] = { 'actions.open_cwd', mode = 'n' },
			['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
			['js'] = { 'actions.change_sort', mode = 'n' },
			['jx'] = 'actions.open_external',
			['j.'] = { 'actions.toggle_hidden', mode = 'n' },
			['j\\'] = { 'actions.toggle_trash', mode = 'n' },

			['gs'] = false,
			['gx'] = false,
			['g.'] = false,
			['g\\'] = false,
		},
		-- Set to false to disable all of the above keymaps
		use_default_keymaps = false,
		view_options = {
			show_hidden = true,
			-- This function defines what will never be shown, even when `show_hidden` is set
			is_always_hidden = function(name, bufnr)
				return name == '..' or name == '.git'
			end,
			-- Sort file names with numbers in a more intuitive order for humans.
			-- Can be "fast", true, or false. "fast" will turn it off for large directories.
			natural_order = 'fast',
		},
		-- Configuration for the floating window in oil.open_float
		float = {
			-- Padding around the floating window
			padding = 2,
			-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			max_width = 200,
			max_height = 0.9,
			border = 'rounded',
			win_options = {
				winblend = 0,
			},
			preview_split = 'left', -- preview_split: Split direction: "auto", "left", "right", "above", "below".
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				conf.col = conf.col - 30
				return conf
			end,
		},
		preview_win = {
			-- Whether the preview window is automatically updated when the cursor is moved
			update_on_cursor_moved = true,
			-- How to open the preview window "load"|"scratch"|"fast_scratch"
			preview_method = 'fast_scratch',
			-- A function that returns true to disable preview on a file e.g. to avoid lag
			disable_preview = function(filename) return false end,
			-- Window-local options to use for preview window buffers
			win_options = {},
		},
	}
	Map.n(
		'<c-p>',
		function() oil.open_float(nil, { preview = { horizontal = true } }) end,
		'Open floating Oil'
	)
end

return M
