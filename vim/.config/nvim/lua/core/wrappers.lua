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
	return function()
		f(unpack(args))
		-- if not pcall(f, unpacked) then
		-- 	print('error at', debug.traceback('FN()'))
		-- end
	end
end

function math.clamp(num, lower, upper)
	return math.min(upper, math.max(num, lower))
end

function Schedule(fn, ...)
	local args = { ... }
	return vim.schedule(function()
		local status = pcall(fn, unpack(args))
		-- local fn_name = debug.getinfo(1, 'n')
		-- P(fn_name)
		if not status then print('Schedule', debug.traceback()) end
	end)
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
