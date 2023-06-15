local ts_utils = require('nvim-treesitter.ts_utils')
local locals = require('nvim-treesitter.locals')

Augroup('Treesitter', {
	-- Autocmd('CursorMoved', function()
	-- 	local statusline = ts.statusline {
	-- 		indicator_size = 100,
	-- 		type_patterns = { 'class', 'function', 'method' },
	-- 		transform_fn = function(line) return line:gsub('%s*[%[%(%{]*%s*$', '') end,
	-- 		separator = ' -> ',
	-- 	}
	-- 	print(statusline)
	-- end),
}, true, true)

local namespace = vim.api.nvim_create_namespace('Treesitter')

local function node_information(node)
	local type = node:type()
	local range = node:range()
	local num_children = node:child_count()
	P(type, num_children, range)
end

local function goto_node(node)
	ts_utils.goto_node(node)
	node_information(node)

	nvim.schedule(function()
		ts_utils.highlight_node(node, 0, namespace, 'Visual')

		CreateAutocmd('CursorMoved', '*', function()
			vim.api.nvim_buf_clear_namespace(0, namespace, 0, -1)
			return true
		end, { group = 'Treesitter' })
	end)
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

local function get_current_context()
	local cursor_node = ts_utils.get_node_at_cursor()
	if not cursor_node then return end

	local cursor_start, _, cursor_end, _ = cursor_node:range()

	local parent = cursor_node:parent()

	print(' ')
	while parent do
		local node_type = parent:type()
		print(node_type)
		for _, pattern in ipairs(context_patterns) do
			if node_type:find(pattern) then
				local node_start, _, node_end, _ = parent:range()
				if node_start ~= node_end and cursor_start ~= node_start then --
					goto_node(parent)
					return
				end
			end
		end
		parent = parent:parent()
	end
end

local function go_to_parent()
	local cursor_node = ts_utils.get_node_at_cursor()
	if not cursor_node then return end
	local parent = cursor_node:parent()
	if not parent then return end
	node_information(parent)
	goto_node(parent)
end

local function get_parent()
	local cursor_node = ts_utils.get_node_at_cursor()
	local current_scope = locals.containing_scope(cursor_node, 0)
	if not current_scope then return end
	node_information(current_scope)

	local node_start, _, node_end, _ = current_scope:range()

	if node_start == node_end then return end

	P(node_start + 1, node_end + 1, current_scope:type())
	goto_node(current_scope)
end

local function go_to_sibling(direction)
	local cursor_node = ts_utils.get_node_at_cursor()

	local sibling
	if direction > 0 then
		sibling = locals.next_scope(cursor_node)
		-- sibling = ts_utils.get_next_node(cursor_node, true, true)
	else
		sibling = locals.previous_scope(cursor_node)
		-- sibling = ts_utils.get_previous_node(cursor_node, true, true)
	end

	if not sibling then return end
	goto_node(sibling)

	-- ts_utils.swap_nodes()

	-- if not sibling then return end
	-- local row, col, _ = sibling:start()
	-- print(row, col)

	-- vim.api.nvim_win_set_cursor(0, { row + 1, col })
end

-- Nmap('\\4', go_to_parent)
-- Nmap('\\5', get_parent)
-- Nmap('\\6', get_current_context)
-- Nmap('\\-', { go_to_sibling, -1 })
-- Nmap('\\=', { go_to_sibling, 1 })
return {}
