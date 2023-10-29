local possession_utils = require('possession.utils')
local query = require('possession.query')
local commands = require('possession.commands')

local comp = require('plugins.editor.alpha.components')

local workspace_specs = {
	{
		'Neovim', -- title
		'v', -- shortcuts prefix
		{ '~/.dotfiles/nvim/.config/nvim/' },
	},
	{
		'Repositories',
		'r',
		{ '~/repositories/' },
	},
	{
		'Dotfiles',
		'd',
		{ '~/.dotfiles/' },
	},
	{
		'Other',
		'o',
	},
}

local function format_date(session, format)
	return os.date(format or '%d-%m-%Y', session.user_data.timestamp)
end

local function sort_sessions_by_time(sessions)
	table.sort(sessions, function(a, b)
		if not a or not a.user_data.timestamp then return false end
		if not b or not b.user_data.timestamp then return true end
		return a.user_data.timestamp > b.user_data.timestamp
	end)
end

local function get_sessions() return query.as_list() end

local function group_by_workspaces(specs, sessions)
	local workspaces = {} -- {name: root_dir} for by_workspace
	local prefixes = {} -- {name: prefix} for generating shortcuts
	local workspace_order = {} -- {name} to return data in order
	for _, spec in ipairs(specs) do
		local name, prefix, root_dirs = unpack(spec)
		-- unmap prefix key
		Map.n(prefix, '', '', { buffer = true })
		workspaces[name] = root_dirs
		prefixes[name] = prefix
		table.insert(workspace_order, name)
	end

	local groups, others = query.group_by(query.by_workspace(workspaces), sessions)

	local grouped = vim.tbl_map(function(name)
		if workspaces[name] then return { name, groups[name] } end
		return { name, others }
	end, workspace_order)

	return grouped, prefixes
end

local function last_session_group(last_session, groups)
	-- get last session group name
	for _, group in ipairs(groups) do
		local group_name, sessions = unpack(group)
		for _, session in ipairs(sessions or {}) do
			if session.name == last_session.name then return group_name end
		end
	end
end

local function load_session(session_name) return nvim.schedule_wrap(commands.load, session_name) end

local function _group_buttons(groups, prefixes)
	return vim.tbl_map(function(group)
		local group_name = group[1]
		local prefix = prefixes[group_name]
		local sessions = group[2]

		if not sessions or #sessions == 0 then return end

		local maps = {}
		local buttons = vim.tbl_map(function(session)
			local i = 1
			local lhs

			repeat
				lhs = string.lower(session.name:sub(1, i))
				i = i + 1
			until not maps[lhs]

			maps[lhs] = true
			return comp.keymap(session.name, prefix .. lhs, load_session(session.name))
		end, sessions)

		-- return { group_name, buttons }
		return comp.group {
			comp.padding(1),
			comp.group_name(group_name),
			comp.padding(1),
			comp.group(buttons, 1),
		}
	end, groups)
end

local function group_buttons(groups, prefixes) return _group_buttons(groups, prefixes) end

local function layout()
	local sessions = get_sessions()
	if #sessions == 0 then return end

	sort_sessions_by_time(sessions)
	local groups, prefixes = group_by_workspaces(workspace_specs, sessions)

	local last_session = sessions[1]
	local last_session_group_name = last_session_group(last_session, groups)
	return {
		comp.divider(' Session Management '),
		comp.padding(1),
		last_session_group_name and comp.group_name('Last Session: ' .. last_session_group_name),
		comp.padding(1),
		last_session and comp.keymap(last_session.name, '0', load_session(last_session.name)),
		comp.padding(1),
		comp.group(group_buttons(groups, prefixes)),
	}
end

return possession_utils.throttle(layout, 5000)
