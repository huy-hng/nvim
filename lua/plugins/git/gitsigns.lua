local M = {
	'lewis6991/gitsigns.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

function M.config()
	local gitsigns = require('gitsigns')

	-- TODO: metamap
	local map = Map.create('n', '<leader>g', '[Gitsigns]')
	map('nd', gitsigns.toggle_deleted, 'Show deleted lines')
	map('nw', gitsigns.toggle_word_diff, 'Show word diff')
	map('ns', gitsigns.toggle_signs, 'Show word diff')
	map('nn', gitsigns.toggle_numhl, 'Show word diff')
	map('nl', gitsigns.toggle_linehl, 'Show word diff')
	map('nb', gitsigns.toggle_current_line_blame, 'Show word diff')
	-- map('qf', gitsigns.setqflist, 'set qf list')
	map('qf', gitsigns.setloclist, 'set qf list')

	map('j', gitsigns.next_hunk, 'Next hunk')
	map('k', gitsigns.prev_hunk, 'Previous hunk')
	map('b', gitsigns.blame_line, 'git Blame')

	-- map('K', gitsigns.preview_hunk)
	map('K', gitsigns.preview_hunk_inline, 'Preview hunk')
	map('d', gitsigns.diffthis, 'Diff file')

	map('v', gitsigns.select_hunk, 'Select hunk')

	map('ss', gitsigns.stage_hunk, 'Stage hunk')
	map('sb', gitsigns.stage_buffer, 'Stage buffer')
	map('su', gitsigns.undo_stage_hunk, 'Undo last stage hunk')

	-- map('rh', gitsigns.reset_hunk, 'reset hunk')
	-- map('rb', gitsigns.reset_buffer, 'reset buffer')
	-- map('rB', gitsigns.reset_buffer_index, 'reset buffer')

	require('gitsigns').setup {
		--stylua: ignore
		signs = {
			add =          { hl = 'GitSignsAdd',    text = '│', numhl = 'GitSignsAddNr',    linehl = 'GitSignsAddLn', },
			untracked =    { hl = 'GitSignsAdd',    text = '│', numhl = 'GitSignsAddNr',    linehl = 'GitSignsAddLn', },
			change =       { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn', },
			delete =       { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn', },
			topdelete =    { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn', },
			changedelete = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn', },
			-- add =          { hl = 'GitSignsAdd',    text = '│', numhl = 'GitSignsAddNr',    linehl = 'GitSignsAddLn', },
			-- untracked =    { hl = 'GitSignsAdd',    text = '┆', numhl = 'GitSignsAddNr',    linehl = 'GitSignsAddLn', },
			-- change =       { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn', },
			-- delete =       { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn', },
			-- topdelete =    { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn', },
			-- changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn', },
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 10000, -- Disable if file is longer than this (in lines)
		preview_config = {
			-- Options passed to nvim_open_win
			border = 'rounded',
			style = 'minimal',
			relative = 'cursor',
			row = 0,
			col = 1,
		},
		yadm = {
			enable = false,
		},
	}
end

return M
