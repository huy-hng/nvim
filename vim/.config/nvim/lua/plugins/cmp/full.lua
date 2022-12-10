local val_1 = {
	cache = {
		entries = {
			get_completion_item = {
				data = {
					auto = false,
					filetype = 'lua',
					show_condition = 'function 1',
					snip_id = 6,
				},
				kind = 15,
				label = 'ignore',
				word = 'ignore',
			},
			get_filter_text = 'ignore',
			get_offset = 2,
			get_word = 'ignore',
		},
		metatable = {
			__index = {
				clear = 'function 2',
				ensure = 'function 3',
				get = 'function 4',
				key = 'function 5',
				new = 'function 6',
				set = 'function 7',
			},
		},
	},
	completion_item = 'table 2',
	confirmed = false,
	context = {
		bufnr = 2,
		cache = {
			entries = {
				['get_offset:.*:g.'] = 1,
				['get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\%(-\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\)*\\):g.'] = 3,
				['get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\w*\\%(-\\w*\\)*\\):g.'] = 3,
				["get_offset:\\%([^/\\\\:\\*?'''\"`\\|]\\)*:g."] = 1,
				['get_offset:\\%([^[:alnum:][:blank:]]\\|\\w\\+\\):g.'] = 2,
				['get_offset:\\%(\\V(\\m\\|\\V,\\m\\|\\V \\m\\)\\s*\\zs:g.'] = 3,
				['get_offset:\\w\\+:g.'] = 3,
			},
			metatable = {
				__index = 'table 3',
			},
		},
		cursor = {
			character = 2,
			col = 3,
			line = 63,
			row = 64,
		},
		cursor_after_line = '',
		cursor_before_line = 'g.',
		cursor_line = 'g.',
		filetype = 'lua',
		id = 3367,
		option = {
			reason = 'auto',
		},
		prev_context = {
			bufnr = 2,
			cursor = {
				character = 15,
				col = 16,
				line = 63,
				row = 64,
			},
			cursor_after_line = '',
			cursor_before_line = 'g.gui_font_face',
			cursor_line = 'g.gui_font_face',
			filetype = 'lua',
			id = 3366,
			option = {},
			time = 68254930,
		},
		time = 68256631,
		metatable = {
			__index = {
				changed = 'function 8',
				clone = 'function 9',
				empty = 'function 10',
				get_offset = 'function 11',
				get_reason = 'function 12',
				new = 'function 13',
			},
		},
	},
	exact = false,
	id = 142707,
	match_cache = {
		entries = {},
		metatable = {
			__index = 'table 3',
		},
	},
	matches = {},
	resolved_callbacks = {},
	resolving = false,
	score = 0,
	source = {
		cache = {
			entries = {
				['get_default_insert_range:256'] = {
					['end'] = {
						character = 2,
						line = 63,
					},
					start = {
						character = 1,
						line = 63,
					},
				},
				['get_default_replace_range:256'] = {
					['end'] = {
						character = 2,
						line = 63,
					},
					start = {
						character = 2,
						line = 63,
					},
				},
			},
			metatable = {
				__index = 'table 3',
			},
		},
		complete_dedup = 'function 14',
		completion_context = {
			triggerKind = 1,
		},
		context = 'table 4',
		entries = {
			'table 1',
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'lua',
								show_condition = 'function 1',
								snip_id = 7,
							},
							kind = 15,
							label = 'req',
							word = 'req',
						},
						get_offset = 2,
						get_word = 'req',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 8',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142708,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = {
						convert_position_encoding = 'function 15',
						execute = 'function 16',
						fill_defaults = 'function 17',
						get_commit_characters = 'function 18',
						get_completion_item = 'function 19',
						get_documentation = 'function 20',
						get_filter_text = 'function 21',
						get_insert_range = 'function 22',
						get_insert_text = 'function 23',
						get_kind = 'function 24',
						get_offset = 'function 25',
						get_overwrite = 'function 26',
						get_replace_range = 'function 27',
						get_view = 'function 28',
						get_vim_item = 'function 29',
						get_word = 'function 30',
						is_deprecated = 'function 31',
						match = 'function 32',
						new = 'function 33',
						resolve = 'function 34',
					},
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'lua',
								show_condition = 'function 1',
								snip_id = 8,
							},
							kind = 15,
							label = 'preq',
							word = 'preq',
						},
						get_offset = 2,
						get_word = 'preq',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 10',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142709,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 0,
							},
							kind = 15,
							label = 'cond',
							word = 'cond',
						},
						get_offset = 2,
						get_word = 'cond',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 11',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142710,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 1,
							},
							kind = 15,
							label = 'ternary',
							word = 'ternary',
						},
						get_offset = 2,
						get_word = 'ternary',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 12',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142711,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 2,
							},
							kind = 15,
							label = 'toexpand',
							word = 'toexpand',
						},
						get_offset = 2,
						get_word = 'toexpand',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 13',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142712,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 3,
							},
							kind = 15,
							label = 'never_expands',
							word = 'never_expands',
						},
						get_offset = 2,
						get_word = 'never_expands',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 14',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142713,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 4,
							},
							kind = 15,
							label = 'date',
							word = 'date',
						},
						get_offset = 2,
						get_word = 'date',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 15',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142714,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 5,
							},
							kind = 15,
							label = 'for',
							word = 'for',
						},
						get_offset = 2,
						get_word = 'for',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 16',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142715,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
		},
		id = 9,
		incomplete = false,
		is_triggered_by_symbol = false,
		name = 'luasnip',
		offset = 2,
		request_offset = 2,
		revision = 257,
		source = {
			metatable = {
				__index = {
					clear_cache = 'function 35',
					complete = 'function 36',
					execute = 'function 37',
					get_debug_name = 'function 38',
					get_keyword_pattern = 'function 39',
					is_available = 'function 40',
					new = 'function 41',
					refresh = 'function 42',
					resolve = 'function 43',
				},
			},
		},
		status = 3,
		metatable = {
			__index = {
				SourceStatus = {
					COMPLETED = 3,
					FETCHING = 2,
					WAITING = 1,
				},
				complete = 'function 44',
				execute = 'function 45',
				get_debug_name = 'function 46',
				get_default_insert_range = 'function 47',
				get_default_replace_range = 'function 48',
				get_entries = 'function 49',
				get_entry_filter = 'function 50',
				get_fetching_time = 'function 51',
				get_keyword_length = 'function 52',
				get_keyword_pattern = 'function 53',
				get_matching_config = 'function 54',
				get_position_encoding_kind = 'function 55',
				get_source_config = 'function 56',
				get_trigger_characters = 'function 57',
				is_available = 'function 58',
				new = 'function 59',
				reset = 'function 60',
				resolve = 'function 61',
			},
		},
	},
	source_insert_range = 'table 6',
	source_offset = 2,
	source_replace_range = 'table 7',
	metatable = {
		__index = 'table 9',
	},
}
local val_1 = {
	cache = {
		entries = {
			get_completion_item = {
				data = {
					auto = false,
					filetype = 'lua',
					show_condition = 'function 1',
					snip_id = 7,
				},
				kind = 15,
				label = 'req',
				word = 'req',
			},
			get_filter_text = 'req',
			get_offset = 2,
			get_word = 'req',
		},
		metatable = {
			__index = {
				clear = 'function 2',
				ensure = 'function 3',
				get = 'function 4',
				key = 'function 5',
				new = 'function 6',
				set = 'function 7',
			},
		},
	},
	completion_item = 'table 2',
	confirmed = false,
	context = {
		bufnr = 2,
		cache = {
			entries = {
				['get_offset:.*:g.'] = 1,
				['get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\%(-\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\)*\\):g.'] = 3,
				['get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\w*\\%(-\\w*\\)*\\):g.'] = 3,
				["get_offset:\\%([^/\\\\:\\*?'''\"`\\|]\\)*:g."] = 1,
				['get_offset:\\%([^[:alnum:][:blank:]]\\|\\w\\+\\):g.'] = 2,
				['get_offset:\\%(\\V(\\m\\|\\V,\\m\\|\\V \\m\\)\\s*\\zs:g.'] = 3,
				['get_offset:\\w\\+:g.'] = 3,
			},
			metatable = {
				__index = 'table 3',
			},
		},
		cursor = {
			character = 2,
			col = 3,
			line = 63,
			row = 64,
		},
		cursor_after_line = '',
		cursor_before_line = 'g.',
		cursor_line = 'g.',
		filetype = 'lua',
		id = 3367,
		option = {
			reason = 'auto',
		},
		prev_context = {
			bufnr = 2,
			cursor = {
				character = 15,
				col = 16,
				line = 63,
				row = 64,
			},
			cursor_after_line = '',
			cursor_before_line = 'g.gui_font_face',
			cursor_line = 'g.gui_font_face',
			filetype = 'lua',
			id = 3366,
			option = {},
			time = 68254930,
		},
		time = 68256631,
		metatable = {
			__index = {
				changed = 'function 8',
				clone = 'function 9',
				empty = 'function 10',
				get_offset = 'function 11',
				get_reason = 'function 12',
				new = 'function 13',
			},
		},
	},
	exact = false,
	id = 142708,
	match_cache = {
		entries = {},
		metatable = {
			__index = 'table 3',
		},
	},
	matches = {},
	resolved_callbacks = {},
	resolving = false,
	score = 0,
	source = {
		cache = {
			entries = {
				['get_default_insert_range:256'] = {
					['end'] = {
						character = 2,
						line = 63,
					},
					start = {
						character = 1,
						line = 63,
					},
				},
				['get_default_replace_range:256'] = {
					['end'] = {
						character = 2,
						line = 63,
					},
					start = {
						character = 2,
						line = 63,
					},
				},
			},
			metatable = {
				__index = 'table 3',
			},
		},
		complete_dedup = 'function 14',
		completion_context = {
			triggerKind = 1,
		},
		context = 'table 4',
		entries = {
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'lua',
								show_condition = 'function 1',
								snip_id = 6,
							},
							kind = 15,
							label = 'ignore',
							word = 'ignore',
						},
						get_filter_text = 'ignore',
						get_offset = 2,
						['get_vim_item:2'] = {
							abbr = 'ignore~',
							dup = 1,
							empty = 1,
							equal = 1,
							kind = '',
							menu = '[Snippet]',
							word = 'ignore',
						},
						get_word = 'ignore',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 8',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142707,
				match_cache = {
					entries = {
						['.:0:0:0:0'] = {
							matches = {},
							score = 0,
						},
					},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = {
						convert_position_encoding = 'function 15',
						execute = 'function 16',
						fill_defaults = 'function 17',
						get_commit_characters = 'function 18',
						get_completion_item = 'function 19',
						get_documentation = 'function 20',
						get_filter_text = 'function 21',
						get_insert_range = 'function 22',
						get_insert_text = 'function 23',
						get_kind = 'function 24',
						get_offset = 'function 25',
						get_overwrite = 'function 26',
						get_replace_range = 'function 27',
						get_view = 'function 28',
						get_vim_item = 'function 29',
						get_word = 'function 30',
						is_deprecated = 'function 31',
						match = 'function 32',
						new = 'function 33',
						resolve = 'function 34',
					},
				},
			},
			'table 1',
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'lua',
								show_condition = 'function 1',
								snip_id = 8,
							},
							kind = 15,
							label = 'preq',
							word = 'preq',
						},
						get_offset = 2,
						get_word = 'preq',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 10',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142709,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 0,
							},
							kind = 15,
							label = 'cond',
							word = 'cond',
						},
						get_offset = 2,
						get_word = 'cond',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 11',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142710,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 1,
							},
							kind = 15,
							label = 'ternary',
							word = 'ternary',
						},
						get_offset = 2,
						get_word = 'ternary',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 12',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142711,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 2,
							},
							kind = 15,
							label = 'toexpand',
							word = 'toexpand',
						},
						get_offset = 2,
						get_word = 'toexpand',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 13',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142712,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 3,
							},
							kind = 15,
							label = 'never_expands',
							word = 'never_expands',
						},
						get_offset = 2,
						get_word = 'never_expands',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 14',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142713,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 4,
							},
							kind = 15,
							label = 'date',
							word = 'date',
						},
						get_offset = 2,
						get_word = 'date',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 15',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142714,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 5,
							},
							kind = 15,
							label = 'for',
							word = 'for',
						},
						get_offset = 2,
						get_word = 'for',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 16',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142715,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
		},
		id = 9,
		incomplete = false,
		is_triggered_by_symbol = false,
		name = 'luasnip',
		offset = 2,
		request_offset = 2,
		revision = 257,
		source = {
			metatable = {
				__index = {
					clear_cache = 'function 35',
					complete = 'function 36',
					execute = 'function 37',
					get_debug_name = 'function 38',
					get_keyword_pattern = 'function 39',
					is_available = 'function 40',
					new = 'function 41',
					refresh = 'function 42',
					resolve = 'function 43',
				},
			},
		},
		status = 3,
		metatable = {
			__index = {
				SourceStatus = {
					COMPLETED = 3,
					FETCHING = 2,
					WAITING = 1,
				},
				complete = 'function 44',
				execute = 'function 45',
				get_debug_name = 'function 46',
				get_default_insert_range = 'function 47',
				get_default_replace_range = 'function 48',
				get_entries = 'function 49',
				get_entry_filter = 'function 50',
				get_fetching_time = 'function 51',
				get_keyword_length = 'function 52',
				get_keyword_pattern = 'function 53',
				get_matching_config = 'function 54',
				get_position_encoding_kind = 'function 55',
				get_source_config = 'function 56',
				get_trigger_characters = 'function 57',
				is_available = 'function 58',
				new = 'function 59',
				reset = 'function 60',
				resolve = 'function 61',
			},
		},
	},
	source_insert_range = 'table 6',
	source_offset = 2,
	source_replace_range = 'table 7',
	metatable = {
		__index = 'table 9',
	},
}
local val_1 = {
	cache = {
		entries = {
			get_completion_item = {
				data = {
					auto = false,
					filetype = 'lua',
					show_condition = 'function 1',
					snip_id = 8,
				},
				kind = 15,
				label = 'preq',
				word = 'preq',
			},
			get_filter_text = 'preq',
			get_offset = 2,
			get_word = 'preq',
		},
		metatable = {
			__index = {
				clear = 'function 2',
				ensure = 'function 3',
				get = 'function 4',
				key = 'function 5',
				new = 'function 6',
				set = 'function 7',
			},
		},
	},
	completion_item = 'table 2',
	confirmed = false,
	context = {
		bufnr = 2,
		cache = {
			entries = {
				['get_offset:.*:g.'] = 1,
				['get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\%(-\\%(\\w\\|á\\|Á\\|é\\|É\\|í\\|Í\\|ó\\|Ó\\|ú\\|Ú\\)*\\)*\\):g.'] = 3,
				['get_offset:\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\w*\\%(-\\w*\\)*\\):g.'] = 3,
				["get_offset:\\%([^/\\\\:\\*?'''\"`\\|]\\)*:g."] = 1,
				['get_offset:\\%([^[:alnum:][:blank:]]\\|\\w\\+\\):g.'] = 2,
				['get_offset:\\%(\\V(\\m\\|\\V,\\m\\|\\V \\m\\)\\s*\\zs:g.'] = 3,
				['get_offset:\\w\\+:g.'] = 3,
			},
			metatable = {
				__index = 'table 3',
			},
		},
		cursor = {
			character = 2,
			col = 3,
			line = 63,
			row = 64,
		},
		cursor_after_line = '',
		cursor_before_line = 'g.',
		cursor_line = 'g.',
		filetype = 'lua',
		id = 3367,
		option = {
			reason = 'auto',
		},
		prev_context = {
			bufnr = 2,
			cursor = {
				character = 15,
				col = 16,
				line = 63,
				row = 64,
			},
			cursor_after_line = '',
			cursor_before_line = 'g.gui_font_face',
			cursor_line = 'g.gui_font_face',
			filetype = 'lua',
			id = 3366,
			option = {},
			time = 68254930,
		},
		time = 68256631,
		metatable = {
			__index = {
				changed = 'function 8',
				clone = 'function 9',
				empty = 'function 10',
				get_offset = 'function 11',
				get_reason = 'function 12',
				new = 'function 13',
			},
		},
	},
	exact = false,
	id = 142709,
	match_cache = {
		entries = {},
		metatable = {
			__index = 'table 3',
		},
	},
	matches = {},
	resolved_callbacks = {},
	resolving = false,
	score = 0,
	source = {
		cache = {
			entries = {
				['get_default_insert_range:256'] = {
					['end'] = {
						character = 2,
						line = 63,
					},
					start = {
						character = 1,
						line = 63,
					},
				},
				['get_default_replace_range:256'] = {
					['end'] = {
						character = 2,
						line = 63,
					},
					start = {
						character = 2,
						line = 63,
					},
				},
			},
			metatable = {
				__index = 'table 3',
			},
		},
		complete_dedup = 'function 14',
		completion_context = {
			triggerKind = 1,
		},
		context = 'table 4',
		entries = {
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'lua',
								show_condition = 'function 1',
								snip_id = 6,
							},
							kind = 15,
							label = 'ignore',
							word = 'ignore',
						},
						get_filter_text = 'ignore',
						get_offset = 2,
						['get_vim_item:2'] = {
							abbr = 'ignore~',
							dup = 1,
							empty = 1,
							equal = 1,
							kind = '',
							menu = '[Snippet]',
							word = 'ignore',
						},
						get_word = 'ignore',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 8',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142707,
				match_cache = {
					entries = {
						['.:0:0:0:0'] = {
							matches = {},
							score = 0,
						},
					},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = {
						convert_position_encoding = 'function 15',
						execute = 'function 16',
						fill_defaults = 'function 17',
						get_commit_characters = 'function 18',
						get_completion_item = 'function 19',
						get_documentation = 'function 20',
						get_filter_text = 'function 21',
						get_insert_range = 'function 22',
						get_insert_text = 'function 23',
						get_kind = 'function 24',
						get_offset = 'function 25',
						get_overwrite = 'function 26',
						get_replace_range = 'function 27',
						get_view = 'function 28',
						get_vim_item = 'function 29',
						get_word = 'function 30',
						is_deprecated = 'function 31',
						match = 'function 32',
						new = 'function 33',
						resolve = 'function 34',
					},
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'lua',
								show_condition = 'function 1',
								snip_id = 7,
							},
							kind = 15,
							label = 'req',
							word = 'req',
						},
						get_filter_text = 'req',
						get_offset = 2,
						['get_vim_item:2'] = {
							abbr = 'req~',
							dup = 1,
							empty = 1,
							equal = 1,
							kind = '',
							menu = '[Snippet]',
							word = 'req',
						},
						get_word = 'req',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 10',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142708,
				match_cache = {
					entries = {
						['.:0:0:0:0'] = {
							matches = {},
							score = 0,
						},
					},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			'table 1',
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 0,
							},
							kind = 15,
							label = 'cond',
							word = 'cond',
						},
						get_offset = 2,
						get_word = 'cond',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 11',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142710,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 1,
							},
							kind = 15,
							label = 'ternary',
							word = 'ternary',
						},
						get_offset = 2,
						get_word = 'ternary',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 12',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142711,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 2,
							},
							kind = 15,
							label = 'toexpand',
							word = 'toexpand',
						},
						get_offset = 2,
						get_word = 'toexpand',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 13',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142712,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 3,
							},
							kind = 15,
							label = 'never_expands',
							word = 'never_expands',
						},
						get_offset = 2,
						get_word = 'never_expands',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 14',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142713,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 4,
							},
							kind = 15,
							label = 'date',
							word = 'date',
						},
						get_offset = 2,
						get_word = 'date',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 15',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142714,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
			{
				cache = {
					entries = {
						get_completion_item = {
							data = {
								auto = false,
								filetype = 'all',
								show_condition = 'function 1',
								snip_id = 5,
							},
							kind = 15,
							label = 'for',
							word = 'for',
						},
						get_offset = 2,
						get_word = 'for',
					},
					metatable = {
						__index = 'table 3',
					},
				},
				completion_item = 'table 16',
				confirmed = false,
				context = 'table 4',
				exact = false,
				id = 142715,
				match_cache = {
					entries = {},
					metatable = {
						__index = 'table 3',
					},
				},
				matches = {},
				resolved_callbacks = {},
				resolving = false,
				score = 0,
				source = 'table 5',
				source_insert_range = 'table 6',
				source_offset = 2,
				source_replace_range = 'table 7',
				metatable = {
					__index = 'table 9',
				},
			},
		},
		id = 9,
		incomplete = false,
		is_triggered_by_symbol = false,
		name = 'luasnip',
		offset = 2,
		request_offset = 2,
		revision = 257,
		source = {
			metatable = {
				__index = {
					clear_cache = 'function 35',
					complete = 'function 36',
					execute = 'function 37',
					get_debug_name = 'function 38',
					get_keyword_pattern = 'function 39',
					is_available = 'function 40',
					new = 'function 41',
					refresh = 'function 42',
					resolve = 'function 43',
				},
			},
		},
		status = 3,
		metatable = {
			__index = {
				SourceStatus = {
					COMPLETED = 3,
					FETCHING = 2,
					WAITING = 1,
				},
				complete = 'function 44',
				execute = 'function 45',
				get_debug_name = 'function 46',
				get_default_insert_range = 'function 47',
				get_default_replace_range = 'function 48',
				get_entries = 'function 49',
				get_entry_filter = 'function 50',
				get_fetching_time = 'function 51',
				get_keyword_length = 'function 52',
				get_keyword_pattern = 'function 53',
				get_matching_config = 'function 54',
				get_position_encoding_kind = 'function 55',
				get_source_config = 'function 56',
				get_trigger_characters = 'function 57',
				is_available = 'function 58',
				new = 'function 59',
				reset = 'function 60',
				resolve = 'function 61',
			},
		},
	},
	source_insert_range = 'table 6',
	source_offset = 2,
	source_replace_range = 'table 7',
	metatable = {
		__index = 'table 9',
	},
}
