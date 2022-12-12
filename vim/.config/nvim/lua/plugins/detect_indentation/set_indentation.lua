local M = {}

function M.set_width(width, bufnr)
	if not width then return end
	BO(bufnr, 'tabstop', width)
	BO(bufnr, 'shiftwidth', width)
end

local function set_indent_type(expand, width, bufnr)
	BO(bufnr, 'expandtab', expand)
	M.set_width(width, bufnr)
end

function M.set_tabs(width, bufnr)
	set_indent_type(false, width, bufnr)
end

function M.set_spaces(width, bufnr)
	set_indent_type(true, width, bufnr)
end

function M.toggle_indent_type(bufnr)
	local expand = not BO(bufnr, 'expandtab')
	set_indent_type(expand, nil, bufnr)
end

local function_map = {
	tabs = M.set_tabs,
	spaces = M.set_spaces,
}

local function check_validity(type, width)
	local valid_types = vim.tbl_keys(function_map)

	local function is_valid(arg) return vim.tbl_contains(valid_types, arg) end

	vim.validate {
		type = { type, is_valid, 'one of ' .. vim.inspect(valid_types) },
		width = { width, 'number' },
	}
end

function ChangeIndentation(data) --
	local args = data.fargs

	local type = args[1]
	local width = tonumber(args[2])

	check_validity(type, width)

	local fn = function_map[type]
	fn(width)
end

Commander('Indent', ChangeIndentation, {
	nargs = '+',
	complete = function(arg_lead, cmdline, cursor_pos)
		if arg_lead == '' then --
			return vim.tbl_keys(function_map)
		end
	end,
})

return M
