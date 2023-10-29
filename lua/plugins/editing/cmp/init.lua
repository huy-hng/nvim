local M = {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'hrsh7th/cmp-buffer', -- buffer completions
		'hrsh7th/cmp-path', -- path completions
		'hrsh7th/cmp-cmdline', -- cmdline completions

		'hrsh7th/cmp-nvim-lsp',
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

	local mappings = require('plugins.editing.cmp.mappings')
	local compare = require('plugins.editing.cmp.compare')
	local sources = require('plugins.editing.cmp.sources')
	local formatting = require('plugins.editing.cmp.formatting')

	require('plugins.editing.snippets.init')

	cmp.setup {
		mapping = mappings,
		sources = sources.sources,
		snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
		formatting = {
			expandable_indicator = false,
			fields = { 'kind', 'abbr', 'menu' },
			format = formatting.format,
		},
		matching = { disallow_partial_fuzzy_matching = true },
		sorting = { comparators = compare.comparators },
		confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
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
		experimental = { ghost_text = false },
	}

	cmp.setup.cmdline(':', {
		sources = {
			{ name = 'cmdline', priority = 100 },
			{ name = 'path', priority = 10 },
			{ name = 'cmdline_history', priority = 1 },
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
			format = formatting.cmdline_format,
		},
	})

	cmp.setup.cmdline({ '/', '?' }, {
		sources = {
			{ name = 'nvim_lsp_document_symbol' },
			{ name = 'buffer' },
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
end

return M
