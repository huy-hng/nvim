if not vim.g.has_neovide then return end

require('core.neovide.options')
require('core.neovide.mappings')

local os_fn = require('core.neovide.os_functions')
local functions = require('core.neovide.functions')

local g = vim.g
g.neovide_profiler = false

local function manjaro()
	g.neovide_refresh_rate = 240

	g.neovide_refresh_rate_idle = 120
	g.neovide_default_transparency = 0.8
	g.gui_font_default_size = 11

	-- o.winblend = 0
	-- o.pumblend = 0
	nvim.schedule(os_fn.toggle_blur_on_kde, true)
end

local function arch_chromebook()
	g.neovide_refresh_rate = 60
	g.neovide_default_transparency = 0.75
	g.gui_font_default_size = 11

	nvim.schedule(os_fn.toggle_blur_on_kde, true)
end

local function chromebook()
	g.neovide_refresh_rate = 60
	g.neovide_default_transparency = 1
	g.neovide_default_transparency = 0.85
	g.gui_font_default_size = 11
end

local function override_list_ui_function()
	local list_uis = vim.api.nvim_list_uis
	---@diagnostic disable-next-line: duplicate-set-field
	vim.api.nvim_list_uis = function()
		local uis = list_uis()
		for _, ui in ipairs(uis) do
			ui.ext_multigrid = false
		end
		return uis
	end
end

local function post_init()
	local hostname = os_fn.get_hostname()

	local device = hostname == 'huystower' or hostname == 'arch' and manjaro or chromebook
	if hostname == 'huystower' then
		manjaro()
	elseif hostname == 'arch' then
		arch_chromebook()
	else
		chromebook()
	end

	g.neovide_transparency = g.neovide_default_transparency
	functions.reset_gui_font()
	functions.change_window_opacity(g.neovide_transparency, 0, true)
end

post_init()
override_list_ui_function()

-- turn off when multigrid is enabled since it causes lag for some reason
-- Exec('TSContextDisable')
