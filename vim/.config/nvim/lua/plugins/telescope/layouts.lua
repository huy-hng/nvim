local M = {}

local vertical_list = function()
	return {
		results_title = false,

		path_display = { 'smart' },
		sorting_strategy = 'ascending',
		layout_strategy = 'center',
		initial_mode = 'normal',
		layout_config = {
			preview_cutoff = 1, -- Preview should always show (unless previewer = false)
			prompt_position = 'top',
			anchor = 'S',

			height = 0.5,
			width = function(_, max_columns, _)
				local third = math.floor(max_columns / 3)
				return math.clamp(third, max_columns, 100)
				-- return math.min(max_columns, math.max(80, third))
			end,

			-- preview_height = 0.4,
		},

		border = true,
		borderchars = {
			prompt = { '─', '│', '─', '│', '╭', '╮', '┤', '├' },
			results = { '─', '│', '─', '│', '├', '┤', '╯', '╰' },
			preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		},
	}
end

M.vert_list_insert = vertical_list()
M.vert_list_insert.initial_mode = 'insert'

M.vert_list_normal = vertical_list()
M.vert_list_normal.initial_mode = 'normal'

M.dropdown = {
	results_title = false,

	path_display = { 'smart' },
	sorting_strategy = 'ascending',
	layout_strategy = 'vertical',
	-- anchor = 'NE',
	layout_config = {
		-- preview_cutoff = 1, -- Preview should always show (unless previewer = false)
		prompt_position = 'top',

		width = function(_, max_columns, _)
			local third = math.floor(max_columns / 3)
			-- print(third)
			return math.min(max_columns, math.max(60, third))
		end,

		height = 0.5,
		preview_height = 0.4,
		-- height = function(_, _, max_lines)
		-- 	print(max_lines)
		-- 	-- return math.min(max_lines, 20)
		-- 	return 0.9
		-- end,
	},

	border = true,
	borderchars = {
		prompt = { '─', '│', '─', '│', '╭', '╮', '┤', '├' },
		results = { ' ', '│', '─', '│', '│', '│', '╯', '╰' },
		preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
	},
}

M.center = {
	results_title = false,

	path_display = { 'smart' },
	sorting_strategy = 'ascending',
	layout_strategy = 'center',
	-- anchor = 'NE',
	layout_config = {
		-- preview_cutoff = 1, -- Preview should always show (unless previewer = false)
		prompt_position = 'top',

		width = function(_, max_columns, _)
			local third = math.floor(max_columns / 3)
			-- print(third)
			return math.min(max_columns, math.max(60, third))
		end,

		height = 0.5,
		-- height = function(_, _, max_lines)
		-- 	print(max_lines)
		-- 	-- return math.min(max_lines, 20)
		-- 	return 0.9
		-- end,
	},

	border = true,
	borderchars = {
		prompt = { '─', '│', '─', '│', '╭', '╮', '┤', '├' },
		results = { '─', '│', '─', '│', '├', '┤', '╯', '╰' },
		preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
	},
}

M.cursor = {
	results_title = false,

	layout_strategy = 'cursor',
	layout_config = {
		height = 0.4,
		-- preview_cutoff = 40,
		width = function(_, max_columns, _)
			-- print(max_columns)
			return 120
		end,
		-- preview_width = 0.5,
	},

	border = true,
	borderchars = {
		prompt = { '─', '│', '─', '│', '╭', '╮', '┤', '├' },
		results = { '─', '│', '─', '│', '├', '┤', '╯', '╰' },
		preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
	},
}

M.ivs = {
	results_title = false,

	sorting_strategy = 'ascending',

	layout_strategy = 'bottom_pane',
	layout_config = {
		height = 25,
	},

	border = true,
	borderchars = {
		prompt = { '─', ' ', ' ', ' ', '─', '─', ' ', ' ' },
		results = { ' ' },
		preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
	},
}

M.find_files_old = {
	layout_strategy = 'horizontal',
	sorting_strategy = 'ascending',
	initial_mode = 'insert', -- normal
	layout_config = {
		height = 0.8,
		-- preview_cutoff = 120,
		prompt_position = 'top',
		-- width = function(_, max_columns, _)
		-- 	local third = math.floor(max_columns * (2 / 3))
		-- 	print(third)
		-- 	-- return -1
		-- 	return math.min(max_columns, math.max(60, third))
		-- end,
		width = {
			2000,
			padding = 0.33,
		},
		anchor = 'S',
		preview_width = 0.5,
		-- preview_width = function(_, max_columns, _)
		-- 	local preview_cols = math.floor(max_columns * (2 / 3))
		-- 	print(max_columns, preview_cols)
		-- 	-- return -80
		-- 	return preview_cols
		-- end,
	},
}

return M
