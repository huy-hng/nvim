---@diagnostic disable: undefined-global

local function comment() return vim.bo.commentstring:gsub(' %%s', '') end

local function calc_length(args, divider_len)
	local text = args[1][1] or ''

	local text_len = vim.fn.strdisplaywidth(text)

	local indent_level = vim.fn.indent(vim.fn.line('.'))
	return (divider_len - text_len - indent_level - #comment()) / 2
end

local function divider(side, char, divider_len)
	return function(args, _)
		local length = calc_length(args, divider_len)
		local round_fn = side == 'right' and math.ceil or math.floor
		return snippet_from_nodes(nil, {
			t(Repeat(char, round_fn(length))),
		})
	end
end

local function test(args, parent, side, char, divider_len) --
	P(side, char, divider_len)
	local length = calc_length(args, divider_len)
	local round_fn = side == 'right' and math.ceil or math.floor
	return Repeat(char, round_fn(length))
end

local function create_divider_snippet(char, divider_len)
	return sn(nil, {
		f(test, { 1 }, { user_args = { 'left', char, divider_len } }),
		-- d(2, divider('left', char, divider_len), { 1 }),
		r(1, 'user_text'),
		-- d(3, divider('right', char, divider_len), { 1 }),
		f(test, { 1 }, { user_args = { 'right', char, divider_len } }),
	})
end

local function choices(char_vars, len_vars)
	local variations = {}
	for _, divider_len in ipairs(len_vars) do
		for _, char in ipairs(char_vars) do
			table.insert(variations, create_divider_snippet(char, divider_len))
		end
	end
	return variations
end

return {
	snippet('div', {
		i(0, ''),
		f(comment),
		c(1, choices({ '-', '=' }, { 100, 50 })),
	}),

	snippet('asdf', {
		i(0, ''),
		f(comment),
		c(1, {
			sn(nil, {
				f(test, { 1 }, { user_args = { side = 'left', char = '-', length = 100 } }),
				r(1, 'user_text'),
				f(test, { 1 }, { user_args = { side = 'right', char = '-', length = 100 } }),
			}),
		}),
	}),
	s('trig', {
		i(1, 'text_of_first'),
		i(2, { 'first_line_of_second', 'second_line_of_second' }),
		f(function(args, snip)
			P(args)
			--here
			-- order is 2,1, not 1,2!!
		end, { 2, 1 }),
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
