----------------------------------------------Config------------------------------------------------

local indent_char = '▏'
local namespace = vim.api.nvim_create_namespace('IndentLine')

vim.api.nvim_set_hl(0, 'IndentLine', {
	fg = '#45475a',
	-- sp = 'red',
	-- link = 'Whitespace',
	-- bg = 'black',
	-- blend = 100,
})
----------------------------------------------Copied------------------------------------------------

local find_indent = function(whitespace, only_whitespace, shiftwidth, strict_tabs, list_chars)
	local indent = 0
	local spaces = 0
	local tab_width
	local virtual_string = {}

	if whitespace then
		for ch in whitespace:gmatch('.') do
			if ch == '\t' then
				if strict_tabs and indent == 0 and spaces ~= 0 then return 0, false, {} end
				indent = indent + math.floor(spaces / shiftwidth) + 1
				spaces = 0
				-- replace dynamic-width tab with fixed-width string (ta..ab)
				tab_width = shiftwidth - table.maxn(virtual_string) % shiftwidth
				-- check if tab_char_end is set, see :help listchars
				if list_chars['tab_char_end'] then
					if tab_width == 1 then
						table.insert(virtual_string, list_chars['tab_char_end'])
					else
						table.insert(virtual_string, list_chars['tab_char_start'])
						for _ = 1, (tab_width - 2) do
							table.insert(virtual_string, list_chars['tab_char_fill'])
						end
						table.insert(virtual_string, list_chars['tab_char_end'])
					end
				else
					table.insert(virtual_string, list_chars['tab_char_start'])
					for _ = 1, (tab_width - 1) do
						table.insert(virtual_string, list_chars['tab_char_fill'])
					end
				end
			else
				if strict_tabs and indent ~= 0 then
					-- return early when no more tabs are found
					return indent, true, virtual_string
				end
				if only_whitespace then
					-- if the entire line is only whitespace use trail_char instead of lead_char
					table.insert(virtual_string, list_chars['trail_char'])
				else
					table.insert(virtual_string, list_chars['lead_char'])
				end
				spaces = spaces + 1
			end
		end
	end

	return indent + math.floor(spaces / shiftwidth),
		table.maxn(virtual_string) % shiftwidth ~= 0,
		virtual_string
end

local get_current_context = function(type_patterns, use_treesitter_scope)
	local has_ts, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')
	if not has_ts then return false end

	local locals = require('nvim-treesitter.locals')
	local cursor_node = ts_utils.get_node_at_cursor()

	if use_treesitter_scope then
		local current_scope = locals.containing_scope(cursor_node, 0)
		if not current_scope then return false end

		local node_start, _, node_end, _ = current_scope:range()

		if node_start == node_end then return false end

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

	return false
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

