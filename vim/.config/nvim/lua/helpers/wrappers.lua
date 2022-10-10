local function cmd(command)
	command = string.gsub(command, '|', '<cr>:')
	return '<cmd>' .. command .. '<cr>'
end

local function fn(f, ...)
	local args = {...}
	return function()
		f(unpack(args))
	end
end

local M = {}
M.fn = fn
M.cmd = cmd

return M
