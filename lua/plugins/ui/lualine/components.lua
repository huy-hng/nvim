local M = {}

local available_components = {
	'branch', -- git branch
	'buffers', -- shows currently available buffers
	'diagnostics', -- diagnostics count from your preferred source
	'diff', -- git diff status
	'encoding', -- file encoding
	'fileformat', -- file format
	'filename',
	'filesize',
	'filetype',
	'hostname',
	'location', -- location in file in line:column format
	'mode', -- vim mode
	'progress', -- %progress in file
	'searchcount', -- number of search matches when hlsearch is active
	'tabs', -- shows currently available tabs
	'windows', -- shows currently available windows
}

M.seperator = { '%=' }

------------------------------------------Statusline Left-------------------------------------------

M.branch = {
	'branch',
	on_click = function(clicks, button, modifiers)
		-- P(clicks)
		-- P(button)
		-- P(modifiers)
	end,
	-- the function receives several arguments
	-- - number of clicks incase of multiple clicks
	-- - mouse button used (l(left)/r(right)/m(middle)/...)
	-- - modifiers pressed (s(shift)/c(ctrl)/a(alt)/m(meta)...)
}

M.session_name = function()
	local has_session, session = pcall(require, 'possession.session')
	if not has_session then return '' end

	local name = '%#Error#NO SESSION'
	if session.session_name then name = ' ' .. session.session_name end

	return name
end

-----------------------------------------Statusline Right-------------------------------------------

M.metamap = function()
	local bufnr = vim.api.nvim_get_current_buf()
	return vim.b[bufnr].MetaMap or ''
end

M.indentation = {
	function()
		local indent_type
		local width
		if vim.bo.expandtab then
			indent_type = '␣ Spaces  ' -- ⭿
			width = vim.bo.shiftwidth
		else
			indent_type = '⭾ Tabs  '
			width = vim.bo.tabstop
		end

		return indent_type .. width
	end,

	---@param clicks number, are the amount of clicks in a certain period of time (max seems to be 4)
	---@param button string,  can be one of { "l", "m", "r" }
	---@param modifiers string, can be shift, ctrl or alt
	-- the value might look like this "sca " (notice the space for some reason)
	on_click = function(clicks, button, modifiers)
		local set_indent = require('modules.detect_indentation.set_indentation')
		if button == 'r' then set_indent.toggle_indent_type() end
		if button == 'l' then --
			---@diagnostic disable-next-line: param-type-mismatch
			vim.ui.input('Indentation width: ', function(width) --
				set_indent.set_width(tonumber(width))
			end)
		end

		nvim.schedule(require('lualine').refresh, {
			scope = 'all', -- scope of refresh all/tabpage/window
			place = { 'statusline' }, -- lualine segment to refresh { 'statusline', 'winbar', 'tabline' }
		})
	end,
}

local preview_filetypes = require('plugins.editor.telescope.filetype_previewer')
M.filetype = {
	'filetype',
	on_click = function() preview_filetypes() end,
}

M.plugin_info = {
	require('lazy.status').updates,
	cond = require('lazy.status').has_updates,
	color = { fg = '#ff9e64' },
}

M.date = {
	Util.wrap(os.date, '%a, %b %d'), -- %B for full month
	icons_enabled = true,
	icon = '',
}

M.clock = {
	Util.wrap(os.date, '%H:%M'),
	icons_enabled = true,
	icon = '',
}

-----------------------------------------------Noice------------------------------------------------

M.command = {
	require('noice').api.status.command.get,
	cond = require('noice').api.status.command.has,
}

M.ruler = {
	require('noice').api.status.ruler.get,
	cond = require('noice').api.status.ruler.has,
}

M.message = {
	require('noice').api.status.message.get_hl,
	cond = require('noice').api.status.message.has,
}

M.search = {
	require('noice').api.status.search.get_hl,
	cond = require('noice').api.status.search.has,
}

M.mode = {
	require('noice').api.status.mode.get,
	cond = require('noice').api.status.mode.has,
}

----------------------------------------------Tabline-----------------------------------------------
M.bufferline = {
	'%{%v:lua.nvim_bufferline()%}',
	padding = 0,
}

M.tabs = {
	'tabs',

	max_length = vim.o.columns / 3, -- Maximum width of tabs component.
	mode = 1, -- 0-2: tab_nr, tab_name, both
	-- color = { fg = '#ff0000', bg = 'grey', gui = 'italic,bold' },

	-- separator = { left = 'a', right = 'b' },
	-- separator = 'a',
	fmt = function(name) return name end,
	cond = function() return vim.bo.filetype ~= 'alpha' end,
	tabs_color = {
		active = 'lualine_c_normal',
		inactive = 'lualine_c_inactive',
	},
}

