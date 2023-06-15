local M = {
	'ckolkey/ts-node-action',
	dependencies = { 'nvim-treesitter' },
	opts = {},
	event = 'VeryLazy',
}

function M.config()
	local na = require('ts-node-action')
	na.setup()

	-- Map.n(Keys.localleader.n, na.node_action, 'Trigger TS Node Action')
	Map.n(Keys.ctrl.c, na.node_action, 'Trigger TS Node Action')

end

return M
