---@diagnostic disable: undefined-global
local utils = require('plugins.editing.snippets.utils')

local require_var = function(args, _)
	local text = args[1][1] or ''
	text = text:gsub('-', '_')
	local split = vim.split(text, '.', { plain = true })

	local options = {}
	for len = 0, #split - 1 do
		local sliced = vim.list_slice(split, #split - len, #split)
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
		-- print(path)
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

local type_choices = {
	fmt("type({}) == '{}'", { r(1, 'variable'), r(2, 'type') }),
	fmt("type({}) ~= '{}'", { r(1, 'variable'), r(2, 'type') }),
}

return {
	--------------------------------------------Shortcuts-------------------------------------------
	snippet('notify', fmt("vim.notify('{}')", i(0))),
	snippet('insert', fmt('table.insert({})', i(0))),
	snippet('api', t('vim.api.')),
	snippet('fn', t('vim.fn.')),
	snippet('@', t('---@')),
	snippet('ifreturn', t('if true then return end')),
	snippet('ignore', t('-- stylua: ignore')),

	--------------------------------------------One Liners------------------------------------------

	-- stylua: ignore
	snippet('for .. ipairs()', fmt([[
		for {}, {} in ipairs({}) do
			{}
		end
	]], { i(1, '_'), i(2, 'val'), i(3), i(0) })),

	snippet('curfile', f(get_relative_path())),

	snippet('continue', fmt('goto continue{}::continue::', { utils.newline() })),

	-- stylua: ignore
	snippet('schedule', fmt([[
		vim.schedule(function()
			{}
		end)
		]],
	{ i(0) })),

	-- stylua: ignore
	snippet('fm', fmt([[
		function M.{}({})
			{}
		end
	]], { i(1), i(2), i(0) })),

	snippet('p', fmt("print('{}'){}{}", { i(1, ' '), utils.newline(), i(0) })),

	--stylua: ignore
	snippet('module', fmt([[
		---@module '{}'
		local {} = R('{}')
		{}
	]], { i(1), d(2, require_var, { 1 }), rep(1), i(0), })),

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

	snippet('type', { c(1, type_choices) }),

	-- stylua: ignore
	-- snippet('iftype', fmt([[
	-- 	if {} then
	-- 		{}
	-- 	end
	-- ]], { c(1, type_choices), i(0)})),

	---------------------------------------------requires-------------------------------------------

	snippet(
		'preq',
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
}
