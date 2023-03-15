local query = require('possession.query')
local commands = require('possession.commands')
local posession_utils = require('possession.utils')

local comp = require('plugins.ui.alpha.components')

local workspaces = {
	{
		'Neovim', -- title
		'n', -- shortcuts prefix
		'/home/huy/.dotfiles/nvim/.config/nvim/',
	},
	-- 'Workspace A', -- title
	-- 'a', -- shortcuts prefix
	-- {
	-- 	'/root/directory/a',
	-- 	'/other/root/directory/',
	-- },
}

local function sort_sessions_by_time(sessions)
	table.sort(sessions, function(a, b) return a.user_data.timestamp > b.user_data.timestamp end)
end

-- Do-all helper for generating session data suitable for usage in a startup screen.
--
-- This will group sessions by workspace, where each workspace is defined by
-- a list of root directories. Shortcuts in the form {prefix}{number} will be
-- generated for sessions in each workspace. The returned data can be used
-- to generate startup screen buttons.
--
--@param workspace_specs table: list of lists {ws_name, ws_prefix, ws_root_dirs}
--@param sessions table?
--@param others_prefix string?: prefix for sessions without a workspace, defaults to 's'
--@param sort_by nil|string|function?: what key to use when sorting sessions within a workspace;
-- string value is used as session key (defaults to 'name', which sorts by session.name);
-- if function then it should have a signature fn(session) -> sort_key
--@param map_session nil|function?: if specified, then will be used to convert all sessions
-- in the retuned data to different values (normally returns session_data tables);
-- useful to just get session names in the output instead of tables
--@return table table: returns 2 values, first is list of lists
--   {ws_name, sessions_with_shortcuts}
-- where sessions_with_shortcuts is a list of pairs
--   {shortcut, session_data}
-- the second returned value is sessions_with_shortcuts that did not match any workspace
local function workspaces_with_shortcuts(workspace_specs, opts)
	opts = vim.tbl_extend('force', {
		sessions = nil,
		others_prefix = '',
		map_session = nil,
	}, opts or {})

	local workspaces = {} -- {name: root_dir} for by_workspace
	local prefixes = {} -- {name: prefix} for generating shortcuts
	local workspace_order = {} -- {name} to return data in order
	for _, specs in ipairs(workspace_specs) do
		local name, prefix, root_dirs = unpack(specs)
		assert(
			prefix ~= opts.others_prefix,
			string.format('Duplicate prefix "%s", specify different opts.other_prefix', prefix)
		)
		workspaces[name] = root_dirs
		prefixes[name] = prefix
		table.insert(workspace_order, name)
	end

	local groups, others = query.group_by(query.by_workspace(workspaces), opts.sessions)

	local with_shortcuts = function(prefix, sessions)
		sort_sessions_by_time(sessions)

		local i = 0
		return vim.tbl_map(function(s)
			i = i + 1
			local shortcut = string.format('%s%d', prefix, i)
			if opts.map_session then s = opts.map_session(s) end
			return { shortcut, s }
		end, sessions)
	end

	groups = vim.tbl_map(
		function(name) return { name, with_shortcuts(prefixes[name], groups[name] or {}) } end,
		workspace_order
	)
	others = with_shortcuts(opts.others_prefix, others)

	return groups, others
end

-- Example session layout generator for alpha.nvim.
-- This will group sessions by workspaces and return an alpha.nvim 'group' table.
--
--@param workspace_specs table: same as in M.workspaces_with_shortcuts()
--@param create_button function: f(shortcut, text, keybind) that generates alpha.nvim button, see:
-- https://github.com/goolord/alpha-nvim/blob/8a1477d8b99a931530f3cfb70f6805b759bebbf7/lua/alpha/themes/startify.lua#L28
--@param title_highlight string?: highlight group for section titles
--@param others_name string?: name used for section with sessions not matching any workspace
local function get_layout()
	local workspace_specs = workspaces
	local opts = {
		title_highlight = 'Type',
		others_name = 'Sessions',
	}

	-- Generate a workspace section
	local section = function(name, sessions_with_shortcuts)
		-- Transform a sessions+shortcuts into alpha.nvim buttons
		local buttons = vim.tbl_map(function(sws)
			local shortcut, session = unpack(sws)
			local cmd = nvim.schedule_wrap(commands.load, session.name)
			return comp.button(session.name, shortcut, cmd)
		end, sessions_with_shortcuts)

		return comp.group({
			comp.text(name, opts.title_highlight),
			comp.group(buttons, 1),
		}, 1)
	end

	-- Get lists of session names with shortcuts assigned
	local workspaces, others = workspaces_with_shortcuts(workspace_specs, {
		-- map_session = function(s) return s.name end,
		others_prefix = '',
	})

	-- Get last session
	local sessions = query.as_list()
	sort_sessions_by_time(sessions)
	local last_session = sessions[1]

	-- Create sections layout group
	local layout = {}

	local load_last_session = nvim.schedule_wrap(commands.load, last_session.name)
	-- stylua: ignore
	table.insert(layout, comp.group({
		comp.padding(1),
		comp.text('Last Session', opts.title_highlight),
		comp.padding(1),
		comp.button(last_session.name, '1', load_last_session),
		comp.padding(2),
	}))

	if #others > 0 then table.insert(layout, section(opts.others_name, others)) end
	for _, w in ipairs(workspaces) do
		local name, sessions_with_shortcuts = unpack(w)
		if #sessions_with_shortcuts > 0 then
			table.insert(layout, section(name, sessions_with_shortcuts))
		end
	end
	return layout
end

return comp.group(posession_utils.throttle(get_layout, 5000))
