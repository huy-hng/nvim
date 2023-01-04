local all_icons = {
	todo = {
		enabled = true,
		done = {
			enabled = true,
			icon = '',
			pattern = '^(%s*%-%s+%[%s*)x%s*%]%s+',
			whitespace_index = 1,
			highlight = 'NeorgTodoItemDoneMark',
			padding_before = 0,
		},
		pending = {
			enabled = true,
			icon = '',
			pattern = '^(%s*%-%s+%[%s*)%*%s*%]%s+',
			whitespace_index = 1,
			highlight = 'NeorgTodoItemPendingMark',
			padding_before = 0,
		},
		undone = {
			enabled = true,
			icon = '×',
			pattern = '^(%s*%-%s+%[)%s+]%s+',
			whitespace_index = 1,
			highlight = 'TSComment',
			padding_before = 0,
		},

		-- done = {
		-- 	enabled = true,
		-- 	icon = '',
		-- 	query = '(todo_item_done) @icon',
		-- 	extract = function() return 1 end,
		-- },
		-- pending = {
		-- 	enabled = true,
		-- 	icon = '',
		-- 	query = '(todo_item_pending) @icon',
		-- 	extract = function() return 1 end,
		-- },
		-- undone = {
		-- 	enabled = true,
		-- 	icon = '×',
		-- 	query = '(todo_item_undone) @icon',
		-- 	extract = function() return 1 end,
		-- },
		uncertain = {
			enabled = true,
			icon = '?',
			-- icon = ' ',
			query = '(todo_item_uncertain) @icon',
			extract = function() return 1 end,
		},
		on_hold = {
			enabled = true,
			icon = '',
			query = '(todo_item_on_hold) @icon',
			extract = function() return 1 end,
		},
		cancelled = {
			enabled = true,
			icon = '',
			query = '(todo_item_cancelled) @icon',
			extract = function() return 1 end,
		},
		recurring = {
			enabled = true,
			icon = '↺',
			query = '(todo_item_recurring) @icon',
			extract = function() return 1 end,
		},
		urgent = {
			enabled = true,
			icon = '!',
			-- icon = '⚠',
			query = '(todo_item_urgent) @icon',
			extract = function() return 1 end,
		},
	},
	quote = {
		enabled = true,
		icon = '∣',
		pattern = '^(%s*)>%s+',
		whitespace_index = 1,
		highlight = 'NeorgQuote',
		padding_before = 0,
	},
	heading = {
		enabled = false,

		level_1 = {
			enabled = true,
			icon = '◉',
			pattern = '^(%s*)%*%s+',
			whitespace_index = 1,
			highlight = 'NeorgHeading1',
			padding_before = 0,
		},

		level_2 = {
			enabled = true,
			icon = '○',
			pattern = '^(%s*)%*%*%s+',
			whitespace_index = 1,
			highlight = 'NeorgHeading2',
			padding_before = 1,
		},

		level_3 = {
			enabled = true,
			icon = '✿',
			pattern = '^(%s*)%*%*%*%s+',
			whitespace_index = 1,
			highlight = 'NeorgHeading3',
			padding_before = 2,
		},

		level_4 = {
			enabled = true,
			icon = '•',
			pattern = '^(%s*)%*%*%*%*%s+',
			whitespace_index = 1,
			highlight = 'NeorgHeading4',
			padding_before = 3,
		},

		-- level_1 = {
		-- 	enabled = true,
		-- 	icon = '◉',
		-- 	highlight = '@neorg.headings.1.prefix',
		-- 	query = '[ (heading1_prefix) (link_target_heading1) @no-conceal ] @icon',
		-- },

		-- level_2 = {
		-- 	enabled = true,
		-- 	icon = ' ◎',
		-- 	highlight = '@neorg.headings.2.prefix',
		-- 	query = '[ (heading2_prefix) (link_target_heading2) @no-conceal ] @icon',
		-- },

		-- level_3 = {
		-- 	enabled = true,
		-- 	icon = '  ○',
		-- 	highlight = '@neorg.headings.3.prefix',
		-- 	query = '[ (heading3_prefix) (link_target_heading3) @no-conceal ] @icon',
		-- },

		-- level_4 = {
		-- 	enabled = true,
		-- 	icon = '   ✺',
		-- 	highlight = '@neorg.headings.4.prefix',
		-- 	query = '[ (heading4_prefix) (link_target_heading4) @no-conceal ] @icon',
		-- },

		-- level_5 = {
		-- 	enabled = true,
		-- 	icon = '    ▶',
		-- 	highlight = '@neorg.headings.5.prefix',
		-- 	query = '[ (heading5_prefix) (link_target_heading5) @no-conceal ] @icon',
		-- },

		-- level_6 = {
		-- 	enabled = true,
		-- 	icon = '     ⤷',
		-- 	highlight = '@neorg.headings.6.prefix',
		-- 	query = '[ (heading6_prefix) (link_target_heading6) @no-conceal ] @icon',
		-- 	render = function(self, text)
		-- 		return {
		-- 			{
		-- 				string.rep(
		-- 					' ',
		-- 					text:len() - string.len('******') - string.len(' ')
		-- 				) .. self.icon,
		-- 				self.highlight,
		-- 			},
		-- 		}
		-- 	end,
		-- },
	},
	marker = {
		enabled = true,
		icon = '',
		pattern = '^(%s*)%|%s+',
		whitespace_index = 1,
		highlight = 'NeorgMarker',
		padding_before = 0,
		-- query = '[ (marker_prefix) (link_target_marker) @no-conceal ] @icon',
	},
	list = {
		enabled = true,
		level_1 = {
			enabled = true,
			icon = '•',
			query = '(unordered_list1_prefix) @icon',
		},
		level_2 = {
			enabled = true,
			icon = ' •',
			query = '(unordered_list2_prefix) @icon',
		},
		level_3 = {
			enabled = true,
			icon = '  •',
			query = '(unordered_list3_prefix) @icon',
		},
		level_4 = {
			enabled = true,
			icon = '   •',
			query = '(unordered_list4_prefix) @icon',
		},
		level_5 = {
			enabled = true,
			icon = '    •',
			query = '(unordered_list5_prefix) @icon',
		},
		level_6 = {
			enabled = true,
			icon = '     •',
			query = '(unordered_list6_prefix) @icon',
		},
	},
	link = {
		enabled = false,
		level_1 = {
			enabled = true,
			icon = ' ',
			query = '(unordered_link1_prefix) @icon',
		},
		level_2 = {
			enabled = true,
			icon = '  ',
			query = '(unordered_link2_prefix) @icon',
		},
		level_3 = {
			enabled = true,
			icon = '   ',
			query = '(unordered_link3_prefix) @icon',
		},
		level_4 = {
			enabled = true,
			icon = '    ',
			query = '(unordered_link4_prefix) @icon',
		},
		level_5 = {
			enabled = true,
			icon = '     ',
			query = '(unordered_link5_prefix) @icon',
		},
		level_6 = {
			enabled = true,
			icon = '      ',
			query = '(unordered_link6_prefix) @icon',
		},
	},
	definition = {
		enabled = true,

		single = {
			enabled = true,
			icon = '≡',
			query = '[ (single_definition_prefix) (link_target_definition) @no-conceal ] @icon',
		},
		multi_prefix = {
			enabled = true,
			icon = '⋙ ',
			query = '(multi_definition_prefix) @icon',
		},
		multi_suffix = {
			enabled = true,
			icon = '⋘ ',
			query = '(multi_definition_suffix) @icon',
		},
	},
	footnote = {
		enabled = true,

		single = {
			enabled = true,
			icon = '⁎',
			query = '[ (single_footnote_prefix) (link_target_footnote) @no-conceal ] @icon',
		},
		multi_prefix = {
			enabled = true,
			icon = '⁑ ',
			query = '(multi_footnote_prefix) @icon',
		},
		multi_suffix = {
			enabled = true,
			icon = '⁑ ',
			query = '(multi_footnote_suffix) @icon',
		},
	},
	markup = {
		enabled = true,

		spoiler = {
			enabled = true,
			icon = '•',
			highlight = '@neorg.markup.spoiler',
			query = '(spoiler ("_open") _ @icon ("_close"))',
			render = function(self, text)
				return { { string.rep(self.icon, text:len()), self.highlight } }
			end,
		},
	},
}

