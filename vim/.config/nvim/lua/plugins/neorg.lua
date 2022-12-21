local has_neorg, neorg = pcall(R, 'neorg')
if not has_neorg then return end

local function get_marks_in_row(target_row, namespace)
	-- row is 0 indexed
	local marks = vim.api.nvim_buf_get_extmarks(0, namespace, 0, -1, { details = true })
	local matching_rows = {}
	for _, value in ipairs(marks) do
		local id, row, col, details = unpack(value)
		if row == target_row then table.insert(matching_rows, value) end
	end
	return matching_rows
end

local function get_text_from_virt_text(mark)
	local texts = {}
	for _, pair in ipairs(mark) do
		table.insert(texts, pair[1])
	end
	return table.concat(texts, '')
end

local function get_ext_marks()
	local ns = vim.api.nvim_get_namespaces()
	-- P(ns)
	local cb = ns['neorg-code-blocks']
	local cl = ns['neorg-completion-level']
	local co = ns['neorg-conceals']
	local ufo = ns.ufo

	local conceal_extmarks =
		vim.api.nvim_buf_get_extmarks(0, co, 0, -1, { limit = 2, details = true })
	local ufo_extmarks = vim.api.nvim_buf_get_extmarks(0, ufo, 0, -1, { details = true })
	print('-----------------------------------')
	-- for _, value in ipairs(conceal_extmarks) do
	-- 	P(value)
	-- 	-- local extmark = vim.api.nvim_buf_get_extmark_by_id(0, co, value[1], {})
	-- 	-- P(extmark)
	-- end
	for _, value in ipairs(ufo_extmarks) do
		local id, row, col, details = unpack(value)
		local completion_levels = get_marks_in_row(row, cl)
		-- local conceals = get_marks_in_row(row, co)
		local codeblocks = get_marks_in_row(row, cb)
		local conceals = vim.api.nvim_buf_get_extmarks(0, co, 0, -1, { details = true })
		local found = bin_search_row(row, conceals)
		P(found)

		print(' ')
		print(id, row, col, get_text_from_virt_text(details.virt_text))

		if true then return end

		local pco = false
		for _, conceal in ipairs(conceals) do
			local text = get_text_from_virt_text(conceal[4].virt_text)
			if text and not pco then
				print('conceals')
				pco = true
			end
			print(text)
		end

		local pcl = false
		for _, comps in ipairs(completion_levels) do
			local text = get_text_from_virt_text(comps[4].virt_text)
			if text and not pcl then
				print('completion levels')
				pcl = true
			end
			print(text)
		end
		-- local extmark = vim.api.nvim_buf_get_extmark_by_id(0, co, value[1], {})
		-- P(extmark)
	end

	-- vim.api.nvim_buf_get_extmarks
end

Nmap('\\9', get_ext_marks)

neorg.setup {
	load = {
		['core.defaults'] = {},
		['core.norg.concealer'] = {
			config = {
				-- Which icon preset to use
				-- Go to [imports](#imports) to see which ones are currently defined
				-- E.g `core.norg.concealer.preset_diamond` will be `preset = "diamond"`
				-- icon_preset = 'diamond',
				icon_preset = nil,

				-- Configuration for icons: their looks and behaviours are contained here
				icons = {
					todo = {
						enabled = true,

						done = {
							enabled = true,
							icon = '',
							query = '(todo_item_done) @icon',
							extract = function() return 1 end,
						},

						pending = {
							enabled = true,
							icon = '',
							query = '(todo_item_pending) @icon',
							extract = function() return 1 end,
						},

						undone = {
							enabled = true,
							icon = '×',
							query = '(todo_item_undone) @icon',
							extract = function() return 1 end,
						},

						uncertain = {
							enabled = true,
							icon = '',
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
							icon = '⚠',
							query = '(todo_item_urgent) @icon',
							extract = function() return 1 end,
						},
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
						enabled = true,
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
					heading = {
						enabled = true,

						level_1 = {
							enabled = true,
							icon = '◉',
							highlight = '@neorg.headings.1.prefix',
							query = '[ (heading1_prefix) (link_target_heading1) @no-conceal ] @icon',
						},

						level_2 = {
							enabled = true,
							icon = ' ◎',
							highlight = '@neorg.headings.2.prefix',
							query = '[ (heading2_prefix) (link_target_heading2) @no-conceal ] @icon',
						},

						level_3 = {
							enabled = true,
							icon = '  ○',
							highlight = '@neorg.headings.3.prefix',
							query = '[ (heading3_prefix) (link_target_heading3) @no-conceal ] @icon',
						},

						level_4 = {
							enabled = true,
							icon = '   ✺',
							highlight = '@neorg.headings.4.prefix',
							query = '[ (heading4_prefix) (link_target_heading4) @no-conceal ] @icon',
						},

						level_5 = {
							enabled = true,
							icon = '    ▶',
							highlight = '@neorg.headings.5.prefix',
							query = '[ (heading5_prefix) (link_target_heading5) @no-conceal ] @icon',
						},

						level_6 = {
							enabled = true,
							icon = '     ⤷',
							highlight = '@neorg.headings.6.prefix',
							query = '[ (heading6_prefix) (link_target_heading6) @no-conceal ] @icon',
							render = function(self, text)
								return {
									{
										string.rep(
											' ',
											text:len() - string.len('******') - string.len(' ')
										) .. self.icon,
										self.highlight,
									},
								}
							end,
						},
					},
					marker = {
						enabled = true,
						icon = '',
						query = '[ (marker_prefix) (link_target_marker) @no-conceal ] @icon',
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
				},

				-- If you want to dim code blocks
				dim_code_blocks = {
					enabled = true,

					-- If true will only dim the content of the code block,
					-- not the code block itself.
					content_only = true,

					-- Will adapt based on the `conceallevel` option.
					-- If `conceallevel` > 0, then only the content will be dimmed,
					-- else the whole code block will be dimmed.
					adaptive = true,

					-- The width to use for code block backgrounds.
					--
					-- When set to `fullwidth` (the default), will create a background
					-- that spans the width of the buffer.
					--
					-- When set to `content`, will only span as far as the longest line
					-- within the code block.
					width = 'fullwidth',

					-- Additional padding to apply to either the left or the right.
					-- Making these values negative is undefined behaviour (it may work, but
					-- it's not officially supported).
					padding = {
						left = 0,
						right = 0,
					},

					-- If `true` will conceal the `@code` and `@end` portion of the code
					-- block.
					conceal = true,
				},

				folds = true,

				completion_level = {
					-- enabled = true,

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
			},
		},

		['core.integrations.nvim-cmp'] = {
			config = { -- Note that this table is optional and doesn't need to be provided
				-- Configuration here
			},
		},
		['core.norg.dirman'] = {
			config = {
				workspaces = {
					home = '~/personal/neorg',
				},
			},
		},
	},
}
