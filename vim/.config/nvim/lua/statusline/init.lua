package.loaded['statusline.helper_functions'] = nil
package.loaded['statusline.class_component'] = nil
package.loaded['statusline.data'] = nil
package.loaded['user.highlights'] = nil

-- P(package.loaded['statusline.class_component'])
-- P(package.loaded['statusline.helper_functions'])

require('user.highlights')
local helpers = require('statusline.helper_functions')
local Component = require('statusline.class_component')
local data = require('statusline.data')


local function mode()

	local current_mode = function()
		local m = vim.api.nvim_get_mode().mode
		return data.mode_names[m]
	end

	local ref = StoreFunction(current_mode)
	local text = helpers.exec_stored_fn_str(ref)
	-- text = '%8(%-7('..text..'%)%)'
	-- text = '%3(%-2('..text..'%)%)'
	return text

	-- local cmp = CreateComponent({ fun_text }, opts)
	-- return cmp:end_cmp()
end



local line_loc = function()
	local percent = '%p%%'
	local line_col = '%l:%c'

	local combined = { percent, line_col }
	return table.concat(combined, ' ')


	-- return CreateComponent(combined)
	-- return cmp:end_cmp()
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
	vim.cmd [[ highlight StatusLineNC guibg=bg ]]
	vim.cmd [[ highlight StatusLine guibg=bg ]]

	local m = mode()
	local bold = { bold = 1 }
		-- italic = 1,
		-- ['fg#'] = '00ff00',

	local statusline_table = {}


	local cmp = Component:new(nil, statusline_table)
	-- cmp.active_color = 'TabLineSel'
	cmp:add_text(m, bold, 'mode')
	-- cmp.left_padding = ''
	-- cmp.right_padding = ''
	cmp:end_cmp('mode')


	local abc = Component:new(nil, statusline_table)
	abc.active_color = 'PmenuSel'
	-- abc.left_padding = ''
	-- abc.right_padding = ''
	abc:add_text(filename())
	abc:add_text(GitInfo())
	abc:end_cmp()


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


	-- vim.opt.statusline_table = table.concat(statusline_table, '')
	-- local test = table.insert(statusline_table, right_side)

	statusline_table = table.concat(statusline_table, '')
	return statusline_table
end

vim.opt.showmode = false -- hide current mode (insert, normal, etc)
vim.api.nvim_exec('set statusline=%!v:lua.create_statusline()', '')
-- create_statusline()
