---[Convenient Lua]
---@param x number number to clamp
---@param lower number lower bound
---@param upper number upper bound
---@return number
function math.clamp(x, lower, upper) --
	return math.min(upper, math.max(x, lower))
end

--- round to nearest integer
---@param x number
---@param digits integer
---@overload fun(x: number)
function math.round(x, digits)
	if digits then
		local format = string.format('%%.%sf', digits)
		return tonumber(string.format(format, x))
	end

	return math.floor(x + 0.5)
end

--- split string by separator (space by default)
---@param input string string to separate
---@param sep string? separator to separate with
function string.split(input, sep)
	sep = sep or '%s'
	local t = {}
	for str in string.gmatch(input, '([^' .. sep .. ']+)') do
		table.insert(t, str)
	end
	return t
end

--- Check if a string starts with a substring
function string.starts(String, Start) return string.sub(String, 1, string.len(Start)) == Start end

--- Checks if a list-like (vector) table contains `value`.
---
---@param t table Table to check
---@param value any Value to compare
---@return boolean `true` if `t` contains `value`
function table.contains(t, value) return vim.tbl_contains(t, value) end


--- returns the index of the value in list and nil if not found
---@param list table
---@param val any
---@return number | nil
function table.index(list, val)
	for i, elem in ipairs(list) do
		if elem == val then return i end
	end
end



--- Filter a table using a predicate function
---
---@param func function|table Function or callable table
---@param t table Table
---@return table Table of filtered values
function table.filter(func, t) return vim.tbl_filter(func, t) end

--- Apply a function to all values of a table.
---
---@param func function|table Function or callable table
---@param t table Table
---@return table Table of transformed values
function table.map(func, t) return vim.tbl_map(func, t) end

--- Removes and returns a key from table
---@generic K
---@generic V
---@param table table<K, V>: { [K]: V }
---@param key K K
---@return V value V
function table.remove_key(table, key)
	local value = table[key]
	table[key] = nil
	return value
end

local function adjust_and_assert(i, len)
	local message = string.format('Index %s out of range for length %s.', i, len)
	assert(i <= len and i >= -len, message)
	return i > 0 and i or len + i + 1
end

---@param list any[]
---@param i integer
---@param j integer
---@return any[]
---@overload fun(list: any[], i: integer): any
function table.slice(list, i, j)
	assert(type(list) == 'table')

	if not j then
		local val = select(i, unpack(list))
		return val
	end

	i = adjust_and_assert(i, #list)
	j = adjust_and_assert(j, #list)
	return { unpack(list, i, j) }
end

--- combines two or more lists into one
---@param ... any | any[]
---@return any[]
function table.add(...)
	local new = select(1, ...)
	new = type(new) == 'table' and new or { new }

	for _, list in ipairs { select(2, ...) } do
		if type(list) ~= 'table' then
			table.insert(new, list)
			goto continue
		end

		for _, val in ipairs(list) do
			table.insert(new, val)
		end
		::continue::
	end
	return new
end

function table.copy(obj, seen)
	-- Handle non-tables and previously-seen tables.
	if type(obj) ~= 'table' then return obj end
	if seen and seen[obj] then return seen[obj] end

	-- New table; mark it as seen and copy recursively.
	local s = seen or {}
	local res = {}
	s[obj] = res
	for k, v in pairs(obj) do
		res[table.copy(k, s)] = table.copy(v, s)
	end
	return setmetatable(res, getmetatable(obj))
end

function table.extend(...) return vim.tbl_extend('force', ...) end

function table.keys(t) return vim.tbl_keys(t) end

function table.values(t) return vim.tbl_values(t) end
