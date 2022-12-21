---@alias Callback function

----------------------------------------------Executors---------------------------------------------

---@param command string command to execute
---@param output? boolean whether to return output from command
---@return string | nil
function Exec(command, output) -- 
	return vim.api.nvim_exec(command, NilTrue(output))
end

function Normal(str) vim.api.nvim_command('normal! ' .. str) end

function Defer(timeout, fn, ...) --
	local args = { ... }
	vim.defer_fn(function() fn(unpack(args)) end, timeout)
end

function Schedule(fn, ...) --
	local args = { ... }
	vim.schedule(function() fn(unpack(args)) end)
end

function Repeat(expr, count) return vim.fn['repeat'](expr, count) end

function TermcodeReplace(key, from_part, do_lt, special)
	return vim.api.nvim_replace_termcodes(key, NilTrue(from_part), NilTrue(do_lt), NilTrue(special))
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


-----------------------------------------------Creators---------------------------------------------

Highlight = vim.api.nvim_set_hl

function Commander(name, command, opts)
	if type(command) == 'table' then command = ExtractFnFromTable(command, 2) end
	vim.api.nvim_create_user_command(name, command, opts or {})
end

-------------------------------------------------Api------------------------------------------------