local function get_virtual_text(
	indent,
	extra,
	blankline,
	context_active,
	context_indent,
	prev_indent,
	virtual_string
)
	local virtual_text = {}
	local current_left_offset = left_offset
	local local_max_indent_level = math.min(max_indent_level, prev_indent + max_indent_increase)

	local indent_char = blankline and char_blankline and char_blankline or char
	local context_indent_char = blankline and context_char_blankline and context_char_blankline
		or context_char
	local indent_char_list = blankline and #char_list_blankline > 0 and char_list_blankline
		or char_list
	local context_indent_char_list = blankline
			and #context_char_list_blankline > 0
			and context_char_list_blankline
		or context_char_list

	for i = 1, indent do
		local space_count = shiftwidth
		local context = context_active and context_indent == i
		local show_indent_char = (i ~= 1 or first_indent) and indent_char ~= ''
		local show_context_indent_char = context
			and (i ~= 1 or first_indent)
			and context_indent_char ~= ''
		local show_end_of_line_char = i == 1
			and blankline
			and end_of_line
			and list_chars['eol_char']
		local show_indent_or_eol_char = show_indent_char
			or show_context_indent_char
			or show_end_of_line_char
		if show_indent_or_eol_char then
			space_count = space_count - 1
			if current_left_offset > 0 then
				current_left_offset = current_left_offset - 1
			else
				table.insert(virtual_text, {
					utils._if(
						show_end_of_line_char,
						list_chars['eol_char'],
						utils._if(
							context,
							utils.get_from_list(
								context_indent_char_list,
								i - utils._if(not first_indent, 1, 0),
								context_indent_char
							),
							utils.get_from_list(
								indent_char_list,
								i - utils._if(not first_indent, 1, 0),
								indent_char
							)
						)
					),
					utils._if(
						context,
						utils._if(
							context_pattern_highlight[context_pattern],
							context_pattern_highlight[context_pattern],
							utils.get_from_list(context_highlight_list, i, context_highlight)
						),
						utils.get_from_list(char_highlight_list, i, char_highlight)
					),
				})
			end
		end
		if current_left_offset > 0 then
			local current_space_count = space_count
			space_count = space_count - current_left_offset
			current_left_offset = current_left_offset - current_space_count
		end
		if space_count > 0 then
			-- ternary operator below in table.insert() doesn't work because it would evaluate each option regardless
			local tmp_string
			local index = 1 + (i - 1) * shiftwidth
			if show_indent_or_eol_char then
				if table.maxn(virtual_string) >= index + space_count then
					-- first char was already set above
					tmp_string = table.concat(virtual_string, '', index + 1, index + space_count)
				end
			else
				if table.maxn(virtual_string) >= index + space_count - 1 then
					tmp_string = table.concat(virtual_string, '', index, index + space_count - 1)
				end
			end
			table.insert(virtual_text, {
				utils._if(
					tmp_string,
					tmp_string,
					utils
						._if(blankline, space_char_blankline, list_chars['lead_char'])
						:rep(space_count)
				),
				utils._if(
					blankline,
					utils.get_from_list(
						space_char_blankline_highlight_list,
						i,
						space_char_blankline_highlight
					),
					utils.get_from_list(
						space_char_highlight_list,
						i,
						utils._if(context, context_space_char_highlight, space_char_highlight)
					)
				),
			})
		end
	end

	local index = math.ceil(#virtual_text / 2) + 1
	local extra_context_active = context_active and context_indent == index

	if
		(
			(indent_char ~= '' or #indent_char_list > 0)
			or (extra_context_active and (context_indent_char ~= '' or #context_char_list > 0))
		)
		and ((blankline or extra) and trail_indent)
		and (first_indent or #virtual_text > 0)
		and current_left_offset < 1
		and indent < local_max_indent_level
	then
		table.insert(virtual_text, {
			utils._if(
				extra_context_active,
				utils.get_from_list(
					context_indent_char_list,
					index - utils._if(not first_indent, 1, 0),
					context_indent_char
				),
				utils.get_from_list(
					indent_char_list,
					index - utils._if(not first_indent, 1, 0),
					indent_char
				)
			),
			utils._if(
				extra_context_active,
				utils.get_from_list(context_highlight_list, index, context_highlight),
				utils.get_from_list(char_highlight_list, index, char_highlight)
			),
		})
	end

	return virtual_text
end

local function check_if_indent(ts_indent, linenr)
	local indent = ts_indent.get_indent(i + offset) or 0
	-- utils.clear_line_indent(bufnr, i + offset)

	if
		context_first_line
		and show_current_context_start
		and (show_current_context_start_on_current_line or lnum ~= context_start)
	then
		if not vim.api.nvim_buf_is_loaded(bufnr) then return end
		vim.api.nvim_buf_set_extmark(bufnr, namespace, context_start - 1, #whitespace, {
			end_col = #lines[i],
			hl_group = 'IndentBlanklineContextStart',
			priority = context_start_priority,
		})
	end

	if indent == 0 then return end

	indent = indent / shiftwidth
	if context_first_line then context_indent = indent + 1 end

	if not vim.api.nvim_buf_is_loaded(bufnr) then return end
	local virtual_text = get_virtual_text(
		indent,
		false,
		blankline,
		context_active,
		context_indent,
		max_indent_level,
		{}
	)
	vim.api.nvim_buf_set_extmark(bufnr, namespace, linenr, 0, {
		virt_text = virtual_text,
		virt_text_pos = 'overlay',
		hl_mode = 'combine',
		priority = char_priority,
	})
end

---------------------------------------------Functions----------------------------------------------

local function set_line(bufnr, column)
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	for linenr, line_text in ipairs(lines) do
		local width = vim.fn.strdisplaywidth(line_text)
		if width == 0 then
			-- print(linenr, 'line empty')
			goto continue
		end

		::continue::
	end
end

local function get_treesitter(bufnr)
	local has_ts_query, ts_query = pcall(require, 'nvim-treesitter.query')
	local has_ts_indent, ts_indent = pcall(require, 'nvim-treesitter.indent')
	local use_ts_indent = has_ts_query
		and has_ts_indent
		and ts_query.has_indents(BO(bufnr, 'filetype'))
	return use_ts_indent, ts_indent
end

local function set_lines(bufnr)
	-- local context_status, context_start, context_end, context_pattern = false, 0, 0, nil
	-- context_status, context_start, context_end, context_pattern =
	-- 	get_current_context(context_patterns, use_treesitter_scope)

	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local use_ts, ts_indent = get_treesitter(bufnr)
	local shiftwidth = BO(bufnr, 'shiftwidth')
	local tabstop = BO(bufnr, 'tabstop')
	local expandtab = BO(bufnr, 'expandtab')

	local tabs = shiftwidth == 0 or not expandtab
	local indent_width = tabs and tabstop or shiftwidth

	for linenr, line_text in ipairs(lines) do
		local whitespace = string.match(line_text, '^%s+') or ''
		local only_whitespace = whitespace == line_text

		if not only_whitespace and tabs then
			goto continue
		end

		local total_indent = ts_indent.get_indent(linenr)
		local indent_depth = total_indent / indent_width

		for i = 0, indent_depth - 1 do
			local line_column = i * indent_width

			vim.api.nvim_buf_set_extmark(bufnr, namespace, linenr - 1, 0, {
				virt_text_win_col = line_column,
				virt_text = { { indent_char, 'ColorColumn' } },
				virt_text_pos = 'overlay',
				hl_mode = 'combine',
				priority = 1,
			})
		end

		::continue::

		-- if not blankline then
		-- 	indent, extra, virtual_string =
		-- 		find_indent(whitespace, only_whitespace, shiftwidth, strict_tabs, list_chars)
		-- end
	end
end

local function clear_lines(bufnr) --
	vim.api.nvim_buf_clear_namespace(bufnr, namespace, 0, -1)
end

local function refresh(data)
	local bufnr = data.buf or 0
	clear_lines(bufnr)
	set_lines(bufnr)
end

-----------------------------------------------Setup------------------------------------------------

local function create_autocmds()
	augroup('IndentLine', true, {
		autocmd({
			'FileChangedShellPost',
			'TextChanged',
			'TextChangedI',
			'CompleteChanged',
			'BufWinEnter',
			'VimEnter',
			'SessionLoadPost',
		}, '*', refresh),
		autocmd(
			'OptionSet',
			{ 'list', 'listchars', 'shiftwidth', 'tabstop', 'expandtab' },
			refresh
		),
	})
end

create_autocmds()
