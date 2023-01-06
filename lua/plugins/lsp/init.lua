local plugins = {
	'lsp_config',
	'mason',
	'lspsaga',
}

local required = {}
for _, plugin in ipairs(plugins) do
	table.insert(required, require('plugins.lsp.' .. plugin))
end

return required
