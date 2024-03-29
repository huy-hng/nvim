local actions = require('telescope.actions')
local actions_generate = require('telescope.actions.generate')

local builtin = require('telescope.builtin')
local layouts = require('plugins.editor.telescope.layouts')

local map = Map.new(Keys.leader.telescope, '', '[Telescope]')

--------------------------------------------Find Files----------------------------------------------

-- nmap('<C-p>', { builtin.find_files, { layout_strategy = 'cursor' } }, '[Telescope] Find Files')
-- map.n('p', { builtin.find_files, { find_command = find_command } }, 'Find Ignored Files')
Map.n(
	Keys.ctrl.telescope,
	{ builtin.find_files, layouts.vert_list_insert },
	'[Telescope] Find Files'
)
local find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
map.n('b', { builtin.buffers, layouts.vert_list_normal }, 'Find Buffers')
map.n('o', { builtin.oldfiles, layouts.vert_list_normal }, 'Find Old Files')

--------------------------------------------Find String---------------------------------------------

local function layout_extend(layout, opts) return vim.tbl_extend('force', layout, opts) end

map.n('l', { builtin.live_grep, layouts.vert_list_insert }, 'Live Grep')
map.n('g', { builtin.grep_string, layouts.vert_list_normal }, 'Grep String')
map.v('g', function() --
	builtin.grep_string(layout_extend(layouts.vert_list_normal, { search = nvim.visual_text() }))
end, 'Grep String')

---------------------------------------------Reference----------------------------------------------

map.n('h', { builtin.help_tags, layouts.vert_list_insert }, 'Find Help Tags')
map.n('H', { builtin.highlights, layouts.vert_list_insert }, 'Highlights')
map.n('k', { builtin.keymaps, layouts.vert_list_insert }, 'Find Keymaps')
-- nmap('<F12>', { builtin.lsp_references, layouts.vert_list_normal }, '[Telescope] LSP References')

----------------------------------------------Helpers-----------------------------------------------

local command = require('telescope.command')
map.n('T', command.load_command, 'Telescope')
-- map.n('T', vim.cmd.Telescope, 'Telescope')
map.n('r', { builtin.resume, layouts.vert_list_normal }, 'Resume')
map.n('t', builtin.treesitter, 'Treesitter')

------------------------------------Different Working Directory-------------------------------------

-- runs in dir or the cwd
---@param fn function
---@param dir string path
local function run_in_dir(fn, dir)
	local opts = { cwd = dir or vim.fn.expand('%:p:h') }
	fn(vim.tbl_extend('force', layouts.vert_list_insert, opts))
end

map.n('P', { run_in_dir, builtin.find_files }, 'Find Files in buffer dir')
map.n('L', { run_in_dir, builtin.live_grep }, 'Live Grep in buffer dir')
map.n('v', { run_in_dir, builtin.find_files, NVIM_CONFIG_PATH }, 'Find Neovim Files')

--stylua: ignore
map.n( 'p', { run_in_dir, builtin.find_files, '/home/huy/.local/share/nvim/lazy' }, 'Find Plugin Files')

local maps = {
	[Keys.ctrl.k] = actions.results_scrolling_up,
	[Keys.ctrl.j] = actions.results_scrolling_down,
	[Keys.alt.k] = actions.preview_scrolling_up,
	[Keys.alt.j] = actions.preview_scrolling_down,

	[Keys.ctrl.telescope] = actions.close,
	['<C-c>'] = actions.close,
	['<C-Esc>'] = actions.close,

	['<CR>'] = actions.select_default,

	['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
	['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
	['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
	['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

	['<Down>'] = actions.cycle_history_next,
	['<Up>'] = actions.cycle_history_prev,

	['<C-x>'] = actions.select_horizontal,
	['<C-v>'] = actions.select_vertical,
	-- ['<C-t>'] = actions.select_tab,
}

return {
	i = vim.tbl_extend('force', maps, {
		['<C-BS>'] = Util.wrap(nvim.feedkeys, '<C-w>', true),

		[Keys.ctrl.j] = actions.move_selection_next,
		[Keys.ctrl.k] = actions.move_selection_previous,
	}),
	n = vim.tbl_extend('force', maps, {
		['<esc>'] = actions.close,

		[Keys.J] = actions.preview_scrolling_down,
		[Keys.K] = actions.preview_scrolling_up,

		[Keys.j] = actions.move_selection_next,
		[Keys.k] = actions.move_selection_previous,

		[Keys.gg] = actions.move_to_top,
		[Keys.G] = actions.move_to_bottom,
		-- ['M'] = actions.move_to_middle,

		['?'] = actions_generate.which_key {
			name_width = 20, -- typically leads to smaller floats
			max_height = 0.4, -- increase potential maximum height
			separator = ' > ', -- change sep between mode, keybind, and name
			-- winblend =
		},
	}),
}
