local has_query, query = pcall(require, 'possession.query')
if not has_query then return end

local config = require('possession.config')

local utils = require('possession.utils')
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

local button = function(sc, txt, keybind)
	local opts = {
		position = 'center',
		shortcut = sc,
		cursor = 0,
		width = 50,
		align_shortcut = 'right',
		hl_shortcut = 'Keyword',
	}
	if keybind then
		-- local keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		local keybind_opts = {}
		opts.keymap = { 'n', sc, keybind, keybind_opts }
	end

	local function on_press()
		local key = vim.api.nvim_replace_termcodes(keybind or sc .. '<Ignore>', true, false, true)
		vim.api.nvim_feedkeys(key, 't', false)
	end

	return {
		type = 'button',
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

-- Example session layout generator for alpha.nvim.
-- This will group sessions by workspaces and return an alpha.nvim 'group' table.
--
--@param workspace_specs table: same as in M.workspaces_with_shortcuts()
--@param create_button function: f(shortcut, text, keybind) that generates alpha.nvim button, see:
-- https://github.com/goolord/alpha-nvim/blob/8a1477d8b99a931530f3cfb70f6805b759bebbf7/lua/alpha/themes/startify.lua#L28
--@param title_highlight string?: highlight group for section titles
--@param others_name string?: name used for section with sessions not matching any workspace
local function alpha_workspace_layout(workspace_specs, create_button, opts)
	opts = vim.tbl_extend('force', {
		title_highlight = 'Type',
		others_name = 'Sessions',
	}, opts or {})

	vim.validate {
		create_button = { create_button, 'function' },
		title_highlight = { opts.title_highlight, 'string' },
		others_name = { opts.others_name, 'string' },
	}

	-- Get lists of session names with shortcuts assigned
	local workspaces, others = query.workspaces_with_shortcuts(workspace_specs, {
		map_session = function(s)
			return s.name
		end,
	})

	-- Transform a sessions+shortcuts into alpha.nvim buttons
	local to_buttons = function(sessions_with_shortcuts)
		return vim.tbl_map(function(sws)
			local shortcut, session_name = unpack(sws)
			local cmd = string.format('<cmd>%s %s<cr>', config.commands.load, session_name)
			return create_button(shortcut, session_name, cmd)
		end, sessions_with_shortcuts)
	end
	-- local to_buttons = function(sessions_with_shortcuts)
	-- 	local buttons = {}
	-- 	for _, sws in ipairs(sessions_with_shortcuts) do
	-- 		local shortcut, session_name = unpack(sws)
	-- 		local cmd = string.format('<cmd>%s %s<cr>', config.commands.load, session_name)
	-- 		local b = create_button(shortcut, session_name, cmd)
	-- 		table.insert(buttons, b)
	-- 		table.insert(buttons, { type = 'padding', val = 1 })
	-- 	end
	-- 	return buttons
	-- end

	local get_padded_name = function(name, width)
		local needed_spaces = width - string.len(name)
		local padded_name = name .. vim.fn['repeat'](' ', needed_spaces)
		return padded_name
	end

	-- Generate a workspace section
	local section = function(name, sessions_with_shortcuts)
		return {
			type = 'group',
			val = {
				{ type = 'padding', val = 1 },
				{
					type = 'text',
					val = get_padded_name(name, opts.width),
					opts = { position = 'center', hl = opts.title_highlight },
				},
				{ type = 'padding', val = 1 },
				{
					type = 'group',
					val = to_buttons(sessions_with_shortcuts),
					opts = { spacing = 1 },
				},
			},
		}
	end

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

local function get_padded_name(name, width)
	local needed_spaces = width - string.len(name)
	local padded_name = name .. vim.fn['repeat'](' ', needed_spaces)
	return padded_name
end

local get_layout = function()
	local layout = query.alpha_workspace_layout(workspaces, button)

	for _, section in ipairs(layout) do
		for _, elem in ipairs(section.val) do
			if elem.type == 'text' then
				elem.val = get_padded_name(elem.val, 50)
				elem.opts.position = 'center'
			end
			if elem.type == 'group' then elem.opts = { spacing = 1 } end
		end
	end

	return layout
end

return {
	type = 'group',
	val = utils.throttle(get_layout, 5000),
}
