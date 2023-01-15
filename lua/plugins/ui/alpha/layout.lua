local utils = require('plugins.ui.alpha.utils')
local comp = require('plugins.ui.alpha.components')

local quotes = require('plugins.ui.alpha.customization.quotes')
local sessions = require('plugins.ui.alpha.possession')

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

-- button('SPC f f', '  Find file'),
-- button('SPC f h', '  Recently opened files'),
-- button('SPC f r', '  Frecency/MRU'),
-- button('SPC f g', '  Find word'),
-- button('SPC f m', '  Jump to bookmarks'),
-- button('SPC s l', '  Open last session'),

local startify = require('alpha.themes.startify')

require('plugins.ui.alpha.recent_files')

-- TODO: show startup time

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
	-- P(stats)

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

			comp.header(),
			comp.padding(2),

			comp.divider(' Session Management '),
			comp.padding(1),

			require('plugins.ui.alpha.session_manager'),
			comp.padding(1),

			comp.divider('Actions'),
			comp.padding(1),
			-- comp.group_name('Actions'),
			comp.group({
				comp.button('  New file', 'e', vim.cmd.enew, nil, { cursor = 5 }),
				comp.button('  Quit', 'q', Util.quit_last_buffer, nil, { cursor = 5 }),
			}, 1),

			comp.padding(1),

			-- comp.text('Plugins installed: ' .. lazy_stats.count, 'Comment'),
			comp.divider(' Stats ', nil, 'Comment'),
			comp.padding(1),

			comp.group(lazy_stats),

			-- require('plugins.ui.alpha.recent_files'),
			comp.padding(2),
			comp.footer(),
		},
	},
	opts = {
		margin = 0,
		-- setup = function()
		-- end,
		noautocmd = false,
	},
}
