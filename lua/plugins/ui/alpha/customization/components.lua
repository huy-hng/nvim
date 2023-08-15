local utils = require('plugins.ui.alpha.utils')
local config = require('plugins.ui.alpha.config')
local comp = require('plugins.ui.alpha.components')
local headers = require('plugins.ui.alpha.customization.headers')
local fortune = require('alpha.fortune')
local ascii_art = require('plugins.ui.alpha.customization.ascii_art')

local M = {}

function M.header()
	local header = utils.get_random_element(headers)

	local hl = {}
	for _ = 1, #header do
		table.insert(hl, { { 'Type', 0, -1 } })
	end

	-- return comp.text(header, hl)
	return comp.text(header, 'Type', nil, false)
end

function M.plugin_stats()
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
	local lines, hls = utils.hl_arr {
		{
			{ 'Startup Time: ', 'Comment' },
			{ math.round(stats.startuptime, 1), 'white2' },
			{ ' ms', 'gray3' },
		},
		{},
		{
			{ 'Plugins installed: ', 'Comment' },
			{ stats.count, 'white2' },
		},
		{
			{ 'Plugins loaded:    ', 'Comment' },
			{ stats.loaded, 'white2' },
		},
	}

	return { comp.text(lines, hls) }
end

function M.footer()
	local art = utils.get_random_element(ascii_art)

	-- for _, v in ipairs(fortune()) do
	-- 	table.insert(footer_text, v)
	-- end
	return comp.group {
		comp.text(art, config.footer_hl),
		comp.text(fortune(), config.quote_hl),
	}
end

return M
