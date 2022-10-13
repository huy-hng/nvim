local M = {}

Logger = function(logger_name, should_print)
	return function(...)
		local args = {...}
		-- local msg = table.concat(args, ', ')
		if should_print then
			P(logger_name .. ': ' .. args)
		end
	end
end

local log = Logger('helpers', true)


M.preview = function(str)
	local stl = vim.api.nvim_eval_statusline(str, {})
	print(' ')
	print(stl.str)
	print(' ')
	print(stl.width)
end


M.wrap_color = function(color_name)
	return '%#' .. color_name .. '#'
end


M.get_component_length = function(str)
	local stl = vim.api.nvim_eval_statusline(str, {})
	return stl.width
end


M.exec_stored_fn_str = function(fn_index)
	return '%{%v:lua.ExecuteFunction("' .. fn_index .. '")%}'
end


M.reparse = function(fn_name)
	return '%{%v:lua.' .. fn_name .. '()%}'
end


M.append_to_list = function(list1, list2)
	for _, val in ipairs(list2) do
		table.insert(list1, val)
	end
end


M.get_fun_name = function()
	return debug.getinfo(3, 'n').name
end


function user(name, age, hobbies)
	vim.validate {
		name = { name, 'string' },
		age = { age, 'number' },
		hobbies = { hobbies, 'table' },
	}
end

StoredFunctions = {}
function StoreFunction(funref, ...)
	local args = { ... }
	local name = M.get_fun_name()
	StoredFunctions[name] = { funref, args }
	return name
end

function ExecuteFunction(name)
	local stored_fun = StoredFunctions[name]
	local funref = stored_fun[1]
	local args = stored_fun[2]

	return funref()
end


vim.cmd [[
	hi Bold gui=bold cterm=bold guibg=none guifg=none
	hi Italic gui=italic cterm=italic
	hi Underline gui=underline cterm=underline
	hi Inverse gui=inverse cterm=inverse guibg=NONE
	hi Invisible guifg=none guibg=none
	hi Normal guifg=fg guibg=bg
]]


M.create_style = function(name, style)
	-- style should be like in synIDattr()
	--[[ similiar to this
	{
		bold = 1,
		italic = 1,
		['bg#'] = '00ff00',
	}
	]]

	-- check if style alread exists
	-- M.does_highlight_exist(name)

	local style_name = name:gsub('%A','')
	style_name = style_name .. 'asdfghjk'

	vim.api.nvim_set_hl(0, style_name, style)
	return style_name
end


M.get_highlight_color = function(group, term)
	-- if not M.does_highlight_exist(group) then
	-- 	print('no existo' .. group)
	-- 	return nil
	-- end
	local group_id = vim.fn.hlID(group)
	local color = vim.fn.synIDattr(group_id, term)
	-- print(color)
	return color


	-- local output = vim.fn.execute('hi ' .. group)
	-- local match = vim.fn.matchstr(output, term .. [[=\zs\S*]])
	-- return match
end


M.does_highlight_exist = function(name)
    local ok = pcall(vim.fn.execute('hi ' .. name))
	-- P(ok)
	if ok then return true else return false end
end


return M
