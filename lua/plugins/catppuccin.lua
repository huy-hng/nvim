local M = {
	'catppuccin/nvim',
	name = 'catppuccin',
	event = 'VeryLazy',
}

-- vim.g.catppuccin_flavour = 'latte' -- latte, frappe, macchiato, mocha
function M.config()
	require('catppuccin').setup {
		flavour = 'mocha', -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = 'latte',
			dark = 'mocha',
		},
		term_colors = false,
		dim_inactive = {
			enabled = false,
			shade = 'dark',
			percentage = 0,
		},
		no_italic = false, -- Force no italic
		no_bold = false, -- Force no bold
		styles = {
			comments = { 'italic' },
			conditionals = { 'italic' },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		transparent_background = false,
		-- :h catppuccin-overwriting-colors
		custom_highlights = function(colors)
			return {
				Statusline = { fg = colors.text, bg = colors.none },
				-- Normal = { fg = colors.text, bg = colors.base }, -- default
				-- ['@constant.builtin'] = { fg = colors.peach, style = {} },
				-- ['@comment'] = { fg = colors.surface2, style = { 'italic' } },
			}
		end,
		integrations = {
			bufferline = true,
			cmp = true,
			dap = {
				enabled = true,
				enable_ui = true,
			},
			gitsigns = true,
			harpoon = true,
			mason = true,
			neogit = true,
			neotest = true,
			noice = true,
			notify = true,
			nvimtree = true,
			symbols_outline = true,
			telescope = true,
			treesitter = true,
			treesitter_context = true,
			ts_rainbow = true,
			vimwiki = true,
			which_key = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { 'italic' },
					hints = { 'italic' },
					warnings = { 'italic' },
					information = { 'italic' },
				},
				underlines = {
					errors = { 'underline' },
					hints = { 'underline' },
					warnings = { 'underline' },
					information = { 'underline' },
				},
			},
			-- https://github.com/catppuccin/nvim#integrations
		},
	}

	SetColors('catppuccin-mocha')
end

return M
