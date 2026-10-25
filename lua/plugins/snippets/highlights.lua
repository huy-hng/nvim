-- these ext_opts are applied when the node is active
-- (e.g. it has been jumped into, and not out yet).
-- active

-- these ext_opts are applied when the node is not active,
-- but the snippet still is.
-- passive

-- these are applied when a node was/was not jumped into.
-- visited
-- unvisited

-- and these are applied when both the node and the snippet are inactive.
-- snippet_passive

local types = require('luasnip.util.types')

Highlight(0, 'LuasnipTextNodeActive', {})
Highlight(0, 'LuasnipTextNodePassive', {})
Highlight(0, 'LuasnipTextNodeVisited', {})
Highlight(0, 'LuasnipTextNodeUnvisited', {})
Highlight(0, 'LuasnipTextNodeSnippetPassive', {})

Highlight(0, 'LuasnipInsertNodeActive', {})
Highlight(0, 'LuasnipInsertNodePassive', {})
Highlight(0, 'LuasnipInsertNodeVisited', {})
Highlight(0, 'LuasnipInsertNodeUnvisited', {})
Highlight(0, 'LuasnipInsertNodeSnippetPassive', {})

-- fg = 'DiagnosticSignHint'
-- fg = 'DiagnosticSignInfo'
-- fg = 'DiagnosticSignWarn'
-- fg = 'DiagnosticSignError'

Highlight(0, 'LuasnipExitNodeActive', {})
Highlight(0, 'LuasnipExitNodePassive', {})
Highlight(0, 'LuasnipExitNodeVisited', {})
Highlight(0, 'LuasnipExitNodeUnvisited', {})
Highlight(0, 'LuasnipExitNodeSnippetPassive', {})

Highlight(0, 'LuasnipFunctionNodeActive', {})
Highlight(0, 'LuasnipFunctionNodePassive', {})
Highlight(0, 'LuasnipFunctionNodeVisited', {})
Highlight(0, 'LuasnipFunctionNodeUnvisited', {})
Highlight(0, 'LuasnipFunctionNodeSnippetPassive', {})

Highlight(0, 'LuasnipSnippetNodeActive', {})
Highlight(0, 'LuasnipSnippetNodePassive', {})
Highlight(0, 'LuasnipSnippetNodeVisited', {})
Highlight(0, 'LuasnipSnippetNodeUnvisited', {})
Highlight(0, 'LuasnipSnippetNodeSnippetPassive', {})

Highlight(0, 'LuasnipChoiceNodeActive', {})
Highlight(0, 'LuasnipChoiceNodePassive', {})
Highlight(0, 'LuasnipChoiceNodeVisited', {})
Highlight(0, 'LuasnipChoiceNodeUnvisited', {})
Highlight(0, 'LuasnipChoiceNodeSnippetPassive', {})

Highlight(0, 'LuasnipDynamicNodeActive', {})
Highlight(0, 'LuasnipDynamicNodePassive', {})
Highlight(0, 'LuasnipDynamicNodeVisited', {})
Highlight(0, 'LuasnipDynamicNodeUnvisited', {})
Highlight(0, 'LuasnipDynamicNodeSnippetPassive', {})

Highlight(0, 'LuasnipRestoreNodeActive', {})
Highlight(0, 'LuasnipRestoreNodePassive', {})
Highlight(0, 'LuasnipRestoreNodeVisited', {})
Highlight(0, 'LuasnipRestoreNodeUnvisited', {})
Highlight(0, 'LuasnipRestoreNodeSnippetPassive', {})

Highlight(0, 'LuasnipSnippetActive', {})
Highlight(0, 'LuasnipSnippetPassive', {})
-- not used!
Highlight(0, 'LuasnipSnippetVisited', {})
Highlight(0, 'LuasnipSnippetUnvisited', {})
Highlight(0, 'LuasnipSnippetSnippetPassive', {})

