local has_luasnip, ls = pcall(R, 'luasnip')

if not has_luasnip then return end

require('plugins.snippets.mappings')

local ft_functions = require('luasnip.extras.filetype_functions')
local loaders = require('luasnip.loaders')

-- ls.cleanup()

-- uses vim.ui.select to select a choice
Nmap('<leader>se', loaders.edit_snippet_files, '[Snippet] edit snippet files')
Imap('<c-u>', require('luasnip.extras.select_choice'))

-- interesting methods
-- in_snippet()
-- jumpable(direction)
-- locally_jumpable(direction)
-- unlink_current_if_deleted()
-- available() -- for debugging

ls.config.set_config {
	-- This tells LuaSnip to remember to keep around the last snippet.
	-- You can jump back into it even if you move outside of the selection

	-- If true, Snippets that were exited can still be jumped back into.
	-- As Snippets are not removed when their text is deleted, they have to be removed manually
	-- via LuasnipUnlinkCurrent if delete_check_events is not enabled (set to eg. 'TextChanged').
	history = true,

	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	-- Choose which events trigger an update of the active nodes' dependents.
	-- Default is just 'InsertLeave', 'TextChanged,TextChangedI' would update on every change.
	updateevents = 'TextChanged,TextChangedI',
	-- see :h User, event should never be triggered(except if it is `doautocmd`'d)

	-- Events on which to leave the current snippet if the cursor is outside its' 'region'.
	-- Disabled by default, 'CursorMoved', 'CursorHold' or 'InsertEnter' seem reasonable.
	region_check_events = 'User None',

	-- When to check if the current snippet was deleted, and if so, remove it from the history.
	-- Off by default, 'TextChanged' (perhaps 'InsertLeave', to react to changes done in Insert
	-- mode) should work just fine (alternatively, this can also be mapped
	-- using <Plug>luasnip-delete-check).
	delete_check_events = 'User None',
	-- Mapping for populating TM_SELECTED_TEXT and related variables (not set by default).
	store_selection_keys = nil, -- Supossed to be the same as the expand shortcut

	-- Additional options passed to extmarks.
	-- Can be used to add passive/active highlight on a per-node-basis (more info in DOC.md)
	ext_opts = require('plugins.snippets.highlights'),
	ext_base_prio = 200,
	ext_prio_increase = 9,

	-- Autosnippets are disabled by default to minimize performance penalty if unused.
	enable_autosnippets = false, -- Set to true to enable.

	-- Override the default behaviour of inserting a choiceNode containing the nested snippet
	-- and an empty insertNode for nested placeholders ("${1: ${2 = nil, -- this is nested}}").
	-- For an example (behaviour more similar to vscode), check here
	-- default applied in util.parser, requires iNode, cNode
	-- (Dependency cycle if here).
	-- parser_nested_assembler = function(pos, snip)
	-- 	local iNode = require('luasnip.nodes.insertNode')
	-- 	local cNode = require('luasnip.nodes.choiceNode')

	-- 	-- Inserts a insert(1) before all other nodes, decreases node.pos's as indexing is "wrong".
	-- 	local function modify_nodes(snip)
	-- 		for i = #snip.nodes, 1, -1 do
	-- 			snip.nodes[i + 1] = snip.nodes[i]
	-- 			local node = snip.nodes[i + 1]
	-- 			if node.pos then node.pos = node.pos + 1 end
	-- 		end
	-- 		snip.nodes[1] = iNode.I(1)
	-- 	end
	-- 	modify_nodes(snip)
	-- 	snip:init_nodes()
	-- 	snip.pos = nil

	-- 	return cNode.C(pos, { snip, iNode.I(nil, { '' }) })
	-- end,

	-- Source of possible filetypes for snippets. Defaults to a function, which returns
	-- vim.split(vim.bo.filetype, ".", true), but check filetype_functions or the docs for more options.
	-- Function expected to return a list of filetypes (or empty list)
	ft_func = ft_functions.from_filetype,

	-- Function to determine which filetypes belong to a given buffer (used for lazy_loading).
	-- fn(bufnr) -> filetypes (string[]). Again, there are some examples in filetype_functions.
	-- fn(bufnr) -> string[] (filetypes).
	load_ft_func = ft_functions.from_filetype_load,

	-- The global environment will be extended with this table in some places,
	-- eg. in files loaded by the lua-loader.
	-- Setting snip_env to { some_global = "a value" } will add the global variable some_global
	-- while evaluating these files. If you mind the (probably) large number of generated warnings,
	-- consider adding the keys set here to the globals recognized by lua-language-server or add
	-- ---@diagnostic disable = nil, -- undefined-global somewhere in the affected files.
	-- globals injected into luasnippet-files.
	snip_env = {
		snippet = require('luasnip.nodes.snippet').S,
		snippet_from_nodes = require('luasnip.nodes.snippet').SN,

		s = require('luasnip.nodes.snippet').S,
		sn = require('luasnip.nodes.snippet').SN,
		isn = require('luasnip.nodes.snippet').ISN,
		t = require('luasnip.nodes.textNode').T,
		i = require('luasnip.nodes.insertNode').I,
		f = require('luasnip.nodes.functionNode').F,
		c = require('luasnip.nodes.choiceNode').C,
		d = require('luasnip.nodes.dynamicNode').D,
		r = require('luasnip.nodes.restoreNode').R,
		events = require('luasnip.util.events'),
		ai = require('luasnip.nodes.absolute_indexer'),
		extras = require('luasnip.extras'),
		l = require('luasnip.extras').lambda,
		rep = require('luasnip.extras').rep,
		p = require('luasnip.extras').partial,
		m = require('luasnip.extras').match,
		n = require('luasnip.extras').nonempty,
		dl = require('luasnip.extras').dynamic_lambda,
		fmt = require('luasnip.extras.fmt').fmt,
		fmta = require('luasnip.extras.fmt').fmta,
		conds = require('luasnip.extras.expand_conditions'),
		postfix = require('luasnip.extras.postfix').postfix,
		types = require('luasnip.util.types'),
		parse = require('luasnip.util.parser').parse_snippet,
	},
}

require('luasnip.loaders.from_lua').load { paths = './lua/plugins/snippets/ft' }










