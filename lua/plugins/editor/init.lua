local plugins = {
	'nvim-tree',
	'ranger',
	'telescope',
	'undotree',
	'possession',
	'harpoon',
}

local required = {}
for _, plugin in ipairs(plugins) do
	table.insert(required, require('plugins.editor.' .. plugin))
end

return required