return {
	[types.textNode] = {
		active = { hl_group = 'LuasnipTextNodeActive' },
		passive = { hl_group = 'LuasnipTextNodePassive' },
		visited = { hl_group = 'LuasnipTextNodeVisited' },
		unvisited = { hl_group = 'LuasnipTextNodeUnvisited' },
		snippet_passive = { hl_group = 'LuasnipTextNodeSnippetPassive' },
	},
	[types.insertNode] = {
		active = {
			virt_text = { { '', 'NonText' } },
			hl_group = 'LuasnipInsertNodeActive',
		},
		passive = { hl_group = 'LuasnipInsertNodePassive' },
		visited = { hl_group = 'LuasnipInsertNodeVisited' },
		unvisited = { hl_group = 'LuasnipInsertNodeUnvisited' },
		snippet_passive = { hl_group = 'LuasnipInsertNodeSnippetPassive' },
	},
	[types.exitNode] = {
		active = { hl_group = 'LuasnipExitNodeActive' },
		passive = { hl_group = 'LuasnipExitNodePassive' },
		visited = { hl_group = 'LuasnipExitNodeVisited' },
		unvisited = { hl_group = 'LuasnipExitNodeUnvisited' },
		snippet_passive = { hl_group = 'LuasnipExitNodeSnippetPassive' },
	},
	[types.functionNode] = {
		active = { hl_group = 'LuasnipFunctionNodeActive' },
		passive = { hl_group = 'LuasnipFunctionNodePassive' },
		visited = { hl_group = 'LuasnipFunctionNodeVisited' },
		unvisited = { hl_group = 'LuasnipFunctionNodeUnvisited' },
		snippet_passive = { hl_group = 'LuasnipFunctionNodeSnippetPassive' },
	},
	[types.snippetNode] = {
		active = { hl_group = 'LuasnipSnippetNodeActive' },
		passive = { hl_group = 'LuasnipSnippetNodePassive' },
		visited = { hl_group = 'LuasnipSnippetNodeVisited' },
		unvisited = { hl_group = 'LuasnipSnippetNodeUnvisited' },
		snippet_passive = { hl_group = 'LuasnipSnippetNodeSnippetPassive' },
	},
	[types.choiceNode] = {
		active = {
			hl_group = 'LuasnipChoiceNodeActive',
			virt_text = { { '«', 'NonText' } },
		},
		passive = { hl_group = 'LuasnipChoiceNodePassive' },
		visited = { hl_group = 'LuasnipChoiceNodeVisited' },
		unvisited = { hl_group = 'LuasnipChoiceNodeUnvisited' },
		snippet_passive = { hl_group = 'LuasnipChoiceNodeSnippetPassive' },
	},
	[types.dynamicNode] = {
		active = { hl_group = 'LuasnipDynamicNodeActive' },
		passive = { hl_group = 'LuasnipDynamicNodePassive' },
		visited = { hl_group = 'LuasnipDynamicNodeVisited' },
		unvisited = { hl_group = 'LuasnipDynamicNodeUnvisited' },
		snippet_passive = { hl_group = 'LuasnipDynamicNodeSnippetPassive' },
	},
	[types.restoreNode] = {
		active = { hl_group = 'LuasnipRestoreNodeActive' },
		passive = { hl_group = 'LuasnipRestoreNodePassive' },
		visited = { hl_group = 'LuasnipRestoreNodeVisited' },
		unvisited = { hl_group = 'LuasnipRestoreNodeUnvisited' },
		snippet_passive = { hl_group = 'LuasnipRestoreNodeSnippetPassive' },
	},
	[types.snippet] = {
		active = { hl_group = 'LuasnipSnippetActive' },
		passive = { hl_group = 'LuasnipSnippetPassive' },
		-- not used!
		visited = { hl_group = 'LuasnipSnippetVisited' },
		unvisited = { hl_group = 'LuasnipSnippetUnvisited' },
		snippet_passive = { hl_group = 'LuasnipSnippetSnippetPassive' },
	},
}
