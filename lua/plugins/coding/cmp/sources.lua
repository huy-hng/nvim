local cmp = require('cmp')

local M = {}

-- stylua: ignore
M.source_names = {
	buffer          = 'Buffer',
	cmdline_history = 'History',
	latex_symbols   = 'LaTeX',
	-- luasnip         = 'Snippet',
	neorg           = 'Neorg',
	nvim_lsp        = 'LSP',
	nvim_lua        = 'Lua',
	omni            = 'Omni',
	path            = 'Path',
	tmux            = 'Tmux',
	treesitter      = 'Treesitter',
}

M.sources = cmp.config.sources({
	{ name = 'luasnip' },
	{ name = 'nvim_lsp' },
	{ name = 'nvim_lsp_signature_help' },
	{ name = 'neorg' },
	{ name = 'path' },
	-- { name = 'path', keyword_length = 3 },
}, {
	-- { name = 'cmdline_history' },
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
})

return M
