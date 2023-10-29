local cmp = require('cmp')

local M = {}

M.sources = cmp.config.sources({
	{ name = 'nvim_lsp_signature_help' }, -- shows function signature with current param emphasized
	{
		name = 'nvim_lsp',
		-- remove Snippets kind from lsp since its already covered by luasnip
		-- entry_filter = function(entry, ctx)
		-- 	local completion_item_kind = require('cmp.types').lsp.CompletionItemKind
		-- 	return completion_item_kind[entry:get_kind()] ~= 'Snippet'
		-- end,
	},
	{ name = 'luasnip' },
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
