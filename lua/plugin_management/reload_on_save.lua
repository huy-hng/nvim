local M = {}

local function path_to_require(path)
	path = path or vim.fn.expand('%')
	if not path then return end

	local relative = string.match(path, 'lua/(.*).lua$')
	return string.gsub(relative, '/', '.')
end

local function reload_config()
	local path = npcall(path_to_require)
	if not path then return end

	local module = R(path)
	if not module or type(module) ~= 'table' or not module.config then return end

	module.config()
end

function M.start()
	-- reload plugin config on save
	Augroup('LazyReload', {
		Autocmd('User', 'VeryLazy', function(data)
			NestedAutocmd(data, 'User', 'LazyReload', reload_config)
			return true
		end),
	})
end

function M.stop() DeleteAugroup('LazyReload') end

return M