----------------------------------------------Winbar------------------------------------------------

M.filename = function()
	local file_name = string.gsub(vim.fn.expand('%:t'), '%%', '')

	local f_icon, f_hl
	local devicons = nrequire('nvim-web-devicons')

	if devicons then
		local extension = vim.fn.fnamemodify(file_name, ':e')
		f_icon, f_hl = devicons.get_icon(file_name, extension, { default = true })
	end
	-- if filetype doesn't match devicon will set f_icon to nil so add a patch
	f_icon = not f_icon and '' or (f_icon .. ' ')
	f_hl = f_hl or ''
	local ns_prefix = '%#LspSagaWinbar'
	return '%#' .. f_hl .. '#' .. f_icon .. '%*' .. ns_prefix .. 'File#' .. file_name .. '%*'
end

M.filepath = {
	-- color = { bg = 'red' },
	function()
		---@diagnostic disable-next-line: param-type-mismatch
		if vim.fn.bufname('%') == '' then return '' end

		local file_name = M.filename()

		local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
		-- local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep, {})
		local path_list = vim.split(vim.fn.expand('%:~:.:h'), sep, {})

		-- local file_path = '%*' -- start with correct highlight group
		local file_path = '' -- start with correct highlight group

		for _, cur in ipairs(path_list) do
			if cur == '.' or cur == '~' then
				-- file_path = ''
			else
				file_path = file_path .. cur .. '%#LspSagaWinbarSep#  %*'
				-- file_path = file_path .. cur .. '%#LspSagaWinbarSep# > %*'
			end
		end
		return file_path .. file_name
	end,
}

M.diff = {
	'diff',
	colored = true, -- Displays a colored diff status if set to true
	-- diff_color = {
	-- 	-- Same color values as the general color option can be used here.
	-- 	added = 'DiffAdd', -- Changes the diff's added color
	-- 	modified = 'DiffChange', -- Changes the diff's modified color
	-- 	removed = 'DiffDelete', -- Changes the diff's removed color you
	-- },
	-- symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
	symbols = { added = ' ', modified = ' ', removed = ' ' }, -- Changes the symbols used by the diff.
	source = nil, -- A function that works as a data source for diff.lualine
	-- It must return a table as such:
	--   { added = add_count, modified = modified_count, removed = removed_count }
	-- or nil on failure. count <= 0 won't be displayed.
}

M.symbols = function()
	local symbolwinbar = require('lspsaga.symbolwinbar')
	local symbol = symbolwinbar.get_symbol_node() or ''
	return symbol
end

----------------------------------------------Unused------------------------------------------------

M.buffer = {
	'buffers',
	show_filename_only = true, -- Shows shortened relative path when set to false.
	hide_filename_extension = false, -- Hide filename extension when set to true.
	show_modified_status = true, -- Shows indicator when the buffer is modified.

	mode = 2, -- 0: Shows buffer name
	-- 1: Shows buffer index
	-- 2: Shows buffer name + buffer index
	-- 3: Shows buffer number
	-- 4: Shows buffer name + buffer number

	max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
	-- it can also be a function that returns
	-- the value of `max_length` dynamically.
	filetype_names = {
		TelescopePrompt = 'Telescope',
		dashboard = 'Dashboard',
		packer = 'Packer',
	}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

	-- buffers_color = {
	-- 	-- Same values as the general color option can be used here.
	-- 	active = 'lualine_{section}_normal', -- Color for active buffer.
	-- 	inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
	-- },

	symbols = {
		modified = ' ●', -- Text to show when the buffer is modified
		alternate_file = '', -- Text to show to identify the alternate file
		directory = '', -- Text to show when the buffer is a directory
	},
}

M.windows = {
	'windows',
	show_filename_only = true, -- Shows shortened relative path when set to false.
	show_modified_status = true, -- Shows indicator when the window is modified.

	mode = 0, -- 0: Shows window name
	-- 1: Shows window index
	-- 2: Shows window name + window index

	max_length = vim.o.columns * 2 / 3, -- Maximum width of windows component,
	-- it can also be a function that returns
	-- the value of `max_length` dynamically.
	filetype_names = {
		TelescopePrompt = 'Telescope',
		dashboard = 'Dashboard',
		packer = 'Packer',
		fzf = 'FZF',
		alpha = 'Alpha',
	}, -- Shows specific window name for that filetype ( { `filetype` = `window_name`, ... } )

	disabled_buftypes = { 'quickfix', 'prompt' }, -- Hide a window if its buffer's type is disabled

	windows_color = {
		-- Same values as the general color option can be used here.
		active = 'lualine_{section}_normal', -- Color for active window.
		inactive = 'lualine_{section}_inactive', -- Color for inactive window.
	},
}

return M
