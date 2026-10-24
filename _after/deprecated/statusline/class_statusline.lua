package.loaded['statusline.class_component'] = nil
local Component = require('statusline.class_component')

local Statusline = {
	base_style = {
		fg = 'fg',
		bg = 'bg',
	},
	components = {},
}

function Statusline:new(o, style)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.base_style = style or Statusline.base_style

	return o
end


function Statusline:new_component()
	local cmp = Component:new()
	table.insert(self.components, cmp)
end

function Statusline:combine()
	local stl = {}
	for _, comps in ipairs(self.components) do
		-- TODO
		table.insert(stl, comps:combine())
	end
end
