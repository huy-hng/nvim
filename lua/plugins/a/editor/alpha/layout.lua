local comp = require('plugins.editor.alpha.components')
local custom = require('plugins.editor.alpha.customization.components')
local sessions = require('plugins.editor.alpha.session_manager')
-- P(recent_files)

local terminal = {
	type = 'terminal',
	command = 'kitty',
	width = 69,
	height = 8,
	opts = {
		redraw = true,
		window_config = {},
	},
}

local function lazy_stats(prefix, stat)
	local stats = require('lazy').stats()

	local example_result = {
		-- startuptime in milliseconds till UIEnter
		startuptime = 0,
		real_cputime = false,
		count = 0, -- total number of plugins
		loaded = 0, -- number of loaded plugins
		---@type table<string, number>
		times = {},
	}

	return {
		comp.text('Startup Time: ' .. math.round(stats.startuptime, 1) .. 'ms', 'Comment'),
		comp.padding(1),
		comp.text('Plugins installed: ' .. stats.count, 'Comment'),
		comp.text('Plugins loaded: ' .. stats.loaded, 'Comment'),
	}
end

return {
	layout = {
		-- terminal,
		comp.group {
			comp.padding(1),

			custom.header(),
			comp.padding(2),

			comp.padding(1),

			comp.group(sessions),
			comp.padding(1),

			comp.divider(' Actions '),
			comp.padding(1),

			comp.group({
				comp.keymap('  New file', 'w', vim.cmd.enew, nil, { cursor = 3 }),
				comp.keymap('  Quit', 'q', Util.quit_last_buffer, nil, { cursor = 3 }),
			}, 1),

			-- comp.group(recent_files),
			comp.padding(1),

			comp.divider(' Stats ', nil, 'NonText'),
			comp.padding(1),

			comp.group(custom.plugin_stats),

			comp.padding(2),
			custom.footer(),
		},
	},
	opts = {
		margin = 0,
		noautocmd = true,

		-- nil | string | string[]: key combinations used to press an item.
		press = '<CR>',
		-- nil | string | string[]: key combination used to select an item to press later.
		press_queue = '<M-CR>',
	},
}
