local M = {}

function M.print(...)
	vim.print(...)
	if not DEBUG_PRINT then
		local trace = debug.traceback('Attempted print from', 2)
		print(trace:gsub('	', '    '))
	end
end

local function handle_pcall(status, ...) --
	return status and ... or nil
end

-- return result or nil
---@param fn function
---@param ... any
---@return unknown | nil
function M.npcall(fn, ...) --
	return handle_pcall(pcall(fn, ...))
end

-- return required package or nil
---@param name string
---@return unknown | nil
function M.nrequire(name) --
	return handle_pcall(pcall(require, name))
end

return M
