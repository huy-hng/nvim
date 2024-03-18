local M = {
	'epwalsh/obsidian.nvim',
	version = '*', -- recommended, use latest release instead of latest commit
	event = 'VeryLazy',
	-- ft = 'markdown',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
}

function M.config()
	require('obsidian').setup {
		workspaces = {
			{
				name = 'personal',
				path = '~/personal/Notes',
			},
		},

		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = 'daily_notes',
			-- Optional, if you want to change the date format for the ID of daily notes.
			-- date_format = '%Y-%m-%d',
			-- Optional, if you want to change the date format of the default alias of daily notes.
			-- alias_format = '%B %-d, %Y',
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			-- template = nil,
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Set to false to disable completion.
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},

		-- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
		-- way then set 'mappings = {}'.
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			[Keys.g .. 'f'] = {
				action = function() return require('obsidian').util.gf_passthrough() end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			['<C-space>'] = {
				action = function() return require('obsidian').util.toggle_checkbox() end,
				opts = { buffer = true },
			},
		},

		-- Where to put new notes. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = 'notes_subdir',
	}
end

return M
