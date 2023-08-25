local M = {
	'ThePrimeagen/git-worktree.nvim',
	event = 'VeryLazy',
}

function M.config()
	local wt = require('git-worktree')
	wt.setup {
		change_directory_command = 'cd',
		update_on_change = true,
		update_on_change_command = 'e .',
		clearjumps_on_change = true,
		autopush = false,
	}

	-- local map = Map.create('n', '<leader>g', 'Worktree')
	-- map('')
end

return M
