function test()
end

local winnr = vim.api.nvim_win_get_number(0)
local opts = { winid = winnr }


local function preview(str)
	local stl = vim.api.nvim_eval_statusline(str, {})
	print(' ')
	print(stl.str)
	print(' ')
	print(stl.width)
end


local function get_component_length(str)
	local stl = vim.api.nvim_eval_statusline(str, {})
	return stl.width
end


local mode_lookup = {
	n  = 'Normal',
	v  = 'Visual',
	V  = 'V-Line',
	[''] = 'V-Block',
	i  = 'Insert',
	R  = 'Replace',
	Rv = 'V-Replace',
	c  = 'Command',
	t  = 'Terminal',
}


function CurrentMode()
	local mode = vim.api.nvim_get_mode().mode
	return mode_lookup[mode]
end


local function line_loc()
	local percent = '%p%%'
	local line_col = '%l:%c'
	return percent .. ' ' .. line_col
end


function Filename()
	local file = vim.fn.expand('%:t')
	if file == '' then
		file = '[No Name]'
	end

	local modified = vim.bo.modified
	if modified then
		file = file .. ' +'
	end

	return file
end


function GitInfo()
	local branch_name = vim.call('fugitive#Head')
	if string.len(branch_name) > 0 then
		return ' ' .. branch_name
	end

	return ''
end


local function filetype()
	return '%y'
end


local function reparse(fn_name)
	return '%{%v:lua.'..fn_name..'()%}'
end


local function colorize(comp, color)
	local colors = {
		statusline = '%#StatusLine#',
		tabline = '%#TabLineSel#',
		pmenu = '%#PmenuSel#',
		user1 = '%1*',
		userend = '%*',
	}

	-- local combined = colors[color]
	table.insert(comp, 1, colors[color])
	return comp

	-- combined = combined .. ' '

	-- for i, comp in ipairs(args) do
	-- 	if i ~= 0 then
	-- 		combined = combined .. delimiter
	-- 	end
	-- 	combined = combined .. comp
	-- end

	-- if color2 then
	-- 	combined = combined .. colors[color2]
	-- end

	-- combined = combined .. ' '
	-- return combined
end

local function append_to_list(list1, list2)
	for _, val in ipairs(list2) do
		table.insert(list1, val)
	end
end

function Statusline()
	local mode = {' ', reparse('CurrentMode'), ' '}
	mode = colorize(mode, 'user1')

	local line_info = {' ', line_loc(), ' '}
	line_info = colorize(line_info, 'tabline')

	local combined = {}
	append_to_list(combined, mode)
	append_to_list(combined, line_info)
	-- combined[#combined] = unpack(mode, 1, #mode)
	-- table.concat
	--
	P(combined)

	-- local combined = mode  line_info + {' ', reparse('Filename')}
	-- local mode = colorize('user1', '', {' ', ' '}, reparse('CurrentMode'))
	-- local line_info = colorize('tabline', nil, line_loc())
	
	local line = {
		unpack(mode, 1, #mode),
		unpack(line_info),
		' ',
		' ',
		filetype(),
		' | ',
		reparse('GitInfo'),
	}

	-- table.unpack
	-- P()
	print(unpack(mode, 1, #mode))
	local status_str = ''
	vim.opt.statusline = ''
	for _, comp in ipairs(combined) do
		status_str = status_str .. comp
		vim.opt.statusline:append(comp)
	end
end

Statusline()
-- vim.opt.statusline = '%{v:lua.CurrentMode()}'
-- P(CurrentMode())
-- vim.opt.statusline = '%{CurrentMode()}'
-- vim.opt.statusline = '%{%v:lua.statusline()%}'
-- vim.opt.statusline = '%{v:lua.CurrentMode()}'
-- vim.fn.statusline

-- local default = '%<%f %h%m%r%=%-14.(%l,%c%V%) %P'
-- preview(default)
