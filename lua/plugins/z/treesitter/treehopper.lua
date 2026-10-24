local M = {
	'mfussenegger/nvim-treehopper',
	event = 'VeryLazy',
	dependencies = 'phaazon/hop.nvim',
}

function M.config()
	local treehopper = require('tsht')

	-- omap('m', treehopper.nodes)
	-- xmap('m', treehopper.nodes)

	local hop = require('hop')

	hop.setup()

	-- place this in one of your configuration file(s)
	local directions = require('hop.hint').HintDirection
	-- map('', 'f', FN(hop.hint_char1, { direction = directions.AFTER_CURSOR, current_line_only = false }))
	-- map('', 'F', FN(hop.hint_char1, { direction = directions.BEFORE_CURSOR, current_line_only = false }))
	-- map('', 't', FN(hop.hint_char1, { direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = -1 }))
	-- map('', 'T', FN(hop.hint_char1, { direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 }))
end

return M
