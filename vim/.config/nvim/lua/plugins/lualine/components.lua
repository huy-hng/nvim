M = {}

M.bufferline = {
	'%{%v:lua.nvim_bufferline()%}',
	padding = 0,
}

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

local function pretty_name()
	local file_name = string.gsub(vim.fn.expand('%:t'), '%%', '')
	local ok, devicons = pcall(require, 'nvim-web-devicons')
	local f_icon = ''
	local f_hl = ''
	if ok then
		f_icon, f_hl = devicons.get_icon_by_filetype(vim.bo.filetype)
	end
	-- if filetype doesn't match devicon will set f_icon to nil so add a patch
	f_icon = f_icon == nil and '' or (f_icon .. ' ')
	f_hl = f_hl == nil and '' or f_hl
	local ns_prefix = '%#LspSagaWinbar'
	return '%#' .. f_hl .. '#' .. f_icon .. '%*' .. ns_prefix .. 'File#' .. file_name .. '%*'
end

local function get_file_name()
	---@diagnostic disable-next-line: param-type-mismatch
	if vim.fn.bufname('%') == '' then return '' end

	local file_name = pretty_name()

	local sep = vim.loop.os_uname().sysname == 'Windows' and '\\' or '/'
	-- local path_list = vim.split(string.gsub(vim.fn.expand '%:~:.:h', '%%', ''), sep, {})
	local path_list = vim.split(vim.fn.expand('%:~:.:h'), sep, {})

	local file_path = '%*' -- start with correct highlight group

	for _, cur in ipairs(path_list) do
		if cur == '.' or cur == '~' then
			file_path = ''
		else
			file_path = file_path .. cur .. ' %#LspSagaWinbarSep#> %*'
		end
	end
	return file_path .. file_name
end

M.filename = get_file_name

local exclude = {
	['terminal'] = true,
	['vimwiki'] = true,
	['toggleterm'] = true,
	['prompt'] = true,
	['NvimTree'] = true,
	['help'] = true,
} -- Ignore float windows and exclude filetype

-- local has_lualine, lualine = pcall(require, 'lualine')
-- if not has_lualine then return end
-- local events = { 'BufEnter', 'BufWinEnter' }
-- vim.api.nvim_create_autocmd(events, {
-- 	pattern = '*',
-- 	group = vim.api.nvim_create_augroup('Load symbols', { clear = true }),
-- 	callback = function()
-- 		if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
-- 			lualine.refresh {
-- 				scope = 'all', -- scope of refresh all/tabpage/window
-- 				place = 'winbar',
-- 			}
-- 		end
-- 	end,
-- })

local has_symbolwinbar, symbolwinbar = pcall(require, 'lspsaga.symbolwinbar')
if not has_symbolwinbar then return end


M.symbols = function()
	local symbol = symbolwinbar.get_symbol_node() or ''

	-- if exclude[vim.bo.filetype] then
	-- 	return ''
	-- end
	return symbol
end

M.tabs = {
	'tabs',

	icons_enabled = true,
	icon = '',

	max_length = vim.o.columns / 3, -- Maximum width of tabs component.
	mode = 2, -- 0-2: tab_nr, tab_name, both
	-- color = { fg = '#ff0000', bg = 'grey', gui = 'italic,bold' },

	tabs_color = {
		active = 'lualine_c_normal',
		inactive = 'lualine_c_inactive',
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

local settings = {
	icons_enabled = true, -- Enables the display of icons alongside the component.
	-- Defines the icon to be displayed in front of the component.
	-- Can be string|table
	-- As table it must contain the icon as first entry and can use
	-- color option to custom color the icon. Example:
	-- {'branch', icon = ''} / {'branch', icon = {'', color={fg='green'}}}

	-- icon position can also be set to the right side from table. Example:
	-- {'branch', icon = {'', align='right', color={fg='green'}}}
	icon = nil,

	-- separator = nil, -- Determines what separator to use for the component.
	separator = { left = '', right = '' },
	-- Note:
	--  When a string is provided it's treated as component_separator.
	--  When a table is provided it's treated as section_separator.
	--  Passing an empty string disables the separator.

	-- These options can be used to set colored separators
	-- around a component.

	-- The options need to be set as such:
	--   separator = { left = '', right = ''}

	-- Where left will be placed on left side of component,
	-- and right will be placed on its right.

	cond = nil, -- Condition function, the component is loaded when the function returns `true`.

	-- Defines a custom color for the component:

	-- 'highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' } | function
	-- Note:
	--  '|' is synonymous with 'or', meaning a different acceptable format for that placeholder.
	-- color function has to return one of other color types ('highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' })
	-- color functions can be used to have different colors based on state as shown below.

	-- Examples:
	--   color = { fg = '#ffaa88', bg = 'grey', gui='italic,bold' },
	--   color = { fg = 204 }   -- When fg/bg are omitted, they default to the your theme's fg/bg.
	--   color = 'WarningMsg'   -- Highlight groups can also be used.
	--   color = function(section)
	--      return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
	--   end,
	color = nil, -- The default is your theme's color for that section and mode.

	-- Specify what type a component is, if omitted, lualine will guess it for you.

	-- Available types are:
	--   [format: type_name(example)], mod(branch/filename),
	--   stl(%f/%m), var(g:coc_status/bo:modifiable),
	--   lua_expr(lua expressions), vim_fun(viml function name)

	-- Note:
	-- lua_expr is short for lua-expression and vim_fun is short for vim-function.
	type = nil,

	padding = 1, -- Adds padding to the left and right of components.
	-- Padding can be specified to left or right independently, e.g.:
	--   padding = { left = left_padding, right = right_padding }

	fmt = nil, -- Format function, formats the component's output.
	on_click = nil, -- takes a function that is called when component is clicked with mouse.
	-- the function receives several arguments
	-- - number of clicks incase of multiple clicks
	-- - mouse button used (l(left)/r(right)/m(middle)/...)
	-- - modifiers pressed (s(shift)/c(ctrl)/a(alt)/m(meta)...)
}

-- M.filename = {
-- 	get_file_name,
-- 	file_status = true, -- Displays file status (readonly status, modified status)
-- 	newfile_status = false, -- Display new file status (new file means no write after created)
-- 	path = 1, -- 0: Just the filename
-- 	-- 1: Relative path
-- 	-- 2: Absolute path
-- 	-- 3: Absolute path, with tilde as the home directory

-- 	shorting_target = 40, -- Shortens path to leave 40 spaces in the window
-- 	-- for other components. (terrible name, any suggestions?)
-- 	symbols = {
-- 		modified = '[+]', -- Text to show when the file is modified.
-- 		readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
-- 		unnamed = '[No Name]', -- Text to show for unnamed buffers.
-- 		newfile = '[New]', -- Text to show for new created file before first writting
-- 	},
-- }

return M
