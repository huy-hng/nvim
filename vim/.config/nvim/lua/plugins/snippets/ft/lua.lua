---@diagnostic disable: undefined-global

-- local shared = R('tj.snips')
local same = function(index)
	return f(function(args) return args[1] end, { index })
end

local newline = function(text) return t { '', text } end

local require_var = function(args, _)
	local text = args[1][1] or ''
	text = text:gsub('-', '_')
	local split = vim.split(text, '.', { plain = true })

	local options = {}
	for len = 0, #split - 1 do
		local sliced = vim.list_slice(split, #split - len, #split)
		P(sliced)
		P(table.concat(sliced, '_'))
		table.insert(options, t(table.concat(sliced, '_')))
	end

	return snippet_from_nodes(nil, {
		c(1, options),
	})
end

local function requirefolder(--[[ args, parent, user_args ]])
	-- text from i(2) in this example i.e. { { "456" } }
	-- parent snippet or parent node
	-- user_args from opts.user_args
	local path = vim.fn.expand('%:h')
	path = vim.fn.substitute(path, '^lua/', '', '')
	print(path)
	path = string.gsub(path, '/', '.')
	return path .. '.'
end

return {
	snippet('ifreturn', t('if true then return end')),
	snippet('cast', t('---@cast ')),
	snippet('ignore', t('--stylua: ignore')),

	--stylua: ignore
	snippet('iftype', fmt([[
	if type({}) == '{}' then
		{}
	end
	{}
	]], { i(1), i(2), i(3), i(4) })),

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

	snippet('test', { t('mirrored: '), i(1), t(' // '), same(1), t(' | '), i(0) }),

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
		'reqfold',
		fmt([[local {} = require('{}{}')]], {
			rep(1),
			f(requirefolder),
			i(1),
		})
	),

	snippet(
		'preq',
		fmt(
			[[
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
