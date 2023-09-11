local a = require('diffview.actions')

local function n(lhs, rhs, desc) return { 'n', lhs, rhs, { desc = desc } } end
local function nx(lhs, rhs, desc) return { { 'n', 'x' }, lhs, rhs, { desc = desc } } end
local fns = require('plugins.git.diffview.functions')

-- stylua: ignore
return {
	disable_defaults = true, -- Disable the default keymaps
	view = {
		-- The `view` bindings are active in the diff buffers, only when the current
		-- tabpage is a Diffview.
		n('q',           vim.cmd.DiffviewClose,            'Close Diffview'),
		n('<leader>dd',  vim.cmd.DiffviewClose,            'Close Diffview'),
		n('gf',          a.goto_file_edit,                 'Open the file in the previous tabpage'),
		n('<C-w><C-f>',  a.goto_file_split,                'Open the file in a new split'),
		n('<C-w>gf',     a.goto_file_tab,                  'Open the file in a new tabpage'),
		n('<leader>e',   a.focus_files,                    'Bring focus to the file panel'),
		n('<leader>b',   a.toggle_files,                   'Toggle the file panel.'),
		n('g<C-x>',      a.cycle_layout,                   'Cycle through available layouts.'),
		n('[x',          a.prev_conflict,                  'In the merge-tool: jump to the previous conflict'),
		n(']x',          a.next_conflict,                  'In the merge-tool: jump to the next conflict'),
		n('<leader>co',  a.conflict_choose('ours'),        'Choose the OURS version of a conflict'),
		n('<leader>ct',  a.conflict_choose('theirs'),      'Choose the THEIRS version of a conflict'),
		n('<leader>cb',  a.conflict_choose('base'),        'Choose the BASE version of a conflict'),
		n('<leader>ca',  a.conflict_choose('all'),         'Choose all the versions of a conflict'),
		n('dx',          a.conflict_choose('none'),        'Delete the conflict region'),
		n('<leader>cO',  a.conflict_choose_all('ours'),    'Choose the OURS version of a conflict for the whole file'),
		n('<leader>cT',  a.conflict_choose_all('theirs'),  'Choose the THEIRS version of a conflict for the whole file'),
		n('<leader>cB',  a.conflict_choose_all('base'),    'Choose the BASE version of a conflict for the whole file'),
		n('<leader>cA',  a.conflict_choose_all('all'),     'Choose all the versions of a conflict for the whole file'),
		n('dX',          a.conflict_choose_all('none'),    'Delete the conflict region for the whole file'),
	},
	diff1 = {
		-- Mappings in single window diff layouts
		n('g?', a.help({ 'view', 'diff1' }), 'Open the help panel'),
	},
	diff2 = {
		-- Mappings in 2-way diff layouts
		n('g?', a.help({ 'view', 'diff2' }), 'Open the help panel'),
	},
	diff3 = {
		-- Mappings in 3-way diff layouts
		nx('2do',  a.diffget('ours'),            'Obtain the diff hunk from the OURS version of the file'),
		nx('3do',  a.diffget('theirs'),          'Obtain the diff hunk from the THEIRS version of the file'),
		n('g?',    a.help({ 'view', 'diff3' }),  'Open the help panel'),
	},
	diff4 = {
		-- Mappings in 4-way diff layouts
		nx('1do',  a.diffget('base'),            'Obtain the diff hunk from the BASE version of the file'),
		nx('2do',  a.diffget('ours'),            'Obtain the diff hunk from the OURS version of the file'),
		nx('3do',  a.diffget('theirs'),          'Obtain the diff hunk from the THEIRS version of the file'),
		n('g?',   a.help({ 'view', 'diff4' }),  'Open the help panel'),
	},
	file_panel = {
		n('q',              vim.cmd.DiffviewClose,            'Close Diffview'),
		n('<leader>dd',     vim.cmd.DiffviewClose,            'Close Diffview'),
		n(Keys.j,           a.next_entry,                     'Bring the cursor to the next file entry'),
		n(Keys.k,           a.prev_entry,                     'Bring the cursor to the previous file entry.'),
		n(Keys.down,        a.select_next_entry,              'Open the diff for the next file'),
		n(Keys.up,          a.select_prev_entry,              'Open the diff for the previous file'),

		-- n(Keys.l,          a.select_entry,                   'Open the diff for the selected entry'),
		n(Keys.enter,       a.select_entry,                   'Open the diff for the selected entry.'),

		-- n('<C-space>',      a.toggle_stage_entry,             'Stage / unstage the selected entry'),
		n('<C-space>',      fns.toggle_stage_entry,           'Stage / unstage the selected entry'),
		n('S',              a.stage_all,                      'Stage all entries'),
		n('U',              a.unstage_all,                    'Unstage all entries'),
		n('X',              a.restore_entry,                  'Restore entry to the state on the left side'),
		n('L',              a.open_commit_log,                'Open the commit log panel'),
		n(Keys.l,           a.open_fold,                      'Expand fold'),
		n(Keys.h,           a.close_fold,                     'Collapse fold'),
		-- n('za',             a.toggle_fold,                    'Toggle fold'),
		n(Keys.open_fold,   a.open_all_folds,                 'Expand all folds'),
		n(Keys.close_fold,  a.close_all_folds,                'Collapse all folds'),
		n(Keys.K,           a.scroll_view(-0.25),             'Scroll the view up'),
		n(Keys.J,           a.scroll_view(0.25),              'Scroll the view down'),

		n('gf',             a.goto_file_edit,                 'Open the file in the previous tabpage'),
		n('<C-w><C-f>',     a.goto_file_split,                'Open the file in a new split'),
		n('<C-w>gf',        a.goto_file_tab,                  'Open the file in a new tabpage'),
		-- n('i',              a.listing_style,                  "Toggle between 'list' and 'tree' views"),
		n('f',              a.toggle_flatten_dirs,            'Flatten empty subdirectories in tree listing style'),
		n('R',              a.refresh_files,                  'Update stats and entries in the file list'),
		n('<leader>e',      a.focus_files,                    'Bring focus to the file panel'),
		n('<leader>b',      a.toggle_files,                   'Toggle the file panel'),
		n('g<C-x>',         a.cycle_layout,                   'Cycle available layouts'),
		n('[x',             a.prev_conflict,                  'Go to the previous conflict'),
		n(']x',             a.next_conflict,                  'Go to the next conflict'),
		n('g?',             a.help('file_panel'),             'Open the help panel'),
		n('<leader>cO',     a.conflict_choose_all('ours'),    'Choose the OURS version of a conflict for the whole file'),
		n('<leader>cT',     a.conflict_choose_all('theirs'),  'Choose the THEIRS version of a conflict for the whole file'),
		n('<leader>cB',     a.conflict_choose_all('base'),    'Choose the BASE version of a conflict for the whole file'),
		n('<leader>cA',     a.conflict_choose_all('all'),     'Choose all the versions of a conflict for the whole file'),
		n('dX',             a.conflict_choose_all('none'),    'Delete the conflict region for the whole file'),
	},
	file_history_panel = {
		n('q',             vim.cmd.DiffviewClose,         'Close Diffview'),
		n('<leader>dd',    vim.cmd.DiffviewClose,         'Close Diffview'),
		n('g!',            a.options,                     'Open the option panel'),
		n('<C-A-d>',       a.open_in_diffview,            'Open the entry under the cursor in a diffview'),
		n('y',             a.copy_hash,                   'Copy the commit hash of the entry under the cursor'),
		n('L',             a.open_commit_log,             'Show commit details'),
		n('zR',            a.open_all_folds,              'Expand all folds'),
		n('zM',            a.close_all_folds,             'Collapse all folds'),

		n(Keys.j,          a.next_entry,                  'Bring the cursor to the next file entry'),
		n(Keys.k,          a.prev_entry,                  'Bring the cursor to the previous file entry.'),
		n(Keys.down,       a.select_next_entry,           'Open the diff for the next file'),
		n(Keys.up,         a.select_prev_entry,           'Open the diff for the previous file'),
		n(Keys.enter,      a.select_entry,                'Open the diff for the selected entry.'),
		n(Keys.K,          a.scroll_view(-0.25),          'Scroll the view up'),
		n(Keys.J,          a.scroll_view(0.25),           'Scroll the view down'),
		n('gf',            a.goto_file_edit,              'Open the file in the previous tabpage'),
		n('<C-w><C-f>',    a.goto_file_split,             'Open the file in a new split'),
		n('<C-w>gf',       a.goto_file_tab,               'Open the file in a new tabpage'),
		n('<leader>e',     a.focus_files,                 'Bring focus to the file panel'),
		n('<leader>b',     a.toggle_files,                'Toggle the file panel'),
		n('g<C-x>',        a.cycle_layout,                'Cycle available layouts'),
		n('g?',            a.help('file_history_panel'),  'Open the help panel'),
	},
	option_panel = {
		n('<tab>', a.select_entry,          'Change the current option'),
		n('q',     a.close,                 'Close the panel'),
		n('g?',    a.help('option_panel'),  'Open the help panel'),
	},
	help_panel = {
		n('q',     a.close,  'Close help menu'),
		n('<esc>', a.close,  'Close help menu'),
	},
}
