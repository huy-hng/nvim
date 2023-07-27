---------------------------------------------Variables----------------------------------------------

local g = vim.g
local go = vim.go
local o = vim.o

--------------------------------------------Appearence----------------------------------------------

g.neovide_fullscreen = true

-- g.neovide_refresh_rate = 60
g.neovide_refresh_rate_idle = 15
go.winblend = 66
go.pumblend = 50

g.neovide_default_transparency = 1

local blur_amount = 7
g.neovide_floating_blur = true
g.neovide_floating_blur_amount_x = blur_amount
g.neovide_floating_blur_amount_y = blur_amount
-- g.gui_font_face = 'FiraCode Nerd Font' ->
g.gui_font_face = 'CaskaydiaCove Nerd Font'
-- g.gui_font_face = 'CaskaydiaCove NF'


-----------------------------------------------Sizes------------------------------------------------

g.neovide_scale_factor = 1.0
g.gui_font_default_size = 11
g.gui_font_size = g.gui_font_default_size

g.neovide_underline_automatic_scaling = false

---------------------------------------------Behavior-----------------------------------------------

g.neovide_no_idle = false -- not sure if this helps with anything
g.neovide_confirm_quit = true
g.neovide_remember_window_size = true
-- g.neovide_scroll_animation_length = 0.5 -- has been 0.4 most of the time
g.neovide_scroll_animation_length = 0.3

g.neovide_hide_mouse_when_typing = true

g.neovide_touch_deadzone = 100
g.neovide_touch_drag_timeout = 0.3

----------------------------------------------Cursor------------------------------------------------

-- g.neovide_cursor_animation_length = 0 -- 0.13
-- g.neovide_cursor_trail_size = 0 -- 0.8

g.neovide_cursor_animation_length = 0.03 -- 0.13
g.neovide_cursor_trail_size = 0.5 -- 0.8
g.neovide_cursor_antialiasing = true

---------------------------------------------Animation----------------------------------------------

-- railgun | torpedo | pixiedust | sonicboom | ripple | wireframe
-- g.neovide_cursor_vfx_mode = ''
g.neovide_cursor_vfx_mode = 'pixiedust'
g.neovide_cursor_vfx_opacity = 200 -- 200
g.neovide_cursor_vfx_particle_lifetime = 1.2 -- 1.2
g.neovide_cursor_vfx_particle_density = 10 -- 7
g.neovide_cursor_vfx_particle_speed = 10 -- 10

-- only for railgun
g.neovide_cursor_vfx_particle_phase = 1.5 -- 1.5
g.neovide_cursor_vfx_particle_curl = 0.1 -- 1.0
