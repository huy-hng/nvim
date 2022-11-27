local has_luasnip, ls = pcall(require, 'luasnip')
if not has_luasnip then return end

local types = require('luasnip.util.types')

ls.cleanup()

ls.config.set_config {
	-- This tells LuaSnip to remember to keep around the last snippet.
	-- You can jump back into it even if you move outside of the selection
	history = true,

	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = 'TextChanged,TextChangedI',

	-- Autosnippets:
	enable_autosnippets = true,

	-- Crazy highlights!!
	-- #vid3
	-- ext_opts = nil,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { ' « ', 'NonTest' } },
			},
		},
	},
}

require('luasnip.loaders.from_lua').load { paths = vim.fn.expand('%:h') .. '/ft' }

-- local snippet = ls.s
-- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/plugins/luasnip/ft/*.lua', true)) do
-- 	local type, snippets = loadfile(ft_path)()
-- 	local snips = {}
-- 	for name, snip in pairs(snippets) do
-- 		local s = snippet(name, snip)
-- 		-- table.insert(snips, s)
-- 	end
-- 	-- P(snips[1])
-- 	-- ls.add_snippets(type, snips)
-- end

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
imap('<c-l>', function()
	if ls.expand_or_jumpable() then ls.expand_or_jump() end
end)

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
imap('<c-h>', function()
	if ls.jumpable(-1) then ls.jump(-1) end
end)

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
imap('<c-k>', function()
	if ls.choice_active() then ls.change_choice(1) end
end)
imap('<c-j>', function()
	if ls.choice_active() then ls.change_choice(1) end
end)

imap('<c-u>', require('luasnip.extras.select_choice'))

-- shorcut to source my luasnips file again, which will reload my snippets
-- nmap('<leader><leader>s', FN(R, 'plugins.luasnip'))
nmap('<leader><leader>s', '<cmd>source ' .. vim.fn.expand('%:p') .. '<cr>')


-- create snippet
-- s(context, nodes, condition, ...)
local snippet = ls.s

--  Useful for dynamic nodes and choice nodes
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

-- The first argument is the jump position
-- The second argument is a table of possible nodes.
--  Note, one thing that's nice is you don't have to include
--  the jump position for nodes that normally require one (can be nil)
local choice = ls.choice_node

local dyn = ls.dynamic_node


local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt

local lambda = extras.lambda
local rep = extras.rep

-- local str_snip = function(trig, expanded)
--   return ls.parser.parse_snippet({ trig = trig }, expanded)
-- end


