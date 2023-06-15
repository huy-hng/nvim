local M = {
	'lewis6991/gitsigns.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

function M.config()
	local gitsigns = require('gitsigns')

	-- local map = Map.create('n', '<leader>g', '[Gitsigns]')
	-- map('nd', gitsigns.toggle_deleted, 'Show deleted lines')
	-- map('nw', gitsigns.toggle_word_diff, 'Show word diff')
	-- map('ns', gitsigns.toggle_signs, 'Show word diff')
	-- map('nn', gitsigns.toggle_numhl, 'Show word diff')
	-- map('nl', gitsigns.toggle_linehl, 'Show word diff')
	-- map('nb', gitsigns.toggle_current_line_blame, 'Show word diff')
	-- -- map('qf', gitsigns.setqflist, 'set qf list')
	-- map('qf', gitsigns.setloclist, 'set qf list')

	-- map('j', gitsigns.next_hunk, 'Next hunk')
	-- map('k', gitsigns.prev_hunk, 'Previous hunk')
	-- map('b', gitsigns.blame_line, 'git Blame')

	-- -- map('K', gitsigns.preview_hunk)
	-- map('K', gitsigns.preview_hunk_inline, 'Preview hunk')
	-- map('d', gitsigns.diffthis, 'Diff file')

	-- map('v', gitsigns.select_hunk, 'Select hunk')

	-- map('ss', gitsigns.stage_hunk, 'Stage hunk')
	-- map('sb', gitsigns.stage_buffer, 'Stage buffer')
	-- map('su', gitsigns.undo_stage_hunk, 'Undo last stage hunk')

	-- map('rh', gitsigns.reset_hunk, 'reset hunk')
	-- map('rb', gitsigns.reset_buffer, 'reset buffer')
	-- map('rB', gitsigns.reset_buffer_index, 'reset buffer')

	gitsigns.setup {
		-- on_attach = function(bufnr)
		-- 	local gs = package.loaded.gitsigns

		-- 	local map = Map.create('n', '<leader>g', '[Gitsigns]', { buffer = bufnr })

		-- 	-- Navigation
		-- 	map(']c', function()
		-- 		if vim.wo.diff then return ']c' end
		-- 		vim.schedule(function() gs.next_hunk() end)
		-- 		return '<Ignore>'
		-- 	end, { expr = true })

		-- 	map('[c', function()
		-- 		if vim.wo.diff then return '[c' end
		-- 		vim.schedule(function() gs.prev_hunk() end)
		-- 		return '<Ignore>'
		-- 	end, { expr = true })

		-- 	-- Actions
		-- 	map('s', gs.stage_hunk)
		-- 	map('r', gs.reset_hunk)

		-- 	-- visual mode
		-- 	-- map( 's', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
		-- 	-- map( 'r', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)

		-- 	map('S', gs.stage_buffer)
		-- 	map('u', gs.undo_stage_hunk)
		-- 	map('R', gs.reset_buffer)
		-- 	map('p', gs.preview_hunk)
		-- 	map('b', function() gs.blame_line { full = true } end)
		-- 	map('b', gs.toggle_current_line_blame)
		-- 	map('d', gs.diffthis)
		-- 	map('D', function() gs.diffthis('~') end)
		-- 	map('d', gs.toggle_deleted)

		-- 	-- Text object
		-- 	-- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		-- end,
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
