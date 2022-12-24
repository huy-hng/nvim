local os_fn = require('neovide.os_functions')

local g = vim.g

local M = {}

M.refresh_gui_font = function() --
	vim.o.guifont = string.format('%s:h%s', vim.g.gui_font_face, vim.g.gui_font_size)
end

M.resize_gui_font = function(delta)
	g.gui_font_size = g.gui_font_size + delta
	-- print('Font Size: ', g.gui_font_size)
	M.refresh_gui_font()
end

M.reset_gui_font = function()
	g.gui_font_size = g.gui_font_default_size
	M.refresh_gui_font()
end

M.toggle_fonts = function()
	if g.gui_font_face == 'FiraCode Nerd Font' then
		g.gui_font_face = 'CaskaydiaCove Nerd Font'
		g.gui_font_default_size = 10
	else
		g.gui_font_face = 'FiraCode Nerd Font'
		g.gui_font_default_size = 10
	end
	M.reset_gui_font()
end

Nmap('<C-|>', M.toggle_fonts)

M.resize_scale = function(delta, absolute)
	if absolute ~= nil then
		-- print('Scale: ', absolute)
		g.neovide_scale_factor = absolute
		return
	end
	-- print('Scale: ', g.neovide_scale_factor + delta)
	g.neovide_scale_factor = g.neovide_scale_factor + delta
end

-- steps should be between 0.0 and 1.0
local function linear_distribution(beginning, ending, ratio)
	-- local rounder = if ratio > 0.5 then math.ceil  else math.floor end
	local rounder = ratio > 0.5 and math.ceil or math.floor
	return rounder((ending - beginning) * ratio)
end

M.change_window_opacity = function(value, speed, absolute)
	speed = speed or 10
	local max_winblend = 75
	local max_pumblend = 50

	local new_transparency
	if absolute then
		new_transparency = value
	else
		new_transparency = g.neovide_transparency + value
	end
	new_transparency = math.clamp(new_transparency, 0, 1)

	local new_winblend = linear_distribution(0, max_winblend, new_transparency)
	local new_pumblend = linear_distribution(0, max_pumblend, new_transparency)

	os_fn.animate_transparency_change(new_transparency, new_winblend, new_pumblend, speed)
end

return M
