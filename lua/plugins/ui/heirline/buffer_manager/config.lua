local utils = require('plugins.ui.heirline.buffer_manager.utils')
local filename = require('plugins.ui.heirline.buffer_manager.filename')

local M = {}
M.config = {}

function M.init(user_config) --
	M.config = utils.merge_tables(M.default_config, user_config or {})
end

local sorting_functions = {
	alphabet = {
		function(a, b)
			if not a or not b then return false end
			-- return filename.get_short_file_name(a.filename) < filename.get_short_file_name(b.filename)
			return a.filename < b.filename
		end,
		key = 'a',
	},
	bufnr = {
		function(a, b) return a.bufnr < b.bufnr end,
		key = 'r',
	},
}

M.default_config = {
	line_keys = '1234567890',
	select_menu_item_commands = {
		edit = '<CR>',
	},
	sorting = {
		functions = sorting_functions,
	},
	height = 20,
	width = 80,
	focus_alternate_buffer = false,
	short_file_names = false,
	cursorline = true,
	short_term_names = false,
	highlight = 'Float',
	-- borderchars = { '─', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
	borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
	-- highlight = 'Normal',
	-- width = 0.5,
	-- height = 0.5
}

return M
