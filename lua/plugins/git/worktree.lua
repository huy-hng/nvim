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

	local tele = require('telescope')
	local layouts = require('plugins.editor.telescope.layouts')
	local map = Map.new('<leader>g', nil, 'Worktree')

	map.n('w', {
		tele.extensions.git_worktree.git_worktrees,
		layouts.vert_list_normal,
	}, 'Switch worktrees')

	wt.on_tree_change(function(op, metadata)
		if op == wt.Operations.Switch then
			print('Switched from ' .. metadata.prev_path .. ' to ' .. metadata.path)
		end
	end)
end

return M
