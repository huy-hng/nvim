local g = vim.g
local go = vim.go

--==============================================================================
--                      |=> Setup specific Settings <=|
--==============================================================================

local function get_hostname()
	local handle = io.popen('hostname')
	local result
	if handle then
		result = handle:read('*a')
		result = result:gsub('[%p%c%s]', '')
		handle:close()
	end
	return result
end

local function manjaro()
	g.neovide_refresh_rate = 120
	g.gui_font_default_size = 11
	g.neovide_scale_factor = 1.0
end

local function chromebook()
	g.neovide_refresh_rate = 59

	g.gui_font_default_size = 11
	g.neovide_scale_factor = 1.0
end

g.gui_font_face = 'FiraCode Nerd Font'
g.gui_font_face = 'CaskaydiaCove Nerd Font'

if get_hostname() == 'huystower' then
	manjaro()
else
	chromebook()
end

-----------------------------------------
--             -> Looks <-
-----------------------------------------

go.winblend = 66
go.pumblend = 50

g.neovide_fullscreen = true
g.neovide_profiler = false

g.neovide_transparency = 1
local blur_amount = 7
g.neovide_floating_blur_amount_x = blur_amount
g.neovide_floating_blur_amount_y = blur_amount

-- g.neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

-----------------------------------------
--             -> Sizes <-
-----------------------------------------
g.neovide_underline_automatic_scaling = true
g.gui_font_size = g.gui_font_default_size

--==============================================================================
--                              |=> Behavior <=|
--==============================================================================

g.neovide_refresh_rate_idle = 15
g.neovide_confirm_quit = true
g.neovide_remember_window_size = true
g.neovide_scroll_animation_length = 0.4
g.neovide_hide_mouse_when_typing = true

g.neovide_touch_deadzone = 100
g.neovide_touch_drag_timeout = 0.3

-- g.neovide_no_idle = true -- not sure if this helps with anything

--==============================================================================
--                               |=> Cursor <=|
--==============================================================================

g.neovide_cursor_animation_length = 0.02
g.neovide_cursor_trail_size = 0.2
g.neovide_cursor_animation_length = 0.03 -- 0.13
g.neovide_cursor_trail_size = 0.5 -- 0.8
g.neovide_cursor_antialiasing = true

--==============================================================================
--                             |=> Animation <=|
--==============================================================================

-- railgun | torpedo | pixiedust | sonicboom | ripple | wireframe
g.neovide_cursor_vfx_mode = 'pixiedust'
g.neovide_cursor_vfx_opacity = 200 -- 200
g.neovide_cursor_vfx_particle_lifetime = 1.2 -- 1.2
g.neovide_cursor_vfx_particle_density = 10 -- 7
g.neovide_cursor_vfx_particle_speed = 10 -- 10

-- only for railgun
g.neovide_cursor_vfx_particle_phase = 1.5 -- 1.5
g.neovide_cursor_vfx_particle_curl = 0.1 -- 1.0

--==============================================================================
--                          |=> Extra Functions <=|
--==============================================================================
local function refresh_gui_font()
	vim.o.guifont = string.format('%s:h%s', vim.g.gui_font_face, vim.g.gui_font_size)
end

local function resize_gui_font(delta)
	g.gui_font_size = g.gui_font_size + delta
	print('Font Size: ', g.gui_font_size)
	refresh_gui_font()
end

local function reset_gui_font()
	g.gui_font_size = g.gui_font_default_size
	refresh_gui_font()
end

reset_gui_font()

nmap('<C-_>', FN(resize_gui_font, -0.5))
nmap('<C-+>', FN(resize_gui_font, 0.5))
nmap('<C-)>', reset_gui_font)

local function resize_scale(delta, absolute)
	if absolute ~= nil then
		print('Scale: ', absolute)
		g.neovide_scale_factor = absolute
		return
	end
	print('Scale: ', g.neovide_scale_factor + delta)
	g.neovide_scale_factor = g.neovide_scale_factor + delta
end
nmap('<C-{>', FN(resize_scale, -0.05))
nmap('<C-}>', FN(resize_scale, 0.05))
nmap('<C-|>', FN(resize_scale, 0, 1.0))

--==============================================================================
--                       |=> Find Font Size + Scale <=|
--==============================================================================

local function resize(scales)
	local function resizer()
		g.gui_font_size = scales[1]

		refresh_gui_font()
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

	nmap('<C-!>', resize(pairs[1]))
	nmap('<C-@>', resize(pairs[2]))
	nmap('<C-#>', resize(pairs[3]))
	nmap('<C-$>', resize(pairs[4]))
	nmap('<C-%>', resize(pairs[5]))
	nmap('<C-^>', resize(pairs[6]))
	nmap('<C-&>', resize(pairs[7]))
	nmap('<C-*>', resize(pairs[8]))
	nmap('<C-(>', resize(pairs[9]))
end
-- test_sizes()
