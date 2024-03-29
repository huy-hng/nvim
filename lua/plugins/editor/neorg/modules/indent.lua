-- local indent = require('neorg.modules.core.esupports.indent.module')

local config = {
	format_on_enter = true,
	format_on_escape = true,
	tweaks = {
		unordered_list1 = 0,
		unordered_list2 = 1,
		unordered_list3 = 2,
		unordered_list4 = 3,
		unordered_list5 = 4,
		heading1 = 0,
		heading2 = 1,
		heading3 = 2,
		heading4 = 3,
		heading5 = 4,
	},
	-- indents = {
		-- _ = {
		-- 	modifiers = { 'under-headings' },
		-- 	indent = 2,
		-- },
	-- },
	-- modifiers = {
	-- 	['under-headings'] = function(_, node)
	-- 		local treesitter = indent.required['core.integrations.treesitter']
	-- 		-- print('under-headings')
	-- 		local heading = treesitter.find_parent(node:parent(), 'heading%d')

	-- 		if not heading or not heading:named_child(1) then return 0 end

	-- 		return treesitter.get_node_range(heading:named_child(1)).column_start
	-- 	end,

	-- 	['under-nestable-detached-modifiers'] = function(_, node)
	-- 		-- print('under-nestable-detached-modifiers')
	-- 		local treesitter = indent.required['core.integrations.treesitter']
	-- 		local list = treesitter.find_parent(node, {
	-- 			'unordered_list1',
	-- 			'unordered_list2',
	-- 			'unordered_list3',
	-- 			'unordered_list4',
	-- 			'unordered_list5',
	-- 			'unordered_list6',
	-- 			'ordered_list1',
	-- 			'ordered_list2',
	-- 			'ordered_list3',
	-- 			'ordered_list4',
	-- 			'ordered_list5',
	-- 			'ordered_list6',
	-- 			'quote1',
	-- 			'quote2',
	-- 			'quote3',
	-- 			'quote4',
	-- 			'quote5',
	-- 			'quote6',
	-- 		})

	-- 		if not list or not list:named_child(1) then return 0 end

	-- 		return treesitter.get_node_range(list:named_child(1)).column_start
	-- 	end,
	-- },
}

return { config = config }
