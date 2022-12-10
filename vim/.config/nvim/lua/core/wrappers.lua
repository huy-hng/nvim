---@diagnostic disable: param-type-mismatch
function Exec(command)
	return vim.api.nvim_exec(command, true)
end

function CMD(command)
	return function()
		vim.api.nvim_exec(command, false)
	end
end

function Normal(str)
	vim.api.nvim_command('normal! ' .. str)
end

function FN(f, ...)
	local args = { ... }
	local stack_trace = debug.traceback(vim.fn.expand('%:r') .. ':FN()', 1)
	return function()
		-- f(unpack(args))

		local status, errors = pcall(f, unpack(args))
		if not status then print(stack_trace, errors) end
	end
end

function math.clamp(num, lower, upper)
	return math.min(upper, math.max(num, lower))
end

function Defer(timeout, fn, ...)
	local args = { ... }
	args = args or {}
	vim.defer_fn(function()
		fn(unpack(args))
	end, timeout)
end

function Schedule(fn, ...)
	local args = { ... }
	-- local level = 2
	-- local fn_name = nil
	-- while fn_name == nil do
	-- 	fn_name = debug.getinfo(level, 'n').name
	-- 	level = level + 1
	-- 	if level > 10 then break end
	-- end
	-- print(level, fn_name)

	local stack_trace = debug.traceback(vim.fn.expand('%:r') .. ':Schedule()', 2)

	vim.schedule(function()
		fn(unpack(args))
		-- local result, res2, res3 = xpcall(fn, error_handler, unpack(args))
		-- P('the result', result, res2, res3)

		-- local status, the_error = pcall(fn, unpack(args))
		-- if not status then
		-- 	-- error(debug.traceback(vim.fn.expand('%:r') .. ':Schedule()', 2), 2)
		-- 	error(stack_trace, 2)
		-- 	-- error('some error 0', 0)
		-- 	-- error('some error 2', 2)
		-- 	P(fn_name, error)
		-- end
		-- if not status then P(status, error) print(debug.traceback(vim.fn.expand('%:r') .. ':Schedule()', 1)) end
	end)
end

function Commander(name, command, opts)
	if type(command) == 'table' then command = ExtractFnFromTable() end
	vim.api.nvim_create_user_command(name, command, opts or {})
end

function Feedkeys(key, noremap)
	local mode
	if noremap == nil then
		mode = 'n'
	else
		mode = 'm'
	end

	local escaped = vim.api.nvim_replace_termcodes(key, true, true, true)
	vim.api.nvim_feedkeys(escaped, mode, false)
end

function BindFeedkeys(key)
	return function()
		Feedkeys(key)
	end
end

local M = {}
M.fn = FN
M.cmd = CMD

return M
