local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
	print('snip error')
	return
end

-- require("luasnip/loaders/from_vscode").lazy_load()


--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = '',
	Method = 'm',
	-- Function = '',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = '',
	Interface = '',
	Module = '',
	Property = '',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	-- TypeParameter = '',
	TypeParameter = '',
}


cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(
			'╭', '─', '╮', '│', '╯', '─', '╰', '│'
		)
	},
	-- mapping = {
	mapping = cmp.mapping.preset.insert({
		-- navigation
		['<C-j>'] = cmp.mapping(function(_)
			if cmp.visible() then
				cmp.select_next_item()
			else
				cmp.complete()
			end
		end, { 'i' }),

		['<C-k>'] = cmp.mapping(function(_)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				cmp.complete()
			end
		end, { 'i' }),

		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),

		-- accept / abort
		["<C-l>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			{ 'i', 'c' }
		),
		['<C-h>'] = cmp.mapping(cmp.mapping.abort(), { 'i', 'c' }),

		-- open completion menu
		["<C-Space>"] = cmp.mapping {
			i = cmp.mapping.complete(),
			c = function(_ --[[fallback]])
				if cmp.visible() then
					if not cmp.confirm { select = true } then
						return
					end
				else
					cmp.complete()
				end
			end,
		},

		-- remove bindings
		['<C-y>'] = cmp.config.disable,
		["<Tab>"] = cmp.config.disable,
		["<C-e>"] = cmp.config.disable,
		-- ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- ["<tab>"] = cmp.mapping {
		--   i = cmp.config.disable,
		--   c = function(fallback)
		--     fallback()
		--   end,
		-- },

		-- Testing
		-- ["<c-q>"] = cmp.mapping.confirm {
		--	behavior = cmp.ConfirmBehavior.Replace,
		--	select = true,
		-- },

		-- If you want tab completion :'(
		--  First you have to just promise to read `:help ins-completion`.
		--
		-- ["<Tab>"] = function(fallback)
		--   if cmp.visible() then
		--     cmp.select_next_item()
		--   else
		--     fallback()
		--   end
		-- end,
		-- ["<S-Tab>"] = function(fallback)
		--   if cmp.visible() then
		--     cmp.select_prev_item()
		--   else
		--     fallback()
		--   end
		-- end,

		-- alternate tab and shift tab
		-- ['<Tab>'] = cmp.mapping(function(fallback)
		--	if cmp.visible() then
		--		cmp.select_next_item()
		--	elseif luasnip.expandable() then
		--		luasnip.expand()
		--	elseif luasnip.expand_or_jumpable() then
		--		luasnip.expand_or_jump()
		--	elseif check_backspace() then
		--		fallback()
		--	else
		--		fallback()
		--	end
		-- end, {
		--	'i',
		--	's',
		-- }),
		-- ['<S-Tab>'] = cmp.mapping(function(fallback)
		--	if cmp.visible() then
		--		cmp.select_prev_item()
		--	elseif luasnip.jumpable(-1) then
		--		luasnip.jump(-1)
		--	else
		--		fallback()
		--	end
		-- end, {
		--	'i',
		--	's',
		-- }),
	}),
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		-- fields = { 'abbr', 'menu' },
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
			-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				nvim_lsp = '[LSP]',
				nvim_lua = '[API]',
				luasnip = '[Snippet]',
				buffer = '[Buffer]',
				path = '[Path]',
				tmux = '[Tmux]',
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'tmux' },
		{ name = 'cmdline_history' },
	}, {
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
				end
			}
		},
		{ name = 'path', keyword_length = 3 },
	}),
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = false,
		native_menu = false,
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- P(cmp.select_next_item)
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'cmdline_history' },
		{ name = 'nvim_lsp_document_symbol' },
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'cmdline_history' },
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	})
})
