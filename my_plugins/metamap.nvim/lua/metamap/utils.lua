local M = {}

function M.pop_key(tbl, key)
	local value = tbl[key]
	tbl[key] = nil
	return value
end

---@param tbl table
function M.table_to_function(tbl)
	if type(tbl) ~= 'table' then return tbl end
	local fn = select(1, unpack(tbl))
	local args = { select(2, unpack(tbl)) }
	return function() fn(unpack(args)) end
end

return M
