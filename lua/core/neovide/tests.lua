---@diagnostic disable: param-type-mismatch

local functions = require('core.neovide.functions')
local g = vim.g

local function resize(scales)
	local function resizer()
		g.gui_font_size = scales[1]

		functions.refresh_gui_font()
		g.neovide_scale_factor = scales[2]
	end
	return function()
		resizer()
		vim.defer_fn(resizer, 50)
	end
end

local function test_sizes()
	local pairs = {}
	table.insert(pairs, { 10.5, 1.0 })
	table.insert(pairs, { 11, 0.95 })
	table.insert(pairs, { 9.3, 1.1 })
	table.insert(pairs, { 10.0, 1.1 })
	table.insert(pairs, { 10.25, 1.025 })
	table.insert(pairs, { 10.25, 1.025 })
	table.insert(pairs, { 10.25, 1.025 })
	table.insert(pairs, { 10.25, 1.025 })

	Map.n('<C-!>', resize(pairs[1]))
	Map.n('<C-@>', resize(pairs[2]))
	Map.n('<C-#>', resize(pairs[3]))
	Map.n('<C-$>', resize(pairs[4]))
	Map.n('<C-%>', resize(pairs[5]))
	Map.n('<C-^>', resize(pairs[6]))
	Map.n('<C-&>', resize(pairs[7]))
	Map.n('<C-*>', resize(pairs[8]))
	Map.n('<C-(>', resize(pairs[9]))
end
-- test_sizes()
