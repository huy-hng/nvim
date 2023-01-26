local possession_utils = require('possession.utils')
local commands = require('possession.commands')
local comp = require('plugins.ui.alpha.components')
local query = require('possession.query')

local workspace_specs = {
	{
		'Neovim', -- title
		'n', -- shortcuts prefix
		{ '/home/huy/.dotfiles/nvim/.config/nvim/' },
	},
	{
		'Sessions', -- title
		'', -- shortcuts prefix
	},
}

local function format_date(session, format)
	return os.date(format or '%d-%m-%Y', session.user_data.timestamp)
end

local function sort_sessions_by_time(sessions)
	table.sort(sessions, function(a, b) 
		if not a then return false end
		if not b then return true end
		return a.user_data.timestamp > b.user_data.timestamp end)
end

local function get_sessions() return query.as_list() end

local function group_by_workspaces(workspaces_specs, sessions)
	local workspaces = {} -- {name: root_dir} for by_workspace
	local prefixes = {} -- {name: prefix} for generating shortcuts
	local workspace_order = {} -- {name} to return data in order
	for _, specs in ipairs(workspace_specs) do
		local name, prefix, root_dirs = unpack(specs)
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

local function group_buttons(groups, prefixes)
	return vim.tbl_map(function(group)
		local group_name = group[1]
		local sessions = group[2]

	if not sessions or #sessions == 0 then return end

		local i = 0
		local buttons = vim.tbl_map(function(session)
			i = i + 1
			local shortcut = string.format('%s%d', prefixes[group_name], i)
			return comp.button(session.name, shortcut, load_session(session.name))
		end, sessions)

		return comp.group {
			comp.padding(1),
			comp.group_name(group_name),
			comp.padding(1),
			comp.group(buttons, 1),
		}
	end, groups)
end

local function layout()
	local sessions = get_sessions()
	sort_sessions_by_time(sessions)

	local groups, prefixes = group_by_workspaces(workspace_specs, sessions)
	if #sessions == 0 then return end

	local last_session = sessions[1]
	local last_session_group_name = last_session_group(last_session, groups)
	return {
		comp.divider(' Session Management '),
		comp.padding(1),
		last_session_group_name and comp.group_name('Last Session: ' .. last_session_group_name),
		comp.padding(1),
		last_session and comp.button(last_session.name, '0', load_session(last_session.name)),
		comp.padding(1),
		comp.group(group_buttons(groups, prefixes)),
	}
end

return comp.group(possession_utils.throttle(layout, 5000))
