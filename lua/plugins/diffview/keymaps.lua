local a = require('diffview.actions')

local function n(lhs, rhs, desc) return { 'n', lhs, rhs, { desc = desc }} end
local function nx(lhs, rhs, desc) return { {'n', 'x'}, lhs, rhs, { desc = desc }} end
local fns = R('plugins.diffview.functions')

return {
	disable_defaults = true, -- Disable the default keymaps
	view = {
		-- The `view` bindings are active in the diff buffers, only when the current
		-- tabpage is a Diffview.
		n('q',             vim.cmd.DiffviewClose,'Close Diffview'),

		n('<tab>',      a.select_next_entry, 'Open diff for next file'),
		n('<s-tab>',    a.select_prev_entry, 'Open diff for previous file'),
		n('gf',         a.goto_file,         'Open file in a new split in the previous tabpage'),
		n('<C-w><C-f>', a.goto_file_split,   'Open file in a new split'),
		n('<C-w>gf',    a.goto_file_tab,     'Open file in a new tabpage'),
		n('<leader>e',  a.focus_files,       'Bring focus to the file panel'),
		n('<leader>b',  a.toggle_files,      'Toggle the file panel.'),
		n('g<C-x>',     a.cycle_layout,      'Cycle through available layouts.'),
		n('[x',         a.prev_conflict,     'In the merge-tool: jump to the previous conflict'),
		n(']x',         a.next_conflict,     'In the merge-tool: jump to the next conflict'),

		n('<leader>co', a.conflict_choose('ours'),   'Choose OURS version of conflict'),
		n('<leader>ct', a.conflict_choose('theirs'), 'Choose THEIRS version of conflict'),
		n('<leader>cb', a.conflict_choose('base'),   'Choose BASE version of conflict'),
		n('<leader>ca', a.conflict_choose('all'),    'Choose all the versions of conflict'),
		n('dx',         a.conflict_choose('none'),   'Delete the conflict region'),
	},
	diff1 = {
		-- Mappings in single window diff layouts
		n('q',             vim.cmd.DiffviewClose,             'Close Diffview'),
		n('g?', a.help({ 'view', 'diff1' }), 'Open help panel'),
	},
	diff2 = {
		-- Mappings in 2-way diff layouts
		n('q',             vim.cmd.DiffviewClose,             'Close Diffview'),
		n('g?', a.help({ 'view', 'diff2' }), 'Open help panel'),
	},
	diff3 = {
		-- Mappings in 3-way diff layouts
		n('q',             vim.cmd.DiffviewClose,             'Close Diffview'),
		nx('2do', a.diffget('ours'),   'Obtain diff hunk from OURS version of the file' ),
		nx('3do', a.diffget('theirs'), 'Obtain diff hunk from THEIRS version of the file' ),
		n('g?', a.help({ 'view', 'diff3' }), 'Open the help panel'),
	},
	diff4 = {
		-- Mappings in 4-way diff layouts
		n('q',             vim.cmd.DiffviewClose,             'Close Diffview'),
		nx('1do', a.diffget('base'),   'Obtain diff hunk from BASE version of the file'),
		nx('2do', a.diffget('ours'),   'Obtain diff hunk from OURS version of the file'),
		nx('3do', a.diffget('theirs'), 'Obtain diff hunk from THEIRS version of the file'),
		n('g?', a.help({ 'view', 'diff4' }), 'Open the help panel'),
	},
	file_panel = {
		n('q',             vim.cmd.DiffviewClose,             'Close Diffview'),

		n('j',             a.next_entry,          'Bring cursor to next file entry'),
		n('k',             a.prev_entry,          'Bring cursor to previous file entry'),
		n('h', fns.close_fold, 'Fold'),
		n('l', fns.open_fold, 'Unfold'),
		n('W', fns.collapse_all, 'Collapse All'),
		n('E', fns.uncollapse_all, 'Uncollapse All'),
		-- n('l',             a.select_entry,        'Open diff for selected entry'),
		-- n('h',             a.select_entry,        'Open diff for selected entry'),
		n('<cr>',          a.select_entry,        'Open diff for selected entry'),
		n('-',             a.toggle_stage_entry,  'Stage / unstage the selected entry'),
		n('s',             a.toggle_stage_entry,  'Stage / unstage the selected entry'),
		n('S',             a.stage_all,           'Stage all entries'),
		n('U',             a.unstage_all,         'Unstage all entries'),
		n('X',             a.restore_entry,       'Restore entry to the state on the left side'),
		n('L',             a.open_commit_log,     'Open the commit log panel'),
		n('<c-b>',         a.scroll_view(-0.5),  'Scroll the view up'),
		n('<c-f>',         a.scroll_view(0.5),   'Scroll the view down'),
		n('<tab>',         a.select_next_entry,   'Open diff for next file'),
		n('<s-tab>',       a.select_prev_entry,   'Open diff for previous file'),
		n('gf',            a.goto_file,           'Open file in a new split in the previous tabpage'),
		n('<C-w><C-f>',    a.goto_file_split,     'Open file in a new split'),
		n('<C-w>gf',       a.goto_file_tab,       'Open file in a new tabpage'),
		n('i',             a.listing_style,       "Toggle between 'list' and 'tree' views"),
		n('f',             a.toggle_flatten_dirs, 'Flatten empty subdirectories in tree listing style'),
		n('R',             a.refresh_files,       'Update stats and entries in the file list'),
		n('<leader>e',     a.focus_files,         'Bring focus to the file panel'),
		n('<leader>b',     a.toggle_files,        'Toggle the file panel'),
		n('g<C-x>',        a.cycle_layout,        'Cycle available layouts'),
		n('[x',            a.prev_conflict,       'Go to previous conflict'),
		n(']x',            a.next_conflict,       'Go to next conflict'),
		n('g?',            a.help('file_panel'),  'Open help panel'),
	},
	file_history_panel = {
		n('q',             vim.cmd.DiffviewClose,'Close Diffview'),

		n('g!',            a.options,            'Open option panel'),
		n('<C-A-d>',       a.open_in_diffview,   'Open entry under the cursor in a diffview'),
		n('y',             a.copy_hash,          'Copy commit hash of the entry under the cursor'),
		n('L',             a.open_commit_log,    'Show commit details'),
		n('zR',            a.open_all_folds,     'Fold Expand'),
		n('zM',            a.close_all_folds,    'Fold Collapse'),
		n('j',             a.next_entry,         'Bring cursor to next file entry'),
		n('k',             a.prev_entry,         'Bring cursor to previous file entry.'),

		n('h', R('plugins.diffview.functions').close_fold, 'Fold'),
		n('l', R('plugins.diffview.functions').open_fold, 'Unfold'),

		-- n('l',             a.select_entry,       'Open diff for the selected entry.'),
		-- n('h',             a.select_entry,       'Open diff for the selected entry.'),
		n('<cr>',          a.select_entry,       'Open diff for the selected entry.'),
		n('<c-b>',         a.scroll_view(-0.25), 'Scroll the view up'),
		n('<c-f>',         a.scroll_view(0.25),  'Scroll the view down'),
		n('<tab>',         a.select_next_entry,  'Open diff for the next file'),
		n('<s-tab>',       a.select_prev_entry,  'Open diff for the previous file'),
		n('gf',            a.goto_file,          'Open file in a new split in the previous tabpage'),
		n('<C-w><C-f>',    a.goto_file_split,    'Open file in a new split'),
		n('<C-w>gf',       a.goto_file_tab,      'Open file in a new tabpage'),
		n('<leader>e',     a.focus_files,        'File Panel: focus'),
		n('<leader>b',     a.toggle_files,       'File Panel: toggle'),
		n('g<C-x>',        a.cycle_layout,       'Layouts: cycle'),
		n('g?',            a.help('file_history_panel'), 'Open the help panel'),
	},
	option_panel = {
		n('<tab>', a.select_entry,         'Change the current option'),
		n('q',     a.close,                'Close the panel'),
		n('g?',    a.help('option_panel'), 'Open the help panel'),
	},
	help_panel = {
		n('q',     a.close, 'Close help menu'),
		n('<esc>', a.close, 'Close help menu'),
	},
}
