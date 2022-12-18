---@diagnostic disable: undefined-global

local shortcut = function(val)
	if type(val) == 'string' then return { t { val }, i(0) } end

	if type(val) == 'table' then
		for k, v in ipairs(val) do
			if type(v) == 'string' then val[k] = t { v } end
		end
	end

	return val
end

local same = function(index)
	return f(function(args) return args[1] end, { index })
end

local make = function(tbl)
	local result = {}
	for k, v in pairs(tbl) do
		table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
	end

	return result
end

local function comment() return vim.bo.commentstring:gsub(' %%s', '') end

local function divider_creator(text_len, divider_len, char)
	local indent_level = vim.fn.indent(vim.fn.line('.'))
	local length = (divider_len - text_len - indent_level - #comment()) / 2
	return Repeat(char, math.floor(length))
end

local function divider_nodes(text_len, char_vars, len_vars)
	local variations = {}
	for _, divider_len in ipairs(len_vars) do
		for _, char in ipairs(char_vars) do
			table.insert(variations, t(divider_creator(text_len, divider_len, char)))
		end
	end
	return variations
end

local function divider_(args, _)
	local text = args[1][1] or ''
	local char_variations = { '-', '=' }
	local length_variations = { 100, 50 }

	local text_len = vim.fn.strdisplaywidth(text)
	local sn = snippet_from_nodes(nil, {
		c(1, divider_nodes(text_len, char_variations, length_variations)),
	})
	sn.len = 1
	return sn
end

local function divider(side, char, divider_len)
	return function(args, _, old_state)
		local text = args[1][1] or ''

		local text_len = vim.fn.strdisplaywidth(text)

		local indent_level = vim.fn.indent(vim.fn.line('.'))
		local length = (divider_len - text_len - indent_level - #comment()) / 2
		local round_fn = side == 'right' and math.ceil or math.floor

		return snippet_from_nodes(nil, {
			t(Repeat(char, round_fn(length))),
		})
	end
end

local function choices(char_vars, len_vars)
	local variations = {}
	for _, divider_len in ipairs(len_vars) do
		for _, char in ipairs(char_vars) do
			table.insert(
				variations,
				sn(nil, {
					d(2, divider('left', char, divider_len), { 1 }),
					r(1, 'user_text'),
					d(3, divider('right', char, divider_len), { 1 }),
				})
			)
		end
	end
	return variations
end

return {

	s('rest', {
		i(1, 'preset'),
		t { '', '' },
		d(2, function(args, _) --
			return sn(nil, {
				i(1, args[1]),
				r(2, 'dyn', i(nil, 'user_text')),
			})
		end, 1),
	}),

	s('trig2', {
		i(1, 'change to update'),
		d(2, function(args, _, old_state)
			vim.notify(vim.inspect(args[1]))
			vim.notify(vim.inspect(old_state))
			old_state = old_state or {
				updates = 0,
			}

			old_state.updates = old_state.updates + 1

			local snip = sn(nil, {
				t(tostring(old_state.updates)),
			})

			snip.old_state = old_state
			return snip
		end, { 1 }),
	}),

	snippet('div', {
		f(comment),
		c(1, choices({ '-', '=' }, { 100, 50 })),
	}),
	snippet(
		'one',
		fmt(
			[[{comment}{divider}{text}{divider}

			]],
			{
				comment = f(comment),
				divider = d(2, divider, { 1 }),
				text = i(1),
			},
			{ repeat_duplicates = true }
		)
	),
	s('paren_change', {
		c(1, {
			sn(nil, { t('('), r(1, 'user_text'), t(')') }),
			sn(nil, { t('['), r(1, 'user_text'), t(']') }),
			sn(nil, { t('{'), r(1, 'user_text'), t('}') }),
		}),
	}, {
		stored = {
			-- key passed to restoreNodes.
			['user_text'] = i(1, 'default_text'),
		},
	}),

	-- s('cond', {
	-- 	t('will only expand in c-style comments'),
	-- 	}, {
	-- 		condition = function(line_to_cursor --[[ , matched_trigger, captures ]])
	-- 			local commentstring = '%s*' .. vim.bo.commentstring:gsub('%%s', '')
	-- 			-- optional whitespace followed by //
	-- 			return line_to_cursor:match(commentstring)
	-- 		end,
	-- }),
	-- s('ternary', {
	-- 	-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
	-- 	i(1, 'cond'),
	-- 	t(' ? '),
	-- 	i(2, 'then'),
	-- 	t(' : '),
	-- 	i(3, 'else'),
	-- }),
	-- -- callbacks table
	-- s('toexpand', c(1, { t('hello'), t('world'), t('last') })),

	-- -- regTrig
	-- --    snippet.captures
	-- -- s({ trig = "AbstractGenerator.*Factory", regTrig = true }, { t "yo" }),

	-- -- third arg,
	-- s('never_expands', t('this will never expand, condition is false'), {
	-- 	condition = function()
	-- 		return false
	-- 	end,
	-- }),

	-- -- docTrig ??

	-- -- functions

	-- -- date -> Tue 16 Nov 2021 09:43:49 AM EST
	-- s({ trig = 'date' }, {
	-- 	f(function()
	-- 		return string.format(string.gsub(vim.bo.commentstring, '%%s', ' %%s'), os.date())
	-- 	end, {}),
	-- }),

	-- -- Simple snippet, basics
	-- s('for', {
	-- 	t('for '),
	-- 	i(1, 'k, v'),
	-- 	t(' in '),
	-- 	i(2, 'ipairs()'),
	-- 	t { 'do', '  ' },
	-- 	i(0),
	-- 	t { '', '' },
	-- 	t('end'),
	-- }),

	-- Alternative printf-like notation for defining snippets. It uses format
	-- string with placeholders similar to the ones used with Python's .format().
	-- s(
	-- 	'fmt1',
	-- 	fmt('To {title} {} {}.', {
	-- 		ins(2, 'Name'),
	-- 		ins(3, 'Surname'),
	-- 		title = choice(1, { text('Mr.'), text('Ms.') }),
	-- 	})
	-- ),

	-- LSP version (this allows for simple snippets / copy-paste from vs code things)

	-- function(args, snip) ... end

	-- Using captured text <-- think of a fun way to use this.
	-- s({trig = "b(%d)", regTrig = true},
	-- f(function(args, snip) return
	-- "Captured Text: " .. snip.captures[1] .. "." end, {})

	-- the first few letters of a commit hash -> expand to correct one
	-- type the first few words of a commit message -> expands to commit hash that matches
	-- commit:Fixes #

	-- treesitter
	-- :func:x -> find all functions in the file with x in the name, and choice between them

	-- auto-insert markdown footer?
	-- footer:(hello world)
	-- ^link
	-- callbacks [event.leave]

	-- ls.parser.parse_s({trig = "lsp"}, "$1 is ${2|hard,easy,challenging|}")

	-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
	-- s({ trig = '$$ (.*)', regTrig = true },
	-- 	f(function(_, snip, command)
	-- 		if snip.captures[1] then command = snip.captures[1] end

	-- 		local file = io.popen(command, 'r')
	-- 		local res = { '$ ' .. snip.captures[1] }
	-- 		for line in file:lines() do
	-- 			table.insert(res, line)
	-- 		end
	-- 		return res
	-- 	end, {}, 'ls'),
	-- 	{
	-- 		-- Don't show this one, because it's not useful as a general purpose snippet.
	-- 		show_condition = function()
	-- 			return false
	-- 		end,
	-- 	}
	-- )

	-- ls.add_snippets('all', {
	-- 	-- important! fmt does not return a snippet, it returns a table of nodes.
	-- 	snippet('example1',fmt('just an {iNode1}', {
	-- 			iNode1 = i(1, 'example'),
	-- 	})),
	-- 	snippet('example2', fmt([[
	-- 	if {} then
	-- 		{}
	-- 	end
	-- 	]], {
	-- 		-- i(1) is at nodes[1], i(2) at nodes[2].
	-- 		i(1, 'not now'),
	-- 		i(2, 'when'),
	-- 	})),
	-- 	snippet('example3', fmt([[
	-- 	if <> then
	-- 		<>
	-- 	end
	-- 	]], {
	-- 		-- i(1) is at nodes[1], i(2) at nodes[2].
	-- 		i(1, 'not now'),
	-- 		i(2, 'when'),
	-- 	}, {
	-- 		delimiters = '<>',
	-- 	})),
	-- })
}
