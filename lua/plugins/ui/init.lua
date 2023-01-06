local plugins = {
	'alpha',
	'bufferline',
	'catppuccin',
	'dressing',
	'lualine',
	'no-neck-pain',
	'noice',
	'nui',
	'colorizer',
	'notify',
	'symbols_outline',
	'ufo',
	'zen',
}

local required = {}
for _, plugin in ipairs(plugins) do
	table.insert(required, require('plugins.ui.' .. plugin))
end

return required
