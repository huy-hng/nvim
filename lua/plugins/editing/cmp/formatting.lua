local M = {}

local sources = require('plugins.editing.cmp.sources')
local lsp_kind_icons = require('config.ui.icons').lsp_kinds
local cmp_icons = require('config.ui.icons').cmp_sources

-- stylua: ignore
M.source_names = {
	buffer          = 'Buffer',
	['buffer-lines']= 'Lines',
	cmdline         = 'Command',
	cmdline_history = 'History',
	latex_symbols   = 'LaTeX',
	luasnip         = 'Snip',
	neorg           = 'Neorg',
	nvim_lsp        = 'LSP',
	path            = 'Path',
}

-- stylua: ignore
M.kind_names = {
	Text          = '  Text',
	Method        = 'Method',
	Function      = '  Func',
	Constructor   = 'Constr',
	Field         = ' Field',
	Variable      = '   Var',
	Class         = ' Class',
	Interface     = 'Interf',
	Module        = 'Module',
	Property      = '  Prop',
	Unit          = '  Unit',
	Value         = ' Value',
	Enum          = '  Enum',
	Keyword       = '   Key',
	Snippet       = '  Snip',
	Color         = ' Color',
	File          = '  File',
	Reference     = '   Ref',
	Folder        = 'Folder',
	EnumMember    = ' EnumM',
	Constant      = ' Const',
	Struct        = 'Struct',
	Event         = ' Event',
	Operator      = 'Operat',
	TypeParameter = '  Type',
}

local function truncate_text(text, max_length)
	if #text > max_length then
		text = string.sub(text, 1, max_length) .. '…'
	end
	return text
end

--@param entry cmp.Entry
--@param vim_item vim.CompletedItem
--@return vim.comp
function M.format(entry, vim_item)
	vim_item.abbr = truncate_text(vim_item.abbr, 30)
	end

	local icon = lsp_kind_icons[entry.source.name] or lsp_kind_icons[vim_item.kind]
	vim_item.kind = string.format('%s %s', icon, M.kind_names[vim_item.kind])

	-- vim_item.kind_hl_group = ''
	-- vim_item.abbr_hl_group = 'NonText'
	vim_item.menu_hl_group = 'Comment'

	local source = M.source_names[entry.source.name]
	-- vim_item.menu = source and string.format('❨%s❩', source) or ''
	vim_item.menu = source or ''
	return vim_item
end

function M.cmdline_format(entry, vim_item)
	vim_item.abbr = truncate_text(vim_item.abbr, 50)

	local icon = cmp_icons[entry.source.name] or lsp_kind_icons[vim_item.kind]
	icon = vim_item.kind == 'Variable' and lsp_kind_icons.Constructor or icon

	-- local source = M.source_names[entry.source.name]
	-- vim_item.kind = string.format('%s %s', icon, source)
	vim_item.kind = icon
	vim_item.menu_hl_group = 'Comment'
	return vim_item
end

return M
