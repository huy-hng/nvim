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
		'hrsh7th/cmp-emoji',

		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip', -- snippet completions

		'hrsh7th/cmp-omni',

		'ray-x/cmp-treesitter', -- source for treesitter nodes.
		'dmitmel/cmp-cmdline-history',
		'andersevenrud/cmp-tmux',
	},
}

function M.config()
	if vim.g.started_by_firenvim == true then return end

	---@module cmp
	local cmp = require('cmp')

	local kind_icons = require('config.ui.icons').lsp_kinds
	local mappings = require('plugins.coding.cmp.mappings')

	local compare = cmp.config.compare
	local compare_fn = require('plugins.coding.cmp.compare')

	require('plugins.coding.snippets.init')

	local sources = require('plugins.coding.cmp.sources')

	cmp.setup {
		mapping = mappings, -- cmp.mapping.preset.insert(mappings),
		sources = sources.sources,
		-- completion = { autocomplete = false },
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		window = {
			-- documentation = cmp.config.disable,
			-- documentation = cmp.config.window.bordered( '╭', '─', '╮', '│', '╯', '─', '╰', '│'),
			-- completion = {
			-- 	-- winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
			-- 	col_offset = -3,
			-- 	side_padding = 0,
			-- },

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

	cmp.setup.filetype('norg', {
		sources = cmp.config.sources({
			{ name = 'neorg' }, -- You can specify the `cmp_git` source if you were installed it.
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
end

return M