-- - (x) Done
-- ^(%s*%-%s+%[%s*)x%s*%]%s+

-- - ( ) Undone
-- ^(%s*%-%s+%[)%s+]%s+
-- %s* -> zero or more spaces
-- %- -> one dash
-- %s+ -> one or more spaces

-- - (-) pending
-- ^(%s*%-%s+%[%s*)%*%s*%]%s+
-- ^ (%s* %- %s+ %[%s*) %* %s* %]%s+

-- pending %s* %- %s+ %[ %s*) %* %s* %] %s+
-- done    %s* %- %s+ %[ %s*) x  %s* %] %s+
-- undone  %s* %- %s+ %[    )    %s+  ] %s+

local icons = {
	heading = {
		level_2 = {
			enabled = true,
			icon = '○',
			pattern = '^(%s*)%*%*%s+',
			whitespace_index = 1,
			highlight = 'NeorgHeading2',
			padding_before = 1,
		},
		-- level_3 = {
		-- 	enabled = true,
		-- 	icon = '◦',
		-- 	pattern = '^(%s*)%*%*%*%s+',
		-- 	whitespace_index = 0,
		-- 	highlight = 'TSBoolean',
		-- 	padding_before = 2,
		-- },
		-- level_5 = {
		-- 	enabled = true,
		-- 	icon = '◦',
		-- 	pattern = '^(%s*)%*%*%*%*%*%s+',
		-- 	whitespace_index = 0,
		-- 	highlight = 'TSBoolean',
		-- 	padding_before = 4,
		-- },
	},

	quote = {
		enabled = true,
		icon = '∣',
		pattern = '^(%s+)>%s+',
		whitespace_index = 2,
		highlight = 'NeorgQuote',
		padding_before = 1,
	},

	list = {
		enabled = true,
		level_1 = {
			enabled = true,
			icon = '•',
			query = '(unordered_list1_prefix) @icon',
		},
		level_2 = {
			enabled = true,
			icon = ' •',
			query = '(unordered_list2_prefix) @icon',
		},
		level_3 = {
			enabled = true,
			icon = '  •',
			query = '(unordered_list3_prefix) @icon',
		},
		level_4 = {
			enabled = true,
			icon = '   •',
			query = '(unordered_list4_prefix) @icon',
		},
		level_5 = {
			enabled = true,
			icon = '    •',
			query = '(unordered_list5_prefix) @icon',
		},
		level_6 = {
			enabled = true,
			icon = '     •',
			query = '(unordered_list6_prefix) @icon',
		},
	},
}

