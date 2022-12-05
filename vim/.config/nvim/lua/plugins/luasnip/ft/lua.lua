local ls = require('luasnip')

local snippet = ls.s
local snippet_from_nodes = ls.sn

local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node

local fmt = require('luasnip.extras.fmt').fmt
local extras = require('luasnip.extras')
local rep = extras.rep

-- local shared = R('tj.snips')
local same = function(index)
	return f(function(args)
		return args[1]
	end, { index })
end

local newline = function(text)
	return t { '', text }
end

local require_var = function(args, _)
	local text = args[1][1] or ''
	local split = vim.split(text, '.', { plain = true })

	local options = {}
	for len = 0, #split - 1 do
		table.insert(options, t(table.concat(vim.list_slice(split, #split - len, #split), '_')))
	end

	return snippet_from_nodes(nil, {
		c(1, options),
	})
end

return {
	snippet('ignore', t('--stylua: ignore')),

	-- snippet('lf', {
	-- 	desc = 'table function',
	-- 	'local ',
	-- 	i(1),
	-- 	' = function(',
	-- 	i(2),
	-- 	')',
	-- 	newline('  '),
	-- 	i(0),
	-- 	newline('end'),
	-- }),

	-- TODO: I don't know how I would like to set this one up.
	-- snippet('f', fmt('function({})\n  {}\nend', { i(1), i(0) })),

	-- snippet('test', { 'mirrored: ', i(1), ' // ', same(1), ' | ', i(0) }),

	snippet(
		'pcall',
		fmt([[pcall(require, '{}'))]], {
			i(1),
		})
	),

	snippet(
		'req',
		fmt([[local {} = require('{}')]], {
			d(2, require_var, { 1 }),
			i(1),
		})
	),

	snippet(
		'preq',
		fmt([[
		local has_{}, {}{} = pcall(require, '{}')
		if not has_{} then return end
		{}
		]],
			{
				d(2, require_var, { 1 }),
				rep(2),
				i(3),
				i(1),
				rep(2),
				i(4),
			}
		)
	),
	-- test = { "local ", i(1), ' = require("', f(function(args)
	--   table.insert(RESULT, args[1])
	--   return { "hi" }
	-- end, { 1 }), '")', i(0) },

	-- test = { i(1), " // ", d(2, function(args)
	--   return snippet_from_nodes(nil, { str "hello" })
	-- end, { 1 }), i(0) },
}
