if pcall(require, 'luasnip') then
	return
end

local ls = require('luasnip')

-- create snippet
-- s(context, nodes, condition, ...)
local snippet = ls.s

local snippet_from_nodes = ls.sn

-- This is the simplest node.
--  Creates a new text node. Places cursor after node by default.
--  t { "this will be inserted" }

--  Multiple lines are by passing a table of strings.
--  t { "line 1", "line 2" }
local t = ls.text_node

-- Insert Node
--  Creates a location for the cursor to jump to.
--      Possible options to jump to are 1 - N
--      If you use 0, that's the final place to jump to.
--
--  To create placeholder text, pass it as the second argument
--      i(2, "this is placeholder text")
local i = ls.insert_node

-- Function Node
--  Takes a function that returns text
local f = ls.function_node

-- This a choice snippet. You can move through with <c-l> (in my config)
--   c(1, { t {"hello"}, t {"world"}, }),
--
-- The first argument is the jump position
-- The second argument is a table of possible nodes.
--  Note, one thing that's nice is you don't have to include
--  the jump position for nodes that normally require one (can be nil)
local c = ls.choice_node

local d = ls.dynamic_node

-- TODO: Document what I've learned about lambda
local l = require('luasnip.extras').lambda

local events = require('luasnip.util.events')

ls.add_snippets('all', {
	snippet('asdf', {
		i(1),
		t('text'),
		i(2),
		t('text again'),
		i(3),
	}),
	snippet('prequire', {
		t('local status_'),
		i(1),
		t(', '),
		t('pcall(require, )'),
		t('if not status_ then return end'),
	})
})
ls.add_snippets('all', {
	snippet('ternary', {
		-- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
		i(1, 'cond'),
		t(' ? '),
		i(2, 'then'),
		t(' : '),
		i(3, 'else'),
	}),
})

-- local str_snip = function(trig, expanded)
--   return ls.parser.parse_snippet({ trig = trig }, expanded)
-- end

local shortcut = function(val)
	if type(val) == 'string' then
		return { t { val }, i(0) }
	end

	if type(val) == 'table' then
		for k, v in ipairs(val) do
			if type(v) == 'string' then
				val[k] = t { v }
			end
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

-- `all` key means for all filetypes.
-- Shared between all filetypes. Has lower priority than a particular ft tho
-- snippets.all = {

ls.add_snippets(nil, {
	-- basic, don't need to know anything else
	--    arg 1: string
	--    arg 2: a node
	snippet('simple', t('wow, you were right!')),

	-- callbacks table
	snippet('toexpand', c(1, { t('hello'), t('world'), t('last') }), {
		callbacks = {
			[1] = {
				[events.enter] = function(--[[ node ]])
					toexpand_count = toexpand_count + 1
					print('Number of times entered:', toexpand_count)
				end,
			},
		},
	}),

	-- regTrig
	--    snippet.captures
	-- snippet({ trig = "AbstractGenerator.*Factory", regTrig = true }, { t "yo" }),

	-- third arg,
	snippet('never_expands', t('this will never expand, condition is false'), {
		condition = function()
			return false
		end,
	}),

	-- docTrig ??

	-- functions

	-- date -> Tue 16 Nov 2021 09:43:49 AM EST
	snippet({ trig = 'date' }, {
		f(function()
			return string.format(string.gsub(vim.bo.commentstring, '%%s', ' %%s'), os.date())
		end, {}),
	}),

	-- Simple snippet, basics
	snippet('for', {
		t('for '),
		i(1, 'k, v'),
		t(' in '),
		i(2, 'ipairs()'),
		t { 'do', '  ' },
		i(0),
		t { '', '' },
		t('end'),
	}),

	-- Alternative printf-like notation for defining snippets. It uses format
	-- string with placeholders similar to the ones used with Python's .format().
	snippet(
		'fmt1',
		fmt('To {title} {} {}.', {
			i(2, 'Name'),
			i(3, 'Surname'),
			title = c(1, { t('Mr.'), t('Ms.') }),
		})
	),

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

	--
	-- ls.parser.parse_snippet({trig = "lsp"}, "$1 is ${2|hard,easy,challenging|}")
})

-- table.insert(
--   snippets.all,
--   snippet("cond", {
--     t "will only expand in c-style comments",
--   }, {
--     condition = function(
--       line_to_cursor --[[ , matched_trigger, captures ]]
--     )
--       local commentstring = "%s*" .. vim.bo.commentstring:gsub("%%s", "")
--       -- optional whitespace followed by //
--       return line_to_cursor:match(commentstring)
--     end,
--   })
-- )
-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
ls.add_snippets(nil, {
	snippet(
		{ trig = '$$ (.*)', regTrig = true },
		f(function(_, snip, command)
			if snip.captures[1] then
				command = snip.captures[1]
			end

			local file = io.popen(command, 'r')
			local res = { '$ ' .. snip.captures[1] }
			for line in file:lines() do
				table.insert(res, line)
			end
			return res
		end, {}, 'ls'),
		{
			-- Don't show this one, because it's not useful as a general purpose snippet.
			show_condition = function()
				return false
			end,
		}
	),
})

local js_attr_split = function(args)
	local val = args[1][1]
	local split = vim.split(val, '.', { plain = true })

	local choices = {}
	local thus_far = {}
	for index = 0, #split - 1 do
		table.insert(thus_far, 1, split[#split - index])
		table.insert(choices, t { table.concat(thus_far, '.') })
	end

	return snippet_from_nodes(nil, c(1, choices))
end

local fill_line = function(char)
	return function()
		local row = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_get_lines(0, row - 2, row, false)
		return string.rep(char, #lines[1])
	end
end

ls.add_snippets(
	'rst',
	make {
		jsa = {
			':js:attr:`',
			d(2, js_attr_split, { 1 }),
			' <',
			i(1),
			'>',
			'`',
		},

		link = { '.. _', i(1), ':' },

		head = f(fill_line('='), {}),
		sub = f(fill_line('-'), {}),
		subsub = f(fill_line('^'), {}),

		ref = { ':ref:`', same(1), ' <', i(1), '>`' },
	}
)
