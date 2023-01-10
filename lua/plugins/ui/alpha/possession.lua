local query = require('possession.query')
local commands = require('possession.commands')
local posession_utils = require('possession.utils')

local utils = require('plugins.ui.alpha.utils')
local components = require('plugins.ui.alpha.components')

local workspaces = {
	-- {
	-- 	'Neovim', -- title
	-- 	'', -- shortcuts prefix
	-- 	'/home/huy/.dotfiles/vim/.config/nvim/',
	-- },
	-- 'Workspace A', -- title
	-- 'a', -- shortcuts prefix
	-- {
	-- 	'/root/directory/a',
	-- 	'/other/root/directory/',
	-- },
}

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
		sort_by = 'name',
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
		table.sort(sessions, function(a, b)
			-- print(a.user_data.timestamp, b.user_data.timestamp)
			return a.user_data.timestamp > b.user_data.timestamp
		end)

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
local function layout()
	local workspace_specs = workspaces
	local create_button = components.button
	local opts = {
		title_highlight = 'Type',
		others_name = 'Sessions',
	}

	-- Transform a sessions+shortcuts into alpha.nvim buttons
	local function to_buttons(sessions_with_shortcuts)
		return vim.tbl_map(function(sws)
			local shortcut, session_name = unpack(sws)
			local cmd = vim.schedule_wrap(Util.wrap(commands.load, session_name))
			return create_button(shortcut, session_name, cmd)
		end, sessions_with_shortcuts)
	end

	-- Generate a workspace section
	local section = function(name, sessions_with_shortcuts)
		return components.group({
			components.text(name, opts.title_highlight),
			components.group(to_buttons(sessions_with_shortcuts), 1),
		}, 1)
	end

	-- Get lists of session names with shortcuts assigned
	local workspaces, others = workspaces_with_shortcuts(workspace_specs, {
		map_session = function(s) return s.name end,
		others_prefix = '',
		sort_by = function(session)
			print(session.user_data.timestamp, session.name)
			return session.user_data.timestamp
		end,
	})
	-- P(workspaces, others)

	-- Create sections layout group
	local layout = {}
	if #others > 0 then table.insert(layout, section(opts.others_name, others)) end
	for _, w in ipairs(workspaces) do
		local name, sessions_with_shortcuts = unpack(w)
		if #sessions_with_shortcuts > 0 then
			table.insert(layout, section(name, sessions_with_shortcuts))
		end
	end
	return layout
end

return components.group(posession_utils.throttle(layout, 5000))
