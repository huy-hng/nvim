local g = vim.g

--===============================================================================
--                                 |=> GUI <=|
--===============================================================================

-- manjaro
g.neovide_refresh_rate = 120
g.gui_font_default_size = 10

local handle = io.popen('hostname')
local result
if handle then
	result = handle:read('*a')
	result = result:gsub('[%p%c%s]', '')
	handle:close()
end

if result == 'penguin' then
	-- chromebook
	g.neovide_refresh_rate = 60
	g.gui_font_default_size = 13
end

-----------------------------------------
--             -> Looks <-
-----------------------------------------

g.neovide_fullscreen = true
g.neovide_profiler = false

g.neovide_transparency = 1
g.neovide_floating_blur_amount_x = 6.0
g.neovide_floating_blur_amount_y = 6.0
-- go.winblend = 100
-- go.pumblend = 30
-- g.transparency = 1
-- g.neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))

g.gui_font_face = 'Cascadia Code'
g.gui_font_default_size = 13
g.gui_font_face = 'FiraCode Nerd Font'
g.gui_font_default_size = 12

-----------------------------------------
--             -> Sizes <-
-----------------------------------------
g.neovide_underline_automatic_scaling = true
g.neovide_scale_factor = 1.0
g.gui_font_size = g.gui_font_default_size

-----------------------------------------
--           -> Behavior <-
-----------------------------------------
g.neovide_refresh_rate_idle = 15
g.neovide_confirm_quit = true
g.neovide_remember_window_size = true
g.neovide_scroll_animation_length = 0.4
g.neovide_hide_mouse_when_typing = true

g.neovide_touch_deadzone = 100
g.neovide_touch_drag_timeout = 0.3

-- g.neovide_no_idle = true " not sure if this helps with anything

-----------------------------------------
--            -> Cursor <-
-----------------------------------------
g.neovide_cursor_animation_length = 0
g.neovide_cursor_trail_size = 0
g.neovide_cursor_animation_length = 0.02 -- 0.13
g.neovide_cursor_trail_size = 0.2 -- 0.8
-- g.neovide_cursor_antialiasing = false
g.neovide_cursor_antialiasing = true

-- g.neovide_cursor_vfx_mode = 'pixiedust'
g.neovide_cursor_vfx_mode = ''
g.neovide_cursor_vfx_opacity = 150.0
g.neovide_cursor_vfx_particle_lifetime = 0.5
g.neovide_cursor_vfx_particle_density = 5.0
g.neovide_cursor_vfx_particle_speed = 50.0

--==============================================================================
--                          |=> Extra Functions <=|
--==============================================================================
local refresh_gui_font = function()
	vim.o.guifont = string.format('%s:h%s', vim.g.gui_font_face, vim.g.gui_font_size)
end

local resize_gui_font = function(delta)
	g.gui_font_size = g.gui_font_size + delta
	refresh_gui_font()
end

local reset_gui_font = function()
	g.gui_font_size = g.gui_font_default_size
	refresh_gui_font()
end

reset_gui_font()

--===============================================================================
--                               |=> Keymaps <=|
--===============================================================================

nmap('<Tab>', '>>')
nmap('<S-Tab>', '<<')
-- nmap('<C-S-Tab>', 'this works')

--==============================================================================
--                 |=> Compatibility & Neovide Functions <=|
--==============================================================================
icmap('<C-BS>', '<C-w>')
nmap('<C-CR>', 'o<esc>')

nmap('<C-_>', FN(resize_gui_font, -0.5))
nmap('<C-+>', FN(resize_gui_font, 0.5))
nmap('<C-)>', reset_gui_font)
-- nmap('<C-_>', '<C-_>')
