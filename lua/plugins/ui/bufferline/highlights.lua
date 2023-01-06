
local C = require('catppuccin.palettes').get_palette()
local bg_active = 'NONE'
local bg_inactive = 'NONE'

-- local separator_fg = O.transparent_background and C.surface1 or C.crust
local separator = C.crust

local fg_inactive = C.surface2
local fg_visible = C.overlay2
local fg_selected = C.text

local numbers = C.subtext0
local modified = C.green

local highlights = {
	fill = { bg = bg_inactive }, -- inactive tabs, not including number and icon
	buffer = { fg = fg_inactive, bg = bg_inactive }, -- for group colors

	background = { fg = fg_inactive, bg = bg_inactive },
	duplicate = { fg = fg_inactive, bg = bg_inactive, italic = true },
	numbers = { fg = numbers, bg = bg_inactive },
	separator = { fg = separator, bg = bg_inactive },
	modified = { fg = modified, bg = bg_inactive },

	-- buffers that are displayed in windows
	buffer_visible = { fg = fg_visible, bg = bg_inactive },
	duplicate_visible = { fg = fg_visible, bg = bg_inactive },
	numbers_visible = { fg = numbers, bg = bg_inactive },
	separator_visible = { fg = separator, bg = bg_inactive },
	indicator_visible = { fg = modified, bg = bg_active },
	modified_visible = { fg = modified, bg = bg_active },

	-- focused buffer
	buffer_selected = { fg = fg_selected, bg = bg_active, bold = true, italic = true }, -- current
	duplicate_selected = { fg = fg_selected, bg = bg_active, bold = false, italic = true },
	numbers_selected = { fg = numbers, bg = bg_active, bold = true, italic = true },
	separator_selected = { fg = separator, bg = bg_active },
	indicator_selected = { fg = modified, bg = bg_active },
	modified_selected = { fg = modified, bg = bg_active },

	-- tabs
	tab = { fg = C.surface2, bg = bg_inactive },
	tab_selected = { fg = C.sky, bg = bg_active, bold = true },
	tab_separator = { fg = separator, bg = bg_inactive },
	tab_separator_selected = { fg = C.maroon, bg = bg_active },
	tab_close = { fg = C.red, bg = bg_inactive },

	-- separators
	offset_separator = { fg = separator, bg = bg_active },

	-- close buttons
	close_button = { fg = C.surface2, bg = bg_inactive },
	close_button_visible = { fg = C.surface2, bg = bg_inactive },
	close_button_selected = { fg = C.text, bg = bg_active },

	-- Errors
	error = { fg = C.red, bg = bg_inactive },
	error_visible = { fg = C.red, bg = bg_inactive },
	error_selected = { fg = C.red, bg = bg_active },
	error_diagnostic = { fg = C.red, bg = bg_inactive },
	error_diagnostic_visible = { fg = C.red, bg = bg_inactive },
	error_diagnostic_selected = { fg = C.red, bg = bg_active },

	-- Warnings
	warning = { fg = C.yellow, bg = bg_inactive },
	warning_visible = { fg = C.yellow, bg = bg_inactive },
	warning_selected = { fg = C.yellow, bg = bg_active },
	warning_diagnostic = { fg = C.yellow, bg = bg_inactive },
	warning_diagnostic_visible = { fg = C.yellow, bg = bg_inactive },
	warning_diagnostic_selected = { fg = C.yellow, bg = bg_active },

	-- Infos
	info = { fg = C.sky, bg = bg_inactive },
	info_visible = { fg = C.sky, bg = bg_inactive },
	info_selected = { fg = C.sky, bg = bg_active },
	info_diagnostic = { fg = C.sky, bg = bg_inactive },
	info_diagnostic_visible = { fg = C.sky, bg = bg_inactive },
	info_diagnostic_selected = { fg = C.sky, bg = bg_active },

	-- Hint
	hint = { fg = C.teal, bg = bg_inactive },
	hint_visible = { fg = C.teal, bg = bg_inactive },
	hint_selected = { fg = C.teal, bg = bg_active },
	hint_diagnostic = { fg = C.teal, bg = bg_inactive },
	hint_diagnostic_visible = { fg = C.teal, bg = bg_inactive },
	hint_diagnostic_selected = { fg = C.teal, bg = bg_active },

	-- Diagnostics
	diagnostic = { fg = C.subtext0, bg = bg_inactive },
	diagnostic_visible = { fg = C.subtext0, bg = bg_inactive },
	diagnostic_selected = { fg = C.subtext0, bg = bg_active },
}

local cat_highlights = require('catppuccin.groups.integrations.bufferline').get {
	styles = { 'italic', 'bold' },
	custom = {
		all = {
			fill = { bg = 'bg' }, -- inactive tabs, not including number and icon
			background = { fg = C.surface2, bg = 'bg' },
			-- for group colors
			buffer = { fg = 'grey', bg = 'bg' },
			duplicate = { fg = 'grey', bg = 'bg', italic = true },
			numbers = { fg = 'grey', bg = 'bg' },
			separator = { fg = 'fg', bg = 'bg' },
			modified = { bg = 'bg' },

			-- buffers that are displayed in windows
			buffer_visible = { fg = C.surface1, bg = 'bg' },
			duplicate_visible = { fg = '#7F849C', bg = 'NONE', italic = true },
			numbers_visible = { fg = 'fg', bg = 'NONE' },
			separator_visible = { fg = 'fg', bg = 'NONE' },
			indicator_visible = { fg = 'fg', bg = 'NONE' },
			modified_visible = { bg = 'NONE' },

			-- focused buffer
			buffer_selected = { fg = 'fg', bg = 'NONE', bold = true, italic = true },
			duplicate_selected = { fg = 'grey', bg = 'NONE', bold = false, italic = true },
			numbers_selected = { fg = 'fg', bg = 'NONE', bold = true, italic = true },
			separator_selected = { fg = 'fg', bg = 'NONE' },
			indicator_selected = { fg = 'fg', bg = 'NONE' },
			modified_selected = { bg = 'NONE' },
		},
	},
}

