---@diagnostic disable: param-type-mismatch

local functions = require('neovide.functions')
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

	Nmap('<C-!>', resize(pairs[1]))
	Nmap('<C-@>', resize(pairs[2]))
	Nmap('<C-#>', resize(pairs[3]))
	Nmap('<C-$>', resize(pairs[4]))
	Nmap('<C-%>', resize(pairs[5]))
	Nmap('<C-^>', resize(pairs[6]))
	Nmap('<C-&>', resize(pairs[7]))
	Nmap('<C-*>', resize(pairs[8]))
	Nmap('<C-(>', resize(pairs[9]))
end
-- test_sizes()
