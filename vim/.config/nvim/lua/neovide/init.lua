local os_fn = require('neovide.os_functions')
local functions = require('neovide.functions')

local g = vim.g
local go = vim.go

require('neovide.mappings')
require('neovide.options')

local function manjaro()
	g.neovide_refresh_rate = 119
	g.neovide_default_transparency = 0.7

	go.winblend = 0
	go.pumblend = 0
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
