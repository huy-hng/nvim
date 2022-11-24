local status_telescope, telescope = pcall(require, 'telescope')
if not status_telescope then return end

local builtin = require('telescope.builtin')

nmap('<C-p>', builtin.find_files, 'Find Files')
-- nmap('<leader>ff', telescope.find_files, 'Find Files')
nmap('<leader>fo', builtin.oldfiles, 'Find Old Files')
nmap('<leader>ft', '<cmd>Telescope<cr>', 'Telescope')

nmap('<leader>fl', builtin.live_grep, 'Live Grep')
nmap('<leader>fg', builtin.grep_string, 'Grep String')

nmap('<leader>fb', builtin.buffers, 'Find Buffers')
nmap('<leader>fh', builtin.help_tags, 'Find Help Tags')
nmap('<leader>fk', builtin.keymaps, 'Find Keymaps')

local actions = require('telescope.actions')

telescope.setup {
	defaults = {
		winblend = vim.go.winblend,
		-- winblend = 75,
		prompt_prefix = ' ',
		selection_caret = ' ',
		path_display = { 'smart' },

		mappings = {
			i = {
				['<C-n>'] = actions.cycle_history_next,
				-- ['<C-BS>'] = actions.move_selection_previous,
				['<C-p>'] = actions.cycle_history_prev,

				['<C-j>'] = actions.move_selection_next,
				['<C-k>'] = actions.move_selection_previous,

				['<C-c>'] = actions.close,

				['<Down>'] = actions.move_selection_next,
				['<Up>'] = actions.move_selection_previous,

				['<CR>'] = actions.select_default,
				['<C-x>'] = actions.select_horizontal,
				['<C-v>'] = actions.select_vertical,
				['<C-t>'] = actions.select_tab,

				['<C-u>'] = actions.preview_scrolling_up,
				['<C-d>'] = actions.preview_scrolling_down,

				['<PageUp>'] = actions.results_scrolling_up,
				['<PageDown>'] = actions.results_scrolling_down,

				['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
				['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
				['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
				['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
				['<C-l>'] = actions.complete_tag,
				['<C-_>'] = actions.which_key,
			},
			n = {
				['<esc>'] = actions.close,
				['<CR>'] = actions.select_default,
				['<C-x>'] = actions.select_horizontal,
				['<C-v>'] = actions.select_vertical,
				['<C-t>'] = actions.select_tab,

				['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
				['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
				['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
				['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

				['j'] = actions.move_selection_next,
				['k'] = actions.move_selection_previous,
				['H'] = actions.move_to_top,
				['M'] = actions.move_to_middle,
				['L'] = actions.move_to_bottom,

				['<Down>'] = actions.move_selection_next,
				['<Up>'] = actions.move_selection_previous,
				['gg'] = actions.move_to_top,
				['G'] = actions.move_to_bottom,

				['<C-u>'] = actions.preview_scrolling_up,
				['<C-d>'] = actions.preview_scrolling_down,

				['<PageUp>'] = actions.results_scrolling_up,
				['<PageDown>'] = actions.results_scrolling_down,

				['?'] = actions.which_key,
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
