local plugins = {
	'autopairs',
	'cmp',
	'comment',
	'comment',
	'database',
	'quickscope',
	'snippets',
	'visual_multi',
}

local required = {}
for _, plugin in ipairs(plugins) do
	table.insert(required, require('plugins.coding.' .. plugin))
end

return required
