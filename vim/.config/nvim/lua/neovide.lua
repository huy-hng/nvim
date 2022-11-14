--===============================================================================
--                                 |=> GUI <=|
--===============================================================================

-- add time to statusline
-- fun! NeovideStatusline()
	-- return MyStatusline() .. "| %{strftime('%H:%M')} "
-- endfun

-- set statusline=%!NeovideStatusline()

-----------------------------------------
--             -> Looks <-
-----------------------------------------
local g = vim.g
g.neovide_fullscreen = true
g.neovide_profiler = false


g.neovide_transparency = 1
g.neovide_floating_blur_amount_x = 6.0
g.neovide_floating_blur_amount_y = 6.0
-- g.transparency = 1
-- g.neovide_background_color = '#0f1117'.printf('%x', float2nr(255 * g:transparency))


-- g.gui_font_face = 'Fira Code Retina'
g.gui_font_face = 'FiraCode Nerd Font'

-----------------------------------------
--             -> Sizes <-
-----------------------------------------
g.neovide_underline_automatic_scaling = true
g.gui_font_default_size = 11.5 -- 10 on manjaro i think
g.neovide_scale_factor = 1.0
g.gui_font_size = g.gui_font_default_size


-----------------------------------------
--           -> Behavior <-
-----------------------------------------
g.neovide_refresh_rate = 50
g.neovide_refresh_rate_idle = 15
g.neovide_confirm_quit = true
g.neovide_remember_window_size = true
g.neovide_scroll_animation_length = 0.4
g.neovide_hide_mouse_when_typing = true

g.neovide_touch_deadzone=100
g.neovide_touch_drag_timeout=0.3

-- g.neovide_no_idle = true " not sure if this helps with anything


-----------------------------------------
--            -> Cursor <-
-----------------------------------------
g.neovide_cursor_animation_length = 0
g.neovide_cursor_trail_size = 0
g.neovide_cursor_animation_length = 0.02 -- 0.13
g.neovide_cursor_trail_size = 0.2 -- 0.8
-- g.neovide_cursor_antialiasing = false
g.neovide_cursor_antialiasing=true

-- g.neovide_cursor_vfx_mode = 'pixiedust'
g.neovide_cursor_vfx_mode = ''
g.neovide_cursor_vfx_opacity = 150.0
g.neovide_cursor_vfx_particle_lifetime=0.5
g.neovide_cursor_vfx_particle_density=5.0
g.neovide_cursor_vfx_particle_speed=50.0


--===============================================================================
--                               |=> Keymaps <=|
--===============================================================================
-- nmap('<leader>q', '<leader>q')

-- imap('<C-/>', '<C-/>')
-- nmap('<C-/>', '<C-/>')


-- unmap! <C-h>
-- icmap('<C-h>', '<C-h>')
-- icmap('<C-j>', '<C-j>')
-- icmap('<C-k>', '<C-k>')
-- icmap('<C-l>', '<C-l>')

icmap('<C-BS>', '<C-w>')

-- nmap('<C-S-Tab>', '<C-S-Tab>')
-- nmap('<Tab>', '<Tab>')

-- imap('<C-v>', '<C-v>')
-- nmap('<C-v>', '<C-v>')

nmap('<C-CR>', 'o<esc>')
-- nmap('<C-Space>', '<C-Space>')
-- nmap('<C-F12>', '<C-F12>')
-- nmap('<S-F11>', '<S-F11>')

-- nmap('<C-/>', '<C-/>')



RefreshGuiFont = function()
	vim.o.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
	g.gui_font_size = g.gui_font_size + delta
	RefreshGuiFont()
end

ResetGuiFont = function()
	g.gui_font_size = g.gui_font_default_size
	RefreshGuiFont()
end

ResetGuiFont()

local fn = require('helpers.wrappers').fn
nmap('<C-_>', '<C-_>')
nmap('<C-_>', fn(ResizeGuiFont, -0.5))
nmap('<C-+>', fn(ResizeGuiFont, 0.5))
nmap('<C-)>', ResetGuiFont)
