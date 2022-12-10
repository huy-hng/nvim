local has_cmp, cmp = pcall(require, 'cmp')
-- print('has_cmp', has_cmp)
if not has_cmp then return end

local kind_icons = require('plugins.cmp.icons')

local compare = cmp.config.compare
local compare_fn = R('plugins.cmp.compare')

local has_luasnip, luasnip = pcall(require, 'luasnip')
-- print('has_luasnip', has_luasnip)

cmp.setup {
	snippet = {
		expand = function(args)
			if not has_luasnip then
				has_luasnip, luasnip = pcall(require, 'luasnip')
				if not has_luasnip then return end
			end
			require('plugins.snippets')
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(
			'╭',
			'─',
			'╮',
			'│',
			'╯',
			'─',
			'╰',
			'│'
		),
	},
	mapping = cmp.mapping.preset.insert(require('plugins.cmp.mappings')),
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		-- fields = { 'abbr', 'menu' },
		format = function(entry, vim_item)
			-- Kind icons
			-- vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				luasnip = '[Snippet]',
				nvim_lsp = '[LSP]',
				-- nvim_lua = '[API]',
				buffer = '[Buffer]',
				-- cmdline_history = '[History]',
				path = '[Path]',
				tmux = '[Tmux]',
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		-- { name = 'nvim_lua' },
		-- { name = 'cmdline_history' },
	}, {
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
	}),
	sorting = {
		comparators = {
			-- available comparisons from cmp.config.compare ordered by default ordering
			-- compare.offset, -- in python offset is the same everywhere
			-- compare.exact, -- if whats written is exactly found in the completion menu
			-- -- compare.scopes, -- i think ranks stuff in the same scope higher (off by default)
			-- compare.score, -- in python score is the same everywhere, in lua in ranks lsp stuff higher
			-- compare.recently_used,
			-- compare.locality, -- no clue what this does
			-- compare.kind, -- sort by kind (method, enum, function, etc.)
			-- compare.sort_text, -- kinda sorts alphabetically but not quite
			-- compare.length,
			-- compare.order, -- perfect for python: putting __ completions further down

			function(entry1, entry2)
				local normal1, normal2, better = compare_fn.base_comparer(entry1, entry2)
				if not normal1 then return end
				if not normal2 then return true end
				return better
			end,
			compare.score,
		},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
	view = {
		-- entries = 'native'
	},
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	}),
})

-- P(cmp.select_next_item)
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'cmdline_history' },
		{ name = 'nvim_lsp_document_symbol' },
		{ name = 'buffer' },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'cmdline' },
		{ name = 'cmdline_history' },
		{ name = 'path' },
	}, {}),
	-- completion = { autocomplete = false },
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			local icon = kind_icons[vim_item.kind]
			if entry.source.name == 'cmdline_history' then icon = kind_icons[entry.source.name] end
			vim_item.kind = string.format('%s', icon)
			vim_item.menu = ({
				cmdline_history = '[History]',
			})[entry.source.name]
			return vim_item
		end,
	},
})
