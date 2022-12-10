local os_fn = require('neovide.os_functions')
local functions = require('neovide.functions')

local g = vim.g
local o = vim.o

require('neovide.mappings')
require('neovide.options')

g.neovide_profiler = false

local function manjaro()
	g.neovide_refresh_rate = 119
	g.neovide_default_transparency = 0.7

	o.winblend = 0
	o.pumblend = 0
	Schedule(os_fn.toggle_blur_on_kde, true)
end

local function chromebook()
	g.neovide_refresh_rate = 59
	g.neovide_default_transparency = 1
end

local function post_init()
	if os_fn.get_hostname() == 'huystower' then
		manjaro()
	else
		chromebook()
	end

	g.neovide_transparency = g.neovide_default_transparency
	functions.reset_gui_font()
end

post_init()