local old_highlights = {
	fill = { bg = 'bg' }, -- inactive tabs, not including number and icon
	background = { fg = 'grey', bg = 'bg' },
	-- for group colors
	buffer = { fg = 'grey', bg = 'bg' },
	duplicate = { fg = 'grey', bg = 'bg', italic = true },
	numbers = { fg = 'grey', bg = 'bg' },
	separator = { fg = 'fg', bg = 'bg' },
	modified = { bg = 'bg' },

	-- buffers that are displayed in windows
	buffer_visible = { fg = 'grey', bg = 'bg' },
	duplicate_visible = { fg = '#7F849C', bg = 'bg', italic = true },
	numbers_visible = { fg = 'fg', bg = 'bg' },
	separator_visible = { fg = 'fg', bg = 'bg' },
	indicator_visible = { fg = 'fg', bg = 'bg' },
	modified_visible = { bg = 'bg' },

	-- focused buffer
	buffer_selected = { fg = 'fg', bg = 'bg', bold = true, italic = true },
	duplicate_selected = { fg = 'grey', bg = 'bg', bold = false, italic = true },
	numbers_selected = { fg = 'fg', bg = 'bg', bold = true, italic = true },
	separator_selected = { fg = 'fg', bg = 'bg' },
	indicator_selected = { fg = 'fg', bg = 'bg' },
	modified_selected = { bg = 'bg' },

	-- dev_icon_lua_inactive = { fg = 'fg', bg = 'bg' },
	-- group_label = { fg = 'red', bg = 'blue' },
	-- group_separator = { fg = 'red', bg = 'blue' },

	-- tab = {},
	-- tab_selected = { fg = 'tabline_sel_bg', bg = 'bg' },
	-- tab_close = { fg = 'NONE', bg = 'NONE' },
	-- close_button = { fg = 'fg', bg = 'bg' },
	-- close_button_visible = { fg = 'fg', bg = 'bg' },
	-- close_button_selected = { fg = 'fg', bg = 'bg' },
	-- diagnostic = { fg = 'fg', bg = 'bg' },
	-- diagnostic_visible = { fg = 'fg', bg = 'bg' },
	-- diagnostic_selected = { fg = 'fg', bg = 'bg', bold = true, italic = true },
	-- hint = { fg = 'fg', sp = '', bg = 'bg' },
	-- hint_visible = { fg = 'fg', bg = 'bg' },
	-- hint_selected = { fg = 'fg', bg = 'bg', sp = '', bold = true, italic = true },
	-- hint_diagnostic = { fg = 'fg', sp = '', bg = 'bg' },
	-- hint_diagnostic_visible = { fg = 'fg', bg = 'bg' },
	-- hint_diagnostic_selected = { fg = 'fg', bg = 'bg', sp = '', bold = true, italic = true },
	-- info = { fg = 'fg', sp = '', bg = 'bg' },
	-- info_visible = { fg = 'fg', bg = 'bg' },
	-- info_selected = { fg = 'fg', bg = 'bg', sp = '', bold = true, italic = true },
	-- info_diagnostic = { fg = 'fg', sp = '', bg = 'bg' },
	-- info_diagnostic_visible = { fg = 'fg', bg = 'bg' },
	-- info_diagnostic_selected = { fg = 'fg', bg = 'bg', sp = '', bold = true, italic = true },
	-- warning = { fg = 'fg', sp = '', bg = 'bg' },
	-- warning_visible = { fg = 'fg', bg = 'bg' },
	-- warning_selected = { fg = 'fg', bg = 'bg', sp = '', bold = true, italic = true },
	-- warning_diagnostic = { fg = 'fg', sp = '', bg = 'bg' },
	-- warning_diagnostic_visible = { fg = 'fg', bg = 'bg' },
	-- warning_diagnostic_selected = {
	-- 	fg = 'fg',
	-- 	bg = 'bg',
	-- 	sp = 'warning_diagnostic_fg',
	-- 	bold = true,
	-- 	italic = true,
	-- },
	-- error = { fg = 'fg', bg = 'bg', sp = '' },
	-- error_visible = { fg = 'fg', bg = 'bg' },
	-- error_selected = { fg = 'fg', bg = 'bg', sp = '', bold = true, italic = true },
	-- error_diagnostic = { fg = 'fg', bg = 'bg', sp = '' },
	-- error_diagnostic_visible = { fg = 'fg', bg = 'bg' },
	-- error_diagnostic_selected = { fg = 'fg', bg = 'bg', sp = '', bold = true, italic = true },
	-- pick_selected = { fg = 'fg', bg = 'bg', bold = true, italic = true },
	-- pick_visible = { fg = 'fg', bg = 'bg', bold = true, italic = true },
	-- pick = { fg = 'fg', bg = 'bg', bold = true, italic = true },
	-- offset_separator = { fg = 'fg', bg = 'bg' },
}

return highlights
