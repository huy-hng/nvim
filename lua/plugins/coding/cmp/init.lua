local M = {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer', -- buffer completions
		'hrsh7th/cmp-path', -- path completions
		'hrsh7th/cmp-cmdline', -- cmdline completions

		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-nvim-lsp-document-symbol',

		'amarakon/nvim-cmp-buffer-lines',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip', -- snippet completions

		'hrsh7th/cmp-omni',
		'dmitmel/cmp-cmdline-history',
	},
}

-- for config reference /home/huy/.local/share/nvim/lazy/nvim-cmp/lua/cmp/config/default.lua
function M.config()
	if vim.g.started_by_firenvim == true then return end

	local cmp = require('cmp')

	local lsp_kinds = R('config.ui.icons').lsp_kinds
	local cmp_icons = R('config.ui.icons').cmp_sources
	local mappings = require('plugins.coding.cmp.mappings')

	local compare = cmp.config.compare
	local compare_fn = require('plugins.coding.cmp.compare')

	require('plugins.coding.snippets.init')

	local sources = R('plugins.coding.cmp.sources')
	cmp.setup {
		mapping = mappings,
		sources = sources.sources,
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		formatting = {
			expandable_indicator = false,
			fields = { 'kind', 'abbr', 'menu' },
			format = function(entry, vim_item)
				-- truncate completion text
				local max_length = 30
				if #vim_item.abbr > max_length then
					vim_item.abbr = string.sub(vim_item.abbr, 1, max_length) .. '…'
				end

				local icon = lsp_kinds[entry.source.name] or lsp_kinds[vim_item.kind]
				vim_item.kind = string.format('%s %s', icon, sources.kind_names[vim_item.kind])

				-- vim_item.kind_hl_group = ''
				-- vim_item.abbr_hl_group = 'NonText'
				vim_item.menu_hl_group = 'Comment'

				local source = sources.source_names[entry.source.name]
				-- vim_item.menu = source and string.format('❨%s❩', source) or ''
				vim_item.menu = source or ''
				return vim_item
			end,
		},
		matching = {
			disallow_partial_fuzzy_matching = true,
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
		view = { entries = 'custom', docs = { auto_open = false } },
		window = {
			-- documentation = cmp.config.disable,
			documentation = {
				zindex = 44,
				-- max_width = 40,
			},
			completion = {
				-- winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
				col_offset = -9,

				side_padding = 1,

				scrollbar = true,
				scrolloff = 4,
			},
		},
		experimental = {
			ghost_text = false,
		},
	}

	cmp.setup.cmdline(':', {
		sources = cmp.config.sources {
			{ name = 'cmdline', priority = 10 },
			{ name = 'path', priority = 5 },
			{ name = 'cmdline_history', priority = 0 },
		},
		window = {
			completion = {
				col_offset = -2,
				side_padding = 1,
				scrollbar = true,
				scrolloff = 4,
			},
		},
		formatting = {
			fields = { 'kind', 'abbr' },
			format = function(entry, vim_item)
				-- truncate completion text
				local max_length = 50
				if #vim_item.abbr > max_length then
					vim_item.abbr = string.sub(vim_item.abbr, 1, max_length) .. '…'
				end

				local icon = cmp_icons[entry.source.name] or lsp_kinds[vim_item.kind]
				icon = vim_item.kind == 'Variable' and lsp_kinds.Constructor or icon

				local source = sources.source_names[entry.source.name]
				-- vim_item.kind = string.format('%s %s', icon, source)
				vim_item.kind = icon
				vim_item.menu_hl_group = 'Comment'
				return vim_item
			end,
		},
	})
end

return M
