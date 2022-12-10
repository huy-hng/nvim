---@diagnostic disable: undefined-global

local ls = require('luasnip')

local s = ls.s
local snippet_from_nodes = ls.sn

local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node

local events = require('luasnip.util.events')


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
	return f(function(args)
		return args[1]
	end, { index })
end
local make = function(tbl)
	local result = {}
	for k, v in pairs(tbl) do
		table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
	end

	return result
end


local toexpand_count = 0
return {
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
	-- s('toexpand', c(1, { t('hello'), t('world'), t('last') }), {
	-- 	callbacks = {
	-- 		[1] = {
	-- 			[events.enter] = function(--[[ node ]])
	-- 				toexpand_count = toexpand_count + 1
	-- 				print('Number of times entered:', toexpand_count)
	-- 			end,
	-- 		},
	-- 	},
	-- }),

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

	-- tree sitter
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
