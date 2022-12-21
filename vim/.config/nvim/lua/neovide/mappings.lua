local functions = require('neovide.functions')
local os_fn = require('neovide.os_functions')
local g = vim.g

--==============================================================================
--                              |=> Resizing <=|
--==============================================================================

Nmap('<C-_>', { functions.resize_gui_font, -0.5 })
Nmap('<C-+>', { functions.resize_gui_font, 0.5 })
Nmap('<C-)>', functions.reset_gui_font)

-- nmap('<C-|>', { functions.resize_scale, 0, 1.0 })
-- nmap('<C-{>', { functions.resize_scale, -0.05 })
-- nmap('<C-}>', { functions.resize_scale, 0.05 })

--==============================================================================
--                               |=> Window <=|
--==============================================================================
Nmap(
	'<C-S-F11>',
	function() g.neovide_fullscreen = not g.neovide_fullscreen end,
	'Toggle Neovide Fullscreen'
)

--==============================================================================
--                            |=> Transparency <=|
--==============================================================================
local speed = 300
-- nmap('<localleader>1', { os_fn.animate_transparency_change, 1, 67, 50, speed })
-- nmap('<localleader>2', { os_fn.animate_transparency_change, g.neovide_default_transparency, 0, 0, speed })

Nmap('<C-{>', { Schedule, functions.change_window_opacity, -0.1 }, 'Decrease window opacity')
Nmap('<C-}>', { Schedule, functions.change_window_opacity, 0.1 }, 'Increase window opacity')
Nmap('<C-|>', os_fn.toggle_blur_on_kde, 'Increase window opacity')

local function scroller()
	local has_lualine, lualine = pcall(require, 'lualine')
	if not has_lualine then return end

	-- local winbar_before = vim.o.winbar
	-- vim.wo.winbar = ''

	-- lualine.hide { place = { 'winbar' }, unhide = false }

	-- Defer(
	-- 	(vim.g.neovide_scroll_animation_length * 1000),
	-- 	lualine.hide,
	-- 	{ place = { 'winbar' }, unhide = true }
	-- )

	-- vim.defer_fn(function()
	-- 	lualine.hide { place = { 'winbar' }, unhide = true }
	-- end, 1000)
end

Nmap('<C-d>', '<C-d>zz', 'Scroll down', { callback = scroller })
Nmap('<C-u>', '<C-u>zz', 'Scroll up', { callback = scroller })
