local has_luasnip, ls = pcall(require, 'luasnip')
if not has_luasnip then return end

require('plugins.snippets.mappings')

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

require('luasnip.loaders.from_lua').load { paths = 'lua/plugins/snippets/ft' }
