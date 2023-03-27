require('plugin_management.ensure_lazy')

Nmap('<C-S-P>', require('lazy').home)

require('lazy').setup({
	{ import = 'plugins' },
	{ import = 'plugins.coding' },
	{ import = 'plugins.editor' },
	{ import = 'plugins.git' },
	{ import = 'plugins.lsp' },
	{ import = 'plugins.ui' },
}, require('plugin_management.config'))

local function path_to_require(path)
	path = path or vim.fn.expand('%')
	if not path then return end

	local relative = string.match(path, 'lua/(.*).lua$')
	return string.gsub(relative, '/', '.')
end

local function reload_config(data)
	-- P(data)
	local path = npcall(path_to_require)
	if not path then return end

	local module = R(path)
	-- P(module)
	if not module or type(module) ~= 'table' or not module.config then return end

	module.config()
end

-- reload plugin config on save
Augroup('LazyReload', {
	Autocmd('User', 'VeryLazy', function(data)
		NestedAutocmd(data, 'User', 'LazyReload', reload_config)
		return true
	end),
})
