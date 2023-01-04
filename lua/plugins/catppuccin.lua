local M = {
	'catppuccin/nvim',
	name = 'catppuccin',
	event = 'VeryLazy',
}

-- vim.g.catppuccin_flavour = 'latte' -- latte, frappe, macchiato, mocha
function M.config()
	local integrations = {
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
	}
	local catppuccin = require('catppuccin')

	-- if vim.g.neovide then catppuccin.setup { term_colors = true } end
	catppuccin.setup {
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
				Statusline = { fg = colors.text, bg = nil },
				['@comment'] = { fg = colors.overlay1, style = { 'italic' } },
				-- ['@comment'] = { fg = colors.sky, style = { 'italic' } },
			}
		end,
		integrations = integrations,
	}

	SetColors('catppuccin-mocha')
end
-- M.config()

return M
