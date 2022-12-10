local actions = require('telescope.actions')
local actions_generate = require('telescope.actions.generate')

return {
	i = {
		-- ['<C-n>'] = actions.cycle_history_next,
		-- ['<C-p>'] = actions.cycle_history_prev,
		['<down>'] = actions.cycle_history_next,
		['<up>'] = actions.cycle_history_prev,
		['<C-BS>'] = function()
			Feedkeys('<C-w>', false)
		end,

		['<C-j>'] = actions.move_selection_next,
		['<C-k>'] = actions.move_selection_previous,

		['<C-c>'] = actions.close,
		['<C-Esc>'] = actions.close,

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
		['<C-Esc>'] = actions.close,
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

		['?'] = actions_generate.which_key {
			name_width = 20, -- typically leads to smaller floats
			max_height = 0.4, -- increase potential maximum height
			separator = ' > ', -- change sep between mode, keybind, and name
			-- winblend =
		},
	},
}
