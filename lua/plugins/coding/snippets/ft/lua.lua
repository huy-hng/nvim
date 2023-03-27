---@diagnostic disable: undefined-global
local utils = require('plugins.coding.snippets.utils')

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

local function get_relative_path(modifier)
	return function()
		modifier = modifier and ':' .. modifier or ''
		local path = vim.fn.expand('%' .. modifier)
		-- vim.fn.fnamemodify()
		path = vim.fn.substitute(path, '^lua/', '', '')
		print(path)
		return path
	end
end

local function requirefolder(--[[ args, parent, user_args ]])
	-- text from i(2) in this example i.e. { { "456" } }
	-- parent snippet or parent node
	-- user_args from opts.user_args
	local path = vim.fn.expand('%:h')
	path = vim.fn.substitute(path, '^lua/', '', '')
	-- print(path)
	path = string.gsub(path, '/', '.')
	return path .. '.'
end

-- local type_fmt = fmt("type({}) {}= '{}'", { i(1), c(2, { t('='), t('~') }), i(3) })

local type_fmt = function()
	return fmt("type({}) {}= '{}'", { i(1), c(2, { t('='), t('~') }), i(3) })
end

return {
	--------------------------------------------Shortcuts-------------------------------------------
	snippet('api', t('vim.api.')),
	snippet('fn', t('vim.fn.')),
	snippet('@', t('---@')),
	snippet('ifreturn', t('if true then return end')),
	snippet('ignore', t('--stylua: ignore')),

	--------------------------------------------One Liners------------------------------------------

	snippet('curfile', f(get_relative_path())),

	snippet('continue', fmt('goto continue{}::continue::', { utils.newline() })),
	snippet('p', fmt("print('{}'){}{}", { i(1, ' '), utils.newline(), i(0) })),

	--stylua: ignore
	snippet('module',
		fmt([[
			---@module '{}'
			local {} = R('{}')
			{}
		]], { i(1), d(2, require_var, { 1 }), rep(1), i(0), })
	),

	--stylua: ignore
	snippet('plugin', fmt([[
		local M = {{
			'{}',
			event = 'VeryLazy',
		}}

		function M.config()
			{}
		end

		return M
	]], { i(1), i(2) })),

	--stylua: ignore
	snippet('local M', fmt([[
		local M = {{}}
		return M
	]], {})),

	--stylua: ignore
	snippet('M', fmt([[
		local M = {{}}
		return M
	]], {})),

	-- snippet('asserttype', fmt('assert({})', { sn(1, type_fmt) })),
	snippet('type', sn(1, type_fmt())),

	-- stylua: ignore
	snippet('iftype', fmt([[
		if {} then
			{}
		end
	]], { sn(1, type_fmt()), i(0)})),

	snippet('asserttype', fmt('assert({})', { sn(1, type_fmt()) })),

	snippet(
		'for .. ipairs()',
		fmt(
			[[
		for {}, {} in ipairs({}) do
			{}
		end
	]],
			{ i(1, '_'), i(2, 'val'), i(3), i(0) }
		)
	),

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

	-- snippet(
	-- 	'nreq',
	-- 	fmt([[
	-- 	local {} = nrequire('')
	-- 	if not has_{} then return end
	-- 	{}
	-- 	]],
	-- 		{
	-- 			d(2, require_var, { 1 }),
	-- 			rep(2),
	-- 			i(1),
	-- 			rep(2),
	-- 			i(0),
	-- 		}
	-- 	)
	-- ),
	snippet(
		'nreq',
		fmt(
			[[
			local {} = nrequire('{}')
			if not {} then return end
			{}
		]],
			{
				d(2, require_var, { 1 }),
				i(1),
				rep(2),
				i(0),
			}
		)
	),
	snippet(
		'preq',
		fmt(
			[[
		local has_{}, {} = pcall(require, '{}')
		if not has_{} then return end
		{}
		]],
			{
				d(2, require_var, { 1 }),
				rep(2),
				i(1),
				rep(2),
				i(0),
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
