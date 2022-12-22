local M = {}
function M.pop_key(tbl, key)
	local value = tbl[key]
	tbl[key] = nil
	return value
end

return M
