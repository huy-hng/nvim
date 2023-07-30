local M = {}
---@param errors string
local function error_formatter(errors)
	errors = errors:gsub('	', '    ')
	return 'Errors:\n    ' .. errors
end

local function stacktrace_formatter(message, level)
	local trace = debug.traceback(message or '', level or 2)
	return trace:gsub('	', '    ') -- replace tabs with spaces so they show up in cmdline
end

local function fn_info_formatter(fn, args)
	if type(fn) ~= 'function' then return '' end
	local fn_name = debug.getinfo(fn, 'n').name or 'no name'
	args = vim.inspect(args)
	local fn_info = debug.getinfo(fn, 'S')

	local info = string.format('%s:%s', fn_info.short_src, fn_info.linedefined)
	return string.format('Function: "%s" with args %s\n    Source: %s', fn_name, args, info)
end

local function notify_error(trace, errors)
	errors = error_formatter(errors)
	-- errors = ''
	local message = string.format('%s\n%s', trace, errors)

	local divider = '\n' .. Repeat('-', 80) .. '\n'
	local print_message = divider .. message .. divider

	print(print_message)
	vim.notify(message, 'error')
end

---@param par1 integer | function stacktrace level
---@param ... any args for the function
---@return integer level, function fn, table fn_args
local function parse_args(par1, ...)
	local level = 0
	local fn = par1
	local args = { ... }

	if type(par1) ~= 'function' then
		level = par1
		fn = table.remove(args, 1)
		args = args
	end

	assert(type(level) == 'number', 'traceback level should be a number')
	if type(fn) == 'table' then
		local meta = getmetatable(fn)
		if meta.__call then
			assert(type(meta.__call) == 'function')
		else
			error('not callable')
		end
	else
		assert(type(fn) == 'function')
	end
	assert(type(args) == 'table')
	return level, fn, args
end

---@param level? integer | function stacktrace level
---@param fn function function to call
---@param ... any args for the function
---@overload fun(fn: function, ...: any)
---@overload fun(level: integer, fn: function, ...: any)
function M.try_wrap(par1, ...)
	local level, fn, args = parse_args(par1, ...)

	local fn_info = fn_info_formatter(fn, args)
	local trace = stacktrace_formatter(fn_info, level and level + 3 or 3)

	return function()
		local status, result = pcall(fn, unpack(args))
		if not status then notify_error(trace, result) end
	end
end

--- Try(level, fn, ...)
--- Try(fn, ...)
---@param level? integer | function stacktrace level
---@param fn function function to call
---@param ... any args for the function
---@overload fun(fn: function, ...: any)
---@overload fun(level: integer, fn: function, ...: any)
function M.try(par1, ...) return M.try_wrap(par1, ...)() end
return M
