function Exec(command)
	return vim.api.nvim_exec(command, true)
end

function CMD(command)
	return function()
		vim.api.nvim_exec(command, false)
	end
end

function CMD_(command)
	command = string.gsub(command, '|', '<cr>:')
	return '<cmd>' .. command .. '<cr>'

	-- return function()
	-- 	return vim.api.nvim_command(command)
	-- end
end

function Normal(str)
	vim.api.nvim_command('normal! ' .. str)
end

function FN(f, ...)
	local args = { ... }
	return function()
		local unpacked = unpack(args)
		f(unpacked)
		-- if not pcall(f, unpacked) then
		-- 	print('error at', debug.traceback('FN()'))
		-- end
	end
end

function Schedule(fn, ...)
	local args = { ... }
	return vim.schedule(function()
		return fn(unpack(args))
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
