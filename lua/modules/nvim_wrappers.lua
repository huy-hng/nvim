local M = {}
---@alias Callback function

----------------------------------------------Executors---------------------------------------------

---@param command string command to execute
---@param output? boolean whether to return output from command, defaults to true
---@return string | nil
function M.exec(command, output) --
	return vim.api.nvim_exec(command, Util.nil_and_true(output))
end

function M.normal(str) vim.api.nvim_command('normal! ' .. str) end

function M.defer(timeout, fn, ...) --
	local args = { ... }
	vim.defer_fn(function() fn(unpack(args)) end, timeout)
end

---@param fn function function to be wrapped
---@param ... any args for the function
function ScheduleWrap(fn, ...) --
	local args = { ... }
	return vim.schedule_wrap(function() fn(unpack(args)) end)
end

---@param fn function function to be scheduled
---@param ... any args for the function
function M.schedule(fn, ...)
	local args = { ... }
	vim.schedule(function() fn(unpack(args)) end)
end

function Repeat(expr, count)
	assert(type(count) == 'number')
	count = math.round(count)
	return vim.fn['repeat'](expr, count)
end

function M.termcode(key, from_part, do_lt, special)
	return vim.api.nvim_replace_termcodes(key, Util.nil_and_true(from_part), Util.nil_and_true(do_lt), Util.nil_and_true(special))
end

function M.feedkeys(key, remap)
	local escaped = vim.api.nvim_replace_termcodes(key, true, true, true)
	vim.api.nvim_feedkeys(escaped, remap and 'm' or 'n', false)
end

-----------------------------------------------Creators---------------------------------------------

Highlight = vim.api.nvim_set_hl

function M.command(name, command, opts)
	if type(command) == 'table' then command = Util.extract_fn_from_table(command, 2) end
	vim.api.nvim_create_user_command(name, command, opts or {})
end

-------------------------------------------------Api------------------------------------------------

return M