return {
	icon_preset = 'basic', -- basic diamond varied

	-- Configuration for icons: their looks and behaviours are contained here
	-- icons = icons,

	-- If you want to dim code blocks
	dim_code_blocks = {
		enabled = true,

		-- If true will only dim the content of the code block,
		-- not the code block itself.
		content_only = true,

		-- Will adapt based on the `conceallevel` option.
		-- If `conceallevel` > 0, then only the content will be dimmed,
		-- else the whole code block will be dimmed.
		adaptive = false,

		-- The width to use for code block backgrounds.
		--
		-- When set to `fullwidth` (the default), will create a background
		-- that spans the width of the buffer.
		--
		-- When set to `content`, will only span as far as the longest line
		-- within the code block.
		width = 'content',

		-- Additional padding to apply to either the left or the right.
		-- Making these values negative is undefined behaviour (it may work, but
		-- it's not officially supported).
		padding = {
			left = 2,
			right = 2,
		},

		-- If `true` will conceal the `@code` and `@end` portion of the code
		-- block.
		conceal = true,
	},

	folds = true,

	completion_level = {
		enabled = true,

		-- queries = vim.tbl_deep_extend(
		-- 	'keep',
		-- 	{},
		-- 	(function()
		-- 		local result = {}

		-- 		for i = 1, 6 do
		-- 			result['heading' .. i] = {
		-- 				text = {
		-- 					'(',
		-- 					{ '<done>', '@field' },
		-- 					' of ',
		-- 					{ '<total>', '@neorg.todo_items.done.1' },
		-- 					') [<percentage>% complete]',
		-- 				},

		-- 				highlight = 'DiagnosticVirtualTextHint',
		-- 			}
		-- 		end

		-- 		return result
		-- 	end)()
		-- 	-- (function()
		-- 	-- 	local result = {}

		-- 	-- 	for i = 1, 6 do
		-- 	-- 		result['todo_item' .. i] = {
		-- 	-- 			text = '[<done>/<total>]',
		-- 	-- 			highlight = 'DiagnosticVirtualTextHint',
		-- 	-- 		}
		-- 	-- 	end

		-- 	-- 	return result
		-- 	-- end)()
		-- ),
	},

	performance = {
		increment = 1250,
		timeout = 0,
		interval = 500,
		max_debounce = 5,
	},
}
