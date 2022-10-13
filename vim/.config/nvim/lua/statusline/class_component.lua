local helpers = require('statusline.helper_functions')
local data = require('statusline.data')

local Component = {
	['fg#'] = nil,
	['bg#'] = nil,
}

local log = Logger('Component', true)

function Component:start(o, statusline, opts)
	o = o or {}
	setmetatable(o, self)
	self.__index = self

	self.statusline = statusline
	self.opts = opts or data.get_opts()
	self.text_parts = {}
	return o
end

function Component:style(style)
	self.opts = style
end


function Component:add_text(text, style)
	style = style or {}

	self.active = vim.g.statusline_winid == vim.fn.win_getid(vim.fn.winnr())
	local highlight = self.active and self.opts.active_color or self.opts.inactive_color

	local fg = helpers.get_highlight_color(highlight, 'fg')
	local bg = helpers.get_highlight_color(highlight, 'bg')

	style['bg'] = bg
	style['fg'] = fg
	local style_name = helpers.create_style(text, style)

	local styled_text = '%#' .. style_name .. '#' .. text
	table.insert(self.text_parts, styled_text)
end


function Component:end_cmp()

	local highlight = self.active and self.opts.active_color or self.opts.inactive_color
	local combined = {}
	local highlight_text = '%#' .. highlight .. '#'
	table.insert(combined, highlight_text)
	table.insert(combined, self.opts.left_padding)

	table.insert(combined,
		table.concat(self.text_parts, self.opts.delimiter)
	)
	table.insert(combined, self.opts.right_padding)

	local done = table.concat(combined, '')
	table.insert(self.statusline, done)
end

return Component
