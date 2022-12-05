local status_telescope, telescope = pcall(require, 'telescope')
if not status_telescope then return end

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

-- themes.get_dropdown() -- more vertical
-- themes.get_cursor() -- tiny
-- themes.get_ivy() -- bottom

local tele_map = PrefixMap('n', '<leader>f', '[Telescope]')
local layouts = R('plugins.telescope.layouts')

-- nmap('<C-p>', { builtin.find_files, { layout_strategy = 'cursor' } }, '[Telescope] Find Files')
nmap('<C-p>', { builtin.find_files, layouts.find_files }, '[Telescope] Find Files')
tele_map('p', { builtin.find_files, layouts.find_files }, 'Find Files')
tele_map('l', { builtin.live_grep, layouts.find_files }, 'Live Grep')
tele_map('g', { builtin.grep_string, layouts.list }, 'Grep String')
tele_map('h', { builtin.help_tags, layouts.find_files }, 'Find Help Tags')
tele_map('k', { builtin.keymaps, layouts.find_files }, 'Find Keymaps')

tele_map('b', { builtin.buffers, layouts.list }, 'Find Buffers')
tele_map('o', { builtin.oldfiles, layouts.list }, 'Find Old Files')

tele_map('r', builtin.resume, 'Resume')
tele_map('t', builtin.treesitter, 'Treesitter')

tele_map('T', CMD('Telescope'), 'Telescope')

-- tele_map('c', builtin.current_buffer_fuzzy_find, 'Fuzzy Find in current Buffer')


telescope.setup {
	defaults = {
		-- winblend = function() return vim.go.winblend end,
		winblend = vim.go.winblend,
		-- winblend = 75,
		prompt_prefix = '  ',
		selection_caret = ' ',
		path_display = { 'truncate' },
		border = true,
		initial_mode = 'insert', -- normal
		layout_strategy = 'vertical',
		scroll_strategy = 'limit',
		mappings = require('plugins.telescope.keymaps'),
		layout_config = {
			width = { 0.6, max = 180 },

			bottom_pane = {
				-- height = 25,
				-- preview_cutoff = 120,
				-- prompt_position = "top"
			},
			center = {
				-- height = 0.4,
				-- preview_cutoff = 40,
				-- prompt_position = "top",
				-- width = 0.5
			},
			cursor = {},
			horizontal = {
				-- height = 0.9,
				-- preview_cutoff = 120,
				-- prompt_position = "bottom",
				-- width = 0.8
			},
			vertical = {
				-- height = 0.9,
				-- preview_cutoff = 40,
				-- prompt_position = "bottom",
				-- width = 0.8
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
}
