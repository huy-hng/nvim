local M = {}

-- autocmd(event, pattern, {cmd: string}|{fn: fn|table}, {*opts})
-- autocmd(event, nil, cmd|fn, {*opts})
-- autocmd(event, nil, cmd|fn)
--- shortform
--- autocmd(event, cmd|fn) <-- works only when the third argument is empty
---param pattern string | string[] | nil
---param command function | string | table
---param opts table|nil
---overload fun(events: string|string[], command: function|string): table
---@param events autocmd-events | autocmd-events[]
function M.autocmd(events, pattern, command, opts)
	-- group:    string | integer
	-- callback: fn     | command: string
	-- pattern:  string | array
	-- buffer:   int
	-- desc:     string
	-- once:     bool
	-- nested:   bool
	opts = opts or {}

	if command == nil then
		command = pattern --[[@as function]]
		pattern = nil
	end

	if type(command) == 'string' then
		opts.command = command
	elseif type(command) == 'table' then
		if not command.__call then
			opts.callback = Util.extract_fn_from_table(command, 3)
		else
			opts.callback = function(data) command(data) end
		end
	else
		opts.callback = command
	end

	opts.pattern = pattern
	return { events, opts }
end

function M.createAutocmd(events, pattern, command, opts)
	local cmd = M.autocmd(events, pattern, command, opts)
	vim.api.nvim_create_autocmd(cmd[1], cmd[2])
end

--@param data table
--@param events autocmd-events | autocmd-events[]
--@param pattern string | nil
--@param command any
--@param opts any
function M.nestedAutocmd(data, events, pattern, command, opts)
	opts = opts or {}
	opts.group = data.group
	M.createAutocmd(events, pattern, command, opts)
end

---@param name string
---@param autocmds table
---@param clear boolean?
---@param active boolean?
function M.augroup(name, autocmds, clear, active)
	-- print(name, clear, active)
	local group = vim.api.nvim_create_augroup(name, { clear = clear or true })
	if active == false then return end
	for _, cmd in ipairs(autocmds) do
		cmd[2].group = group
		vim.api.nvim_create_autocmd(cmd[1], cmd[2])
	end
	-- return group
end

function M.createAugroup(name, clear)
	clear = clear == nil and true or clear
	return vim.api.nvim_create_augroup(name, { clear = clear })
end

local saved_groups = {}

function M.deleteAugroup(group)
	assert(type(group) == 'number' or type(group) == 'string')

	local saved_group = npcall(vim.api.nvim_get_autocmds, { group = group })
	if not saved_group then return end

	saved_groups[group] = saved_group

	local fn = {
		string = vim.api.nvim_del_augroup_by_name,
		number = vim.api.nvim_del_augroup_by_id,
	}
	pcall(fn[type(group)], group)
end

---@alias group table
---| 'buflocal' boolean, callback: function, command: string, event:  }

---@param group_name string
---@return integer? returns group_id if it exists, nil otherwise
function M.restoreAugroup(group_name)
	local group = saved_groups[group_name]
	if not group then return end

	local cmds = {}
	for _, cmd in ipairs(group) do
		-- vim.api.nvim_create_autocmd(cmd.event)
		-- P(cmd)
		table.insert(
			cmds,
			M.autocmd(cmd.event, cmd.pattern, cmd.callback or cmd.command, { once = cmd.once })
		)
	end

	M.augroup(group_name, cmds)
end

return M
