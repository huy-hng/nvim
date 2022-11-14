-- package.loaded['statusline.helper_functions'] = nil
-- package.loaded['statusline.class_component'] = nil
-- package.loaded['statusline.data'] = nil
-- package.loaded['user.highlights'] = nil
RELOAD('statusline')
RELOAD('user.highlights')

require('user.highlights')
local helpers = require('statusline.helper_functions')
local Component = require('statusline.class_component')
local data = require('statusline.data')

local function mode()

	local current_mode = function()
		local m = vim.api.nvim_get_mode().mode

		local name = data.mode_names[m]
		if name == nil then
			name = data.mode_names[string.sub(m, 1, 1)]
		end
		return name
	end

	local ref = StoreFunction(current_mode)
	local text = helpers.exec_stored_fn_str(ref)
	-- text = '%8(%-7('..text..'%)%)'
	-- text = '%3(%-2('..text..'%)%)'
	return text
end


local line_loc = function()
	local percent = '%p%%'
	local line_col = '%l:%c'

	local combined = { percent, line_col }
	return table.concat(combined, ' ')
end


local function filename()
	local function get_file_name()
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

	local name = StoreFunction(get_file_name)
	local fun_text = helpers.exec_stored_fn_str(name)

	return fun_text
end


function GitInfo()
	local branch_name = vim.call('fugitive#Head')
	-- P(branch_name)
	if string.len(branch_name) > 0 then
		return ' ' .. branch_name
	end
	return ''
end


-- local function filetype()
-- 	local ft = vim.fn.expand('%:c')
-- 	P(ft)
-- 	return string.lower()
-- end

--==============================================================================
--                                |=> main <=|
--==============================================================================

function create_statusline()
	vim.cmd [[
		highlight StatusLine guibg=bg
		highlight StatusLineNC guibg=bg
	]]

	local bold = { bold = 1 }

	local statusline_table = {}

	local cmp = Component:new(nil, statusline_table)
	local m = mode()
	cmp:add_text(m, bold, 'mode')
	cmp:end_cmp('mode')


	local cmp = Component:new(nil, statusline_table)
	cmp.active_color = 'PmenuSel'
	-- abc.left_padding = ''
	-- abc.right_padding = ''
	cmp:add_text(filename())
	cmp:add_text(GitInfo())
	cmp:end_cmp()


	cmp = Component:new(nil, statusline_table)
	cmp:end_cmp()


	table.insert(statusline_table, '%=')


	cmp = Component:new(nil, statusline_table)
	cmp:add_text('%<%y')
	cmp:end_cmp()

	cmp = Component:new(nil, statusline_table)
	cmp.active_color = 'PmenuSel'
	cmp:add_text('%p%%')
	cmp:end_cmp()


	local ll_style = data.get_opts()
	ll_style.active_color = 'TabLineSel'
	ll_style.delimiter = ':'

	cmp = Component:new(nil, statusline_table)
	cmp.active_color = 'TabLineSel'
	cmp.delimiter = ':'
	cmp:add_text('%l', bold, 'mode')
	cmp:add_text('%02c', bold, 'mode')

	cmp:end_cmp('mode')

	if vim.g.neovide then
		cmp = Component:new(nil, statusline_table)
		cmp:add_text("%{strftime('%H:%M')}", bold)
		cmp:end_cmp()
	end

	statusline_table = table.concat(statusline_table, '')
	return statusline_table
end

vim.opt.showmode = false -- hide current mode (insert, normal, etc)
-- vim.api.nvim_exec('set statusline=%{nvim_get_mode().mode}', '')
vim.api.nvim_exec('set statusline=%!v:lua.create_statusline()', '')
-- create_statusline()
