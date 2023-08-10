---@diagnostic disable: undefined-global

local utils = require('plugins.coding.snippets.utils')

local function comment() return vim.bo.commentstring:gsub(' %%s', '') end

local function calc_length(args, divider_len)
	local text = args[1][1] or ''

	local text_len = vim.fn.strdisplaywidth(text)

	local indent_level = vim.fn.indent(vim.fn.line('.'))
	return (divider_len - text_len - indent_level - #comment()) / 2
end

local function divider(args, parent, side, char, divider_len)
	-- P(side, char, divider_len)
	local length = calc_length(args, divider_len)
	return Repeat(char, side(length))
end

local sides = {
	right = math.ceil,
	left = math.floor,
}

local function create_divider_snippet(char, divider_len)
	return sn(nil, {
		f(divider, { 1 }, { user_args = { sides.left, char, divider_len } }),
		r(1, 'user_text'),
		f(divider, { 1 }, { user_args = { sides.right, char, divider_len } }),
	})
end

local function div_choices(char_vars, len_vars)
	local variations = {}
	for _, divider_len in ipairs(len_vars) do
		for _, char in ipairs(char_vars) do
			table.insert(variations, create_divider_snippet(char, divider_len))
		end
	end
	return variations
end

return {
	snippet('---', {
		f(comment),
		c(1, div_choices({ '-', '=' }, { 100, 50 })),
		utils.newline(),
		i(0, ''),
	}),
}
