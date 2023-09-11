local cmp = require('cmp')

local M = {}

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
	nvim_lua        = 'Lua',
	path            = 'Path',
}

-- stylua: ignore
M.kind_names = {
	Text          = 'Text  ',
	Method        = 'Method',
	Function      = 'Fn    ',
	Constructor   = 'Constr',
	Field         = 'Field ',
	Variable      = 'Var   ',
	Class         = 'Class ',
	Interface     = 'Interf',
	Module        = 'Module',
	Property      = 'Prop  ',
	Unit          = 'Unit  ',
	Value         = 'Value ',
	Enum          = 'Enum  ',
	Keyword       = 'Key   ',
	Snippet       = 'Snip  ',
	Color         = 'Color ',
	File          = 'File  ',
	Reference     = 'Ref   ',
	Folder        = 'Folder',
	EnumMember    = 'EnumM ',
	Constant      = 'Const ',
	Struct        = 'Struct',
	Event         = 'Event ',
	Operator      = 'Operat',
	TypeParameter = 'Type  ',
}

M.sources = cmp.config.sources({
	{ name = 'luasnip' },
	{ name = 'nvim_lsp' },
	{ name = 'nvim_lsp_signature_help' },
	{ name = 'neorg' },
	{ name = 'path' },
	{
		name = 'buffer-lines',
		option = { leading_whitespace = false },
	},
}, {
	{
		name = 'buffer',
		-- keyword_length = 1,
		option = {
			get_bufnrs = function()
				local bufs = {}
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					bufs[vim.api.nvim_win_get_buf(win)] = true
				end
				return vim.tbl_keys(bufs) -- only visible buffers
				-- return vim.api.nvim_list_bufs() -- all buffers
			end,
		},
	},
})

cmp.setup.cmdline({ '/', '?' }, {
	sources = {
		{ name = 'buffer' },
		{ name = 'nvim_lsp_document_symbol' },
	},
})

cmp.setup.filetype('norg', {
	sources = cmp.config.sources({
		{ name = 'neorg' },
	}, {
		{ name = 'buffer' },
	}),
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	}),
})

cmp.setup.filetype('vim', {
	sources = cmp.config.sources({
		{ name = 'cmdline' },
	}, {
		{ name = 'buffer' },
	}),
})

return M
