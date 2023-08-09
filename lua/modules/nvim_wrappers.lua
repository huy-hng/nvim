local M = {}
---@alias Callback function

----------------------------------------------Executors---------------------------------------------

---@param command string command to execute
---@param output? boolean whether to return output from command, defaults to true
---@return string | nil
function M.exec(command, output) --
	local opts = { output = Util.nil_or_true(output)}
	local res = vim.api.nvim_exec2(command, opts)
	return output and res.output
end

function M.normal(str) vim.api.nvim_command('normal! ' .. str) end

function M.defer(timeout, fn, ...) --
	local args = { ... }
	return vim.defer_fn(function() fn(unpack(args)) end, timeout)
end

---@diagnostic disable-next-line: undefined-field
function M.save() pcall(vim.api.nvim_exec, 'silent w', false) end

function M.sleep(timeout, fn, ...) --
	local args = { ... }
	local res
	vim.defer_fn(function() fn(unpack(args)) end, timeout)
	vim.wait(timeout, function()
		if res then return true end
	end)
	return res
end

---@param fn function function to be wrapped
---@param ... any args for the function
function M.schedule_wrap(fn, ...) --
	local args = { ... }
	return vim.schedule_wrap(function() fn(unpack(args)) end)
end

---@param fn function function to be scheduled
---@param ... any args for the function
function M.schedule(fn, ...)
	local args = { ... }
	vim.schedule(function() fn(unpack(args)) end)
end

---@param fn function function to be scheduled
---@param ... any args for the function
---@return any
--- inherently slower than normal schedule due to synchronous nature of return
function M.schedule_return(fn, ...)
	local args = { ... }
	local res
	vim.schedule(function() res = fn(unpack(args)) end)
	vim.wait(0, function()
		if res then return true end
	end)
	return res
end

function Repeat(expr, count)
	assert(type(count) == 'number')
	count = math.round(count)
	return vim.fn['repeat'](expr, count)
end

function M.termcode(key, from_part, do_lt, special)
	return vim.api.nvim_replace_termcodes(
		key,
		Util.nil_or_true(from_part),
		Util.nil_or_true(do_lt),
		Util.nil_or_true(special)
	)
end

function M.feedkeys(key, remap)
	local escaped = vim.api.nvim_replace_termcodes(key, true, true, true)
	vim.api.nvim_feedkeys(escaped, remap and 'm' or 'n', false)
end

-- from https://github.com/neovim/neovim/pull/13896
function M.region_to_text(region)
	local text = ''
	local maxcol = vim.v.maxcol
	for line, cols in vim.spairs(region) do
		local endcol = cols[2] == maxcol and -1 or cols[2]
		local chunk = vim.api.nvim_buf_get_text(0, line, cols[1], line, endcol, {})[1]
		text = ('%s%s\n'):format(text, chunk)
	end
	return text
end

-- TODO: only works with selection in same line
function M.visual_text()
	local visual = vim.fn.getpos('v')
	local cursor = vim.fn.getpos('.')

	if visual[2] ~= cursor[2] then return end

	local line = visual[2] - 1
	local startcol = visual[3] - 1
	local endcol = cursor[3]

	if visual[3] > cursor[3] then
		startcol = cursor[3] - 1
		endcol = visual[3]
	end

	return vim.api.nvim_buf_get_text(0, line, startcol, line, endcol, {})[1]
end

-----------------------------------------------Creators---------------------------------------------

Highlight = vim.api.nvim_set_hl
M.hl = vim.api.nvim_set_hl

function M.command(name, command, opts)
	if type(command) == 'table' then command = Util.extract_fn_from_table(command, 2) end
	vim.api.nvim_create_user_command(name, command, opts or {})
end

-------------------------------------------------Api------------------------------------------------

return M
