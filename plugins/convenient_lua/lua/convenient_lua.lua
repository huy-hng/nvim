local M = {}

local default_opts = {
	packages = {
		'math',
		'table',
		'string',
	},
}

---@param opts table
function M.setup(opts)
	if not opts or #opts == 0 then opts = default_opts end

	if type(opts.packages) == 'string' then
		if opts.packages == 'all' then
			opts.packages = default_opts.packages
		else
			require('convenient_lua.' .. opts.packages)
			return
		end
	end

	for _, package in ipairs(opts.packages) do
		require('convenient_lua.' .. package)
	end
end

M.setup(default_opts)

return M
