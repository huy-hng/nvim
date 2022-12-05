local has_cmp, cmp = pcall(require, 'cmp')
if not has_cmp then return end

local has_luasnip, luasnip = pcall(require, 'luasnip')
if not has_luasnip then return end

local kind_icons = require('plugins.cmp.icons')

local CompletionItemKind = {
	Text = 1,
	Method = 2,
	Function = 3,
	Constructor = 4,
	Field = 5,
	Variable = 6,
	Class = 7,
	Interface = 8,
	Module = 9,
	Property = 10,
	Unit = 11,
	Value = 12,
	Enum = 13,
	Keyword = 14,
	Snippet = 15,
	Color = 16,
	File = 17,
	Reference = 18,
	Folder = 19,
	EnumMember = 20,
	Constant = 21,
	Struct = 22,
	Event = 23,
	Operator = 24,
	TypeParameter = 25,
}
local reverse = vim.tbl_add_reverse_lookup(CompletionItemKind)

local kind_mapper =
	{ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }

-- %s/^<\(.*\)>{/local entry_\1 = {
-- %s/= <\(.*\)>{/= {
-- %s/<\(.*\)> = {/\1 = {
-- %s/= <\(.*\)>{/=
-- %s/ <\(.*\)>{/{/
-- %s/= <\(.*\)>,/= '\1',/
-- %s/= <\(.*\)>/= '\1'/
-- %s/<\(table .\)>,/'\1',/g
-- %s/<\(table ..\)>,/'\1',/g
-- %s/, <\(table .\)>//g

local function redir(data)
	return function()
		vim.cmd.redir('>> get_kind.lua')
		vim.pretty_print(data)
		vim.cmd.redir('END')
	end
end

Counter = 0
cmp.setup {
	snippet = {
		expand = function(args)
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
				cmdline_history = '[History]',
				path = '[Path]',
				tmux = '[Tmux]',
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'cmdline_history' },
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
			function(entry1, entry2)
				Counter = Counter + 1

				-- if Counter % 10 == 0 then
				-- local kind = reverse[entry1:get_kind()]
				-- vim.schedule(redir(kind))
				-- if Counter == 1 then
				-- 	vim.schedule(redir(entry1))
				-- end
				local kind1 = kind_mapper[entry1:get_kind()]
				local kind2 = kind_mapper[entry2:get_kind()]

				-- P(entry1)
				-- P(entry2)
				if kind1 < kind2 then return true end
			end,
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
