local cmp = require('cmp')

local M = {}

local ctx_example = {
	aborted = false,
	bufnr = 5,
	cache = {
		entries = {},
		--   <metatable> = {
		--     __index = {
		--       clear = <function 1>,
		--       ensure = <function 2>,
		--       get = <function 3>,
		--       key = <function 4>,
		--       new = <function 5>,
		--       set = <function 6>
		--     }
		--   }
		-- },
		cursor = {
			character = 2,
			col = 3,
			line = 15,
			row = 16,
		},
		cursor_after_line = '',
		cursor_before_line = '\t\t',
		cursor_line = '\t\t',
		filetype = 'lua',
		id = 25,
		option = {},
		prev_context = {
			aborted = true,
			bufnr = 5,
			cursor = {
				character = 2,
				col = 3,
				line = 15,
				row = 16,
			},
			cursor_after_line = '',
			cursor_before_line = '\t\t',
			cursor_line = '\t\t',
			filetype = 'lua',
			id = 16,
			option = {
				reason = 'manual',
			},
			time = 65472154,
		},
		time = 65472384,
		-- <metatable> = {
		--   __index = {
		--     abort = <function 7>,
		--     changed = <function 8>,
		--     clone = <function 9>,
		--     empty = <function 10>,
		--     get_offset = <function 11>,
		--     get_reason = <function 12>,
		--     new = <function 13>
		--   }
	},
}

M.sources = cmp.config.sources({
	{ name = 'nvim_lsp_signature_help' }, -- shows function signature with current param emphasized
	{ name = 'luasnip' }, -- put luasnip before lsp so that lsp snippets can be deduped
	{
		name = 'nvim_lsp',
		-- remove Snippets kind from lsp since its already covered by luasnip
		-- entry_filter = function(entry, ctx)
		-- 	local completion_item_kind_name = require('cmp.types').lsp.CompletionItemKind
		-- 	return completion_item_kind_name[entry:get_kind()] ~= 'Snippet'
		-- end,
	},
	{ name = 'neorg' },
	{ name = 'path' },
}, {
	{
		name = 'buffer-lines',
		-- option = { leading_whitespace = false },
	},
	{
		name = 'buffer',
		keyword_length = 3,
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

return M
