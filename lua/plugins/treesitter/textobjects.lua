local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects

local select = {
	enable = true,

	-- Automatically jump forward to textobj, similar to targets.vim
	lookahead = true,

	keymaps = {
		-- You can use the capture groups defined in textobjects.scm
		['yf'] = '@function.outer',
		['uf'] = '@function.inner',
		['yc'] = '@class.outer',
		['uc'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
	},
	-- You can choose the select mode (default is charwise 'v')
	--
	-- Can also be a function which gets passed a table with the keys
	-- * query_string: eg '@function.inner'
	-- * method: eg 'v' or 'o'
	-- and should return the mode ('v', 'V', or '<c-v>') or a table
	-- mapping query_strings to modes.
	selection_modes = {
		-- ['@parameter.outer'] = 'v', -- charwise
		-- ['@function.outer'] = 'V', -- linewise
		-- ['@class.outer'] = '<c-v>', -- blockwise
	},
	-- If you set this to `true` (default is `false`) then any textobject is
	-- extended to include preceding or succeeding whitespace. Succeeding
	-- whitespace has priority in order to act similarly to eg the built-in
	-- `ap`.
	--
	-- Can also be a function which gets passed a table with the keys
	-- * query_string: eg '@function.inner'
	-- * selection_mode: eg 'v'
	-- and should return true of false
	include_surrounding_whitespace = true,
}
local swap = {
	enable = true,
	swap_next = {
		['<leader>a'] = '@parameter.inner',
	},
	swap_previous = {
		['<leader>A'] = '@parameter.inner',
	},
}
local move = {
	enable = true,
	set_jumps = true, -- whether to set jumps in the jumplist
	goto_next_start = {
		[']a'] = { query = '@attribute.inner', desc = 'Next attribute' },
		[']b'] = { query = '@block.inner', desc = 'Next block' },
		[']c'] = { query = '@call.outer', desc = 'Next call' },
		[']fr'] = { query = '@frame.outer', desc = 'Next frame' },
		[']s'] = { query = '@statement.outer', desc = 'Next statement' },
		[']p'] = { query = '@parameter.inner', desc = 'Next paramter' },
		[']m'] = '@function.outer',
		[']]'] = { query = '@class.outer', desc = 'Next class start' },
	},
	goto_next_end = {
		[']M'] = '@function.outer',
		[']['] = '@class.outer',
	},
	goto_previous_start = {
		['[p'] = { query = '@parameter.inner', desc = 'Prev paramter' },
		['[a'] = { query = '@attribute.inner', desc = 'Prev attribute' },
		['[m'] = '@function.outer',
		['[['] = '@class.outer',
	},
	goto_previous_end = {
		['[M'] = '@function.outer',
		['[]'] = '@class.outer',
	},
}
local lsp_interop = {
	enable = true,
	border = 'solid',
	peek_definition_code = {
		['<leader>df'] = '@function.outer',
		['<leader>dF'] = '@class.outer',
	},
}

configs.setup {
	textobjects = {
		select = select,
		move = move,
		swap = swap,
		lsp_interop = lsp_interop,
	},
}

-- has .inner/.outer
-- @attribute
-- @block
-- @call
-- @class
-- @conditional
-- @frame
-- @function
-- @loop
-- @parameter

-- other
-- @comment.outer
-- @scopename.inner
-- @statement.outer
