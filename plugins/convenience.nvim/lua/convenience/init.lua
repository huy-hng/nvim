local M = {}

local default_modules = {
	'autocommander',
	'lua_extension',
	'types',
	'utils',
}

function M.setup(opts)
	opts = opts or {}
	local modules = opts.modules or default_modules
	for _, module in ipairs(modules) do
		local status, _ = pcall(require, 'convenience.' .. module)
		if not status then error(module .. ' does not exist') end
	end
end

return M
