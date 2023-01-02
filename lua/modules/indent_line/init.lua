----------------------------------------------Config------------------------------------------------

local indent_char = '▏'
local Namespace = vim.api.nvim_create_namespace('IndentLine')

Highlight(0, 'IndentLine', { link = 'Comment' })

----------------------------------------------Copied------------------------------------------------

local get_current_context = function(type_patterns, use_treesitter_scope)
	local invalid = { false, 0, 0, nil }
	local has_ts, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')
	if not has_ts then return unpack(invalid) end

	local locals = require('nvim-treesitter.locals')
	local cursor_node = ts_utils.get_node_at_cursor()

	if use_treesitter_scope then
		local current_scope = locals.containing_scope(cursor_node, 0)
		if not current_scope then return unpack(invalid) end

		local node_start, _, node_end, _ = current_scope:range()

		if node_start == node_end then return unpack(invalid) end

		return true, node_start + 1, node_end + 1, current_scope:type()
	end

	while cursor_node do
		local node_type = cursor_node:type()
		for _, rgx in ipairs(type_patterns) do
			if node_type:find(rgx) then
				local node_start, _, node_end, _ = cursor_node:range()
				if node_start ~= node_end then --
					return true, node_start + 1, node_end + 1, rgx
				end
			end
		end
		cursor_node = cursor_node:parent()
	end

	return unpack(invalid)
end

local context_patterns = {
	'class',
	'^func',
	'method',
	'^if',
	'while',
	'for',
	'with',
	'try',
	'except',
	'arguments',
	'argument_list',
	'object',
	'dictionary',
	'element',
	'table',
	'tuple',
	'do_block',
}

local use_treesitter_scope = false

---------------------------------------------Functions----------------------------------------------

local function set_line(bufnr, column)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	for linenr, line_text in ipairs(lines) do
		local width = vim.fn.strdisplaywidth(line_text)
		if width == 0 then
			goto continue
		end

		::continue::
	end
end

local function get_treesitter(bufnr)
	local has_ts_query, ts_query = pcall(require, 'nvim-treesitter.query')
	local has_ts_indent, ts_indent = pcall(require, 'nvim-treesitter.indent')
	local use_ts_indent = has_ts_query and has_ts_indent and ts_query.has_indents(vim.bo[bufnr].filetype)
	return use_ts_indent, ts_indent
end

local function set_mark(bufnr, row, col, hl)
	-- local spaces = Repeat(' ', col)
	local spaces = ''
	vim.api.nvim_buf_set_extmark(bufnr, Namespace, row, 0, {
		virt_text_hide = false,
		virt_text_win_col = col,
		virt_text = { { spaces .. indent_char, hl } },
		virt_text_pos = 'overlay',
		hl_mode = 'combine',
		-- hl_eol = true,
		priority = 1,
		right_gravity = true,
		end_right_gravity = true,
		end_col = col + 1,
		strict = false,
	})
end

local function should_set_line(line_text, col)
	local spaces = vim.opt.tabstop:get() -- use vim.api.nvim_buf_get_option(bufnr, name) instead?

	line_text = line_text:gsub('\t', string.rep(' ', spaces))
	local char = string.sub(line_text, col, col)
	if char == ' ' or char == '' then return true end
	return false
end

local function set_lines(bufnr)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local use_ts, ts_indent = get_treesitter(bufnr)

	local shiftwidth = vim.bo[bufnr].shiftwidth
	local tabstop = vim.bo[bufnr].tabstop
	local expandtab = vim.bo[bufnr].expandtab

	local tabs = shiftwidth == 0 or not expandtab
	local indent_width = tabs and tabstop or shiftwidth

	for linenr, line_text in ipairs(lines) do
		local whitespace = string.match(line_text, '^%s+') or ''
		local only_whitespace = whitespace == line_text

		-- if not only_whitespace and tabs then
		-- 	goto continue
		-- end

		local total_indent = ts_indent.get_indent(linenr)

		if total_indent == 0 then
			goto continue
		end
		local indent_depth = total_indent / indent_width

		for i = 0, indent_depth - 1 do
			local line_column = i * indent_width
			if should_set_line(line_text, line_column + 1) then
				set_mark(bufnr, linenr - 1, line_column, 'IndentLine')
			end
		end

		::continue::

		-- if not blankline then
		-- 	indent, extra, virtual_string =
		-- 		find_indent(whitespace, only_whitespace, shiftwidth, strict_tabs, list_chars)
		-- end
	end
end

local function get_context()
	local context_status, context_start, context_end, context_pattern = false, 0, 0, nil
	context_status, context_start, context_end, context_pattern =
		get_current_context(context_patterns, use_treesitter_scope)

	-- P(context_status, context_start, context_end, context_pattern)
	local cursor_pos = vim.api.nvim_win_get_cursor(0) -- TODO use winnr?
end

local function clear_lines(bufnr) --
	vim.api.nvim_buf_clear_namespace(bufnr, Namespace, 0, -1)
end

local ft_ignore = {
	'NvimTree',
	'TelescopePrompt',
	'alpha',
}

return function(data)
	local bufnr = data.buf or 0
	clear_lines(bufnr)
	if vim.tbl_contains(ft_ignore, vim.bo[bufnr].filetype) then return end

	set_lines(bufnr)
end
