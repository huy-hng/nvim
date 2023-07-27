local M = {}

-- tbl_deep_extend does not work the way you would think
local function merge_table_impl(t1, t2)
	for k, v in pairs(t2) do
		if type(v) == 'table' then
			if type(t1[k]) == 'table' then
				merge_table_impl(t1[k], v)
			else
				t1[k] = v
			end
		else
			t1[k] = v
		end
	end
end

function M.merge_tables(...)
	local out = {}
	for i = 1, select('#', ...) do
		merge_table_impl(out, select(i, ...))
	end
	return out
end

function M.deep_copy(obj, seen)
	-- Handle non-tables and previously-seen tables.
	if type(obj) ~= 'table' then return obj end
	if seen and seen[obj] then return seen[obj] end

	-- New table; mark it as seen and copy recursively.
	local s = seen or {}
	local res = {}
	s[obj] = res
	for k, v in pairs(obj) do
		res[M.deep_copy(k, s)] = M.deep_copy(v, s)
	end
	return setmetatable(res, getmetatable(obj))
end

M._guicursor = nil
function M.hide_cursor()
	if M._guicursor == nil then
		M._guicursor = vim.go.guicursor
	end
	vim.schedule(function()
		if M._guicursor then
			vim.go.guicursor = "a:BufferManagerHiddenCursor"
		end
	end)
end

function M.show_cursor()
	if not M._guicursor then
		return
	end
	vim.schedule(function()
		if not M._guicursor then
			return
		end
		vim.go.guicursor = "a:"
		vim.cmd.redrawstatus()
		vim.go.guicursor = M._guicursor
		M._guicursor = nil
	end)
end

return M
