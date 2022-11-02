local helpers = require('statusline.helper_functions')
local data = require('statusline.data')

local Component = {}

function Component:new(o, statusline_table)
	o = o or {}
	setmetatable(o, self)
	self.__index = self

	self.statusline = statusline_table

	self.active_color = 'StatusLine'
	self.inactive_color = 'StatusLineNC'
	self.left_padding = ' '
	self.right_padding = ' '
	self.delimiter = ' | '
	return o
end


function Component:get_mode_color(mode)
	local highlight = nil

	local is_active = vim.g.statusline_winid == vim.fn.win_getid(vim.fn.winnr())
	highlight = is_active and self.active_color or self.inactive_color

	if mode == 'mode' and is_active then
		local m = vim.api.nvim_get_mode().mode
		highlight = data.mode_colors[m]
	end

	return {
		highlight = highlight,
		fg = helpers.get_highlight_color(highlight, 'fg'),
		bg = helpers.get_highlight_color(highlight, 'bg'),
	}
end

function Component:add_text(text, style, mode)
	self.text_parts = self.text_parts or {}

	style = style or {}


	mode = mode or 'active'
	local color = self:get_mode_color(mode)

	style['bg'] = color.bg
	style['fg'] = color.fg
	local style_name = helpers.create_style(text, style)

	local styled_text = '%#' .. style_name .. '#' .. text
	table.insert(self.text_parts, styled_text)
end


function Component:end_cmp(mode)
	self.text_parts = self.text_parts or {}

	mode = mode or 'active'
	local color = self:get_mode_color(mode)

	-- local active = vim.g.statusline_winid == vim.fn.win_getid(vim.fn.winnr())
	-- local highlight = active and self.active_color or self.inactive_color

	local combined = {}
	if not color.highlight then
		return
	end
	local highlight_text = '%#' .. color.highlight .. '#'
	table.insert(combined, highlight_text)
	table.insert(combined, self.left_padding)

	table.insert(combined, table.concat(self.text_parts, self.delimiter))
	table.insert(combined, self.right_padding)

	local done = table.concat(combined, '')
	table.insert(self.statusline, done)
end

return Component
