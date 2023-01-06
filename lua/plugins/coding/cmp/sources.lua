local cmp = require('cmp')

local M = {}

M.source_names = {
	buffer = '[Buffer]',
	cmdline_history = '[History]',
	latex_symbols = '[LaTeX]',
	luasnip = '[Snippet]',
	neorg = '[Neorg]',
	nvim_lsp = '[LSP]',
	nvim_lua = '[Lua]',
	omni = '[Omni]',
	path = '[Path]',
	tmux = '[Tmux]',
	treesitter = '[Treesitter]',
	orgmode = '[Org]',
}

M.sources = cmp.config.sources({
	{ name = 'luasnip' },
	{ name = 'nvim_lsp' },
	{ name = 'nvim_lsp_signature_help' },
	{ name = 'orgmode' },

	-- { name = 'omni' },
	-- { name = 'nvim_lua' },
	-- { name = 'cmdline_history' },
}, {
	-- { name = 'treesitter' },
	{ name = 'tmux' },
	{
		name = 'buffer',
		keyword_length = 1,
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
	{ name = 'path', keyword_length = 3 },
})

return M
