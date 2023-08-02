local M = {
	'lewis6991/gitsigns.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	event = 'VeryLazy',
}

function M.config()
	local gs = require('gitsigns')
	-- local map = Map.create('n', '<leader>g', '[Gitsigns]')
	local meta = Map.meta('Git Mode', { buffer = true })

	meta:map_enter('n', '<C-g>')
	meta:map_exit('n', { 'q', '<esc>', '<C-g>' })

	-- Navigation
	meta:n(Keys.j, gs.next_hunk, 'Next hunk')
	meta:n(Keys.k, gs.prev_hunk, 'Previous hunk')
	meta:n(Keys.K, gs.preview_hunk_inline)

	-- Actions
	meta:n(Keys.y, gs.stage_hunk, 'Stage Hunk')
	meta:n(Keys.Y, gs.stage_buffer, 'Stage Buffer')

	meta:n(Keys.u, gs.undo_stage_hunk, 'Undo Stage Hunk')
	meta:n(Keys.V, gs.select_hunk, 'Select Hunk')

	meta:n(Keys.D, gs.reset_hunk, 'Reset Hunk')

	-- comparisons
	meta:n('b', gs.toggle_current_line_blame)

	meta:n('d', gs.diffthis)
	meta:n('D', function() gs.diffthis('~') end)

	meta:n('d', gs.toggle_deleted)

	-- local map = Map.create('n', '<leader>g', '[Gitsigns]')

	gs.setup {
		on_attach = function(bufnr)
			local map = Map.create('n', '<leader>g', '[Gitsigns]', { buffer = bufnr })

			map(Keys.v, gs.select_hunk, 'Select hunk')

			map('td', gs.toggle_deleted, 'Show deleted lines')
			map('tw', gs.toggle_word_diff, 'Show word diff')
			map('tb', gs.toggle_current_line_blame, 'Show word diff')
			map('l', gs.setloclist, 'set qf list')

			map(Keys.j, gs.next_hunk, 'Next hunk')
			map(Keys.k, gs.prev_hunk, 'Previous hunk')
			map(Keys.b, gs.blame_line, 'git Blame')

			map(Keys.K, gs.preview_hunk_inline, 'Preview hunk')
			map(Keys.c, gs.diffthis, 'Diff file')

			map(Keys.y, gs.stage_hunk, 'Stage hunk')
			map(Keys.Y, gs.stage_buffer, 'Stage buffer')
			map(Keys.u, gs.undo_stage_hunk, 'Undo last stage hunk')

			map('dh', gs.reset_hunk, 'reset hunk')
			map('db', gs.reset_buffer, 'reset buffer')
			map('dB', gs.reset_buffer_index, 'reset buffer')

			-- -- visual mode
			-- -- map( 's', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
			-- -- map( 'r', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
		end,
		--stylua: ignore
		signs = {
			add =          { hl = 'GitSignsAdd',    text = '│', numhl = 'GitSignsAddNr',    linehl = 'GitSignsAddLn', },
			untracked =    { hl = 'GitSignsAdd',    text = '│', numhl = 'GitSignsAddNr',    linehl = 'GitSignsAddLn', },
			change =       { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn', },
			delete =       { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn', },
			topdelete =    { hl = 'GitSignsDelete', text = '│', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn', },
			changedelete = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn', },
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
			title = 'Preview',
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
