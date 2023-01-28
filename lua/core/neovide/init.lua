if not vim.g.has_neovide then return end

local os_fn = require('core.neovide.os_functions')
local functions = require('core.neovide.functions')

local g = vim.g
g.neovide_profiler = false

require('core.neovide.mappings')
require('core.neovide.options')

local function manjaro()
	g.neovide_refresh_rate = 240

	g.neovide_refresh_rate_idle = 120
	g.neovide_default_transparency = 0.8

	-- o.winblend = 0
	-- o.pumblend = 0
	nvim.schedule(os_fn.toggle_blur_on_kde, true)
end

local function chromebook()
	g.neovide_refresh_rate = 60
	g.neovide_default_transparency = 1
	g.neovide_default_transparency = 0.85
	g.gui_font_default_size = 11.5
end

local function post_init()
	local device = os_fn.get_hostname() == 'huystower' and manjaro or chromebook
	device()

	g.neovide_transparency = g.neovide_default_transparency
	functions.reset_gui_font()
	functions.change_window_opacity(g.neovide_transparency, 0, true)
end

post_init()

-- turn off when multigrid is enabled since it causes lag for some reason
-- Exec('TSContextDisable')
