local functions = require('neovide.functions')
local os_fn = require('neovide.os_functions')
local g = vim.g

--==============================================================================
--                              |=> Resizing <=|
--==============================================================================

nmap('<C-_>', { functions.resize_gui_font, -0.5 })
nmap('<C-+>', { functions.resize_gui_font, 0.5 })
nmap('<C-)>', functions.reset_gui_font)

-- nmap('<C-|>', { functions.resize_scale, 0, 1.0 })
-- nmap('<C-{>', { functions.resize_scale, -0.05 })
-- nmap('<C-}>', { functions.resize_scale, 0.05 })


--==============================================================================
--                               |=> Window <=|
--==============================================================================
nmap('<C-S-F11>', function()
	g.neovide_fullscreen = not g.neovide_fullscreen
end, 'Toggle Neovide Fullscreen')


--==============================================================================
--                            |=> Transparency <=|
--==============================================================================
local speed = 300
nmap('<localleader>1', { os_fn.animate_transparency_change, 1, 67, 50, speed })
nmap('<localleader>2', { os_fn.animate_transparency_change, g.neovide_default_transparency, 0, 0, speed })

nmap('<C-{>', { vim.schedule, FN(functions.change_window_opacity, -0.1) }, 'Decrease window opacity')
nmap('<C-}>', { vim.schedule, FN(functions.change_window_opacity, 0.1) }, 'Increase window opacity')
nmap('<C-|>', os_fn.toggle_blur_on_kde, 'Increase window opacity')
