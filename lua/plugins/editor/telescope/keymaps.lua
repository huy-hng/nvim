local actions = require('telescope.actions')
local actions_generate = require('telescope.actions.generate')
local native = require('config.native_keymaps')

local builtin = require('telescope.builtin')
local layouts = require('plugins.editor.telescope.layouts')

local tele_map = Map.create('n', '<leader>f', '[Telescope]')

--------------------------------------------Find Files----------------------------------------------

-- nmap('<C-p>', { builtin.find_files, { layout_strategy = 'cursor' } }, '[Telescope] Find Files')
-- tele_map('p', { builtin.find_files, { find_command = find_command } }, 'Find Ignored Files')
Map.n('<C-e>', { builtin.find_files, layouts.vert_list_insert }, '[Telescope] Find Files')
local find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
tele_map('b', { builtin.buffers, layouts.vert_list_normal }, 'Find Buffers')
tele_map('o', { builtin.oldfiles, layouts.vert_list_normal }, 'Find Old Files')

--------------------------------------------Find String---------------------------------------------

tele_map('l', { builtin.live_grep, layouts.vert_list_insert }, 'Live Grep')
tele_map('g', { builtin.grep_string, layouts.vert_list_normal }, 'Grep String')

---------------------------------------------Reference----------------------------------------------

tele_map('h', { builtin.help_tags, layouts.vert_list_insert }, 'Find Help Tags')
tele_map('H', { builtin.highlights, layouts.vert_list_insert }, 'Highlights')
tele_map('k', { builtin.keymaps, layouts.vert_list_insert }, 'Find Keymaps')
-- nmap('<F12>', { builtin.lsp_references, layouts.vert_list_normal }, '[Telescope] LSP References')

----------------------------------------------Helpers-----------------------------------------------

local command = require('telescope.command')
tele_map('T', command.load_command, 'Telescope')
-- tele_map('T', vim.cmd.Telescope, 'Telescope')
tele_map('r', builtin.resume, 'Resume')
tele_map('t', builtin.treesitter, 'Treesitter')

------------------------------------Different Working Directory-------------------------------------

local function vert_list_insert(opts) --
	return vim.tbl_extend('force', layouts.vert_list_insert, opts)
end

local function layout_opts(layout, opts) --
	return vim.tbl_extend('force', layout, opts)
end

local function run_with_layout(fn, layout, opts)
	return function() fn(vim.tbl_extend('force', layout, opts)) end
end

-- runs in dir or the cwd
---@param fn function
---@param dir string path
local function run_in_dir(fn, dir)
	local opts = { cwd = dir or vim.fn.expand('%:p:h') }
	fn(layout_opts(layouts.vert_list_insert, opts))
end

tele_map('P', { run_in_dir, builtin.find_files }, 'Find Files in buffer dir')
tele_map('L', { run_in_dir, builtin.live_grep }, 'Live Grep in buffer dir')

tele_map('j', { run_in_dir, builtin.find_files, NVIM_CONFIG_PATH }, 'Find Neovim Files')

tele_map(
	'p',
	{ run_in_dir, builtin.find_files, '/home/huy/.local/share/nvim/lazy' },
	'Find Plugin Files'
)

local maps = {
	['<C-k>'] = actions.results_scrolling_up,
	['<C-j>'] = actions.results_scrolling_down,
	['<C-u>'] = actions.preview_scrolling_up,
	['<C-d>'] = actions.preview_scrolling_down,

	['<C-f>'] = actions.close,
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
	['<C-t>'] = actions.select_tab,
}

return {
	i = vim.tbl_extend('force', maps, {
		['<C-BS>'] = Util.wrap(nvim.feedkeys, '<C-w>', true),

		[Map.ctrl(native.j)] = actions.move_selection_next,
		[Map.ctrl(native.k)] = actions.move_selection_previous,

		-- ['<C-l>'] = actions.complete_tag,
	}),
	n = vim.tbl_extend('force', maps, {
		['<esc>'] = actions.close,

		[native.j] = actions.move_selection_next,
		[native.k] = actions.move_selection_previous,

		[native.gg] = actions.move_to_top,
		[native.G] = actions.move_to_bottom,
		['M'] = actions.move_to_middle,

		['?'] = actions_generate.which_key {
			name_width = 20, -- typically leads to smaller floats
			max_height = 0.4, -- increase potential maximum height
			separator = ' > ', -- change sep between mode, keybind, and name
			-- winblend =
		},
	}),
}
