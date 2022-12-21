local has_cmp, cmp = pcall(require, 'cmp')
if not has_cmp then
	print('cmp import error')
	return
end

local kind_icons = require('plugins.cmp.icons')
local mappings = R('plugins.cmp.mappings')

local compare = cmp.config.compare
local compare_fn = require('plugins.cmp.compare')

local has_luasnip, luasnip = pcall(require, 'luasnip')
require('plugins.snippets.init')

local sources = require('plugins.cmp.sources')

cmp.setup {
	mapping = mappings, -- cmp.mapping.preset.insert(mappings),
	sources = sources.sources,
	-- completion = { autocomplete = false },
	snippet = {
		expand = function(args)
			if not has_luasnip then
				has_luasnip, luasnip = pcall(require, 'luasnip')
				if not has_luasnip then return end
			end

			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = {
		-- 	-- winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
		-- 	col_offset = -3,
		-- 	side_padding = 0,
		-- },
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
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			-- This concatonates the icons with the name of the item kind
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = (sources.source_names)[entry.source.name]
			return vim_item

			-- requires https://github.com/onsails/lspkind.nvim
			-- if vim.tbl_contains({ 'path' }, entry.source.name) then
			-- 	local ok, devicons = pcall(require, 'nvim-web-devicons')
			-- 	if ok then
			-- 		local icon, hl_group = devicons.get_icon(entry:get_completion_item().label)
			-- 		if icon then
			-- 			vim_item.kind = icon
			-- 			vim_item.kind_hl_group = hl_group
			-- 			return vim_item
			-- 		end
			-- 		return lspkind.cmp_format { with_text = false }(entry, vim_item)
			-- 	end
			-- end
		end,
	},
	sorting = {
		comparators = {
			compare.locality,
			compare_fn.underscore,
			compare.score,
			compare.order,
		},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	view = {
		entries = 'custom',
		-- entries = { name = 'custom', selection_order = 'near_cursor' },
	},
}

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	}),
})

cmp.setup.cmdline({ '/', '?' }, {
	sources = {
		-- { name = 'cmdline_history' },
		{ name = 'buffer' },
		{ name = 'nvim_lsp_document_symbol' },
	},
})

cmp.setup.cmdline(':', {
	-- completion = { autocomplete = false },
	sources = cmp.config.sources({
		{ name = 'cmdline' },
		-- { name = 'cmdline_history' },
		{ name = 'path' },
	}, {}),
	-- formatting = {
	-- 	fields = { 'kind', 'abbr', 'menu' },
	-- format = function(entry, vim_item)
	-- 	local icon = kind_icons[vim_item.kind]
	-- 	if entry.source.name == 'cmdline_history' then icon = kind_icons[entry.source.name] end
	-- 	vim_item.kind = string.format('%s', icon)
	-- 	vim_item.menu = ({
	-- 		cmdline_history = '[History]',
	-- 	})[entry.source.name]
	-- 	return vim_item
	-- end,
	-- },
})
