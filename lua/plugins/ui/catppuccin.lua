local M = {
	'catppuccin/nvim',
	name = 'catppuccin',
	event = 'VimEnter',
}

-- vim.g.catppuccin_flavour = 'latte' -- latte, frappe, macchiato, mocha
function M.config()
	local integrations = {
		alpha = true,
		cmp = true,
		dap = {
			enabled = true,
			enable_ui = true,
		},
		dropbar = true,
		flash = true,
		gitsigns = true,
		harpoon = true,
		mason = true,
		neogit = true,
		neotest = true,
		noice = true,
		notify = true,
		nvimtree = true,
		semantic_tokens = true,
		symbols_outline = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		-- ts_rainbow = true,
		ts_rainbow2 = true,
		-- rainbow_delimiters = true,
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

	if vim.g.has_neovide then catppuccin.setup { term_colors = true } end
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
		styles = {
			comments = { 'italic' },
			conditionals = {},
			loops = {},
			functions = {},
			keywords = { 'italic' },
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
				LineNr = { fg = colors.surface2 },
				FoldColumn = { fg = colors.overlay1 },

				-- default colors
				-- CursorLineNr = { fg = colors.lavender },
				-- Comment = { fg = colors.overlay0 },
			}
		end,
		integrations = integrations,
	}
	nvim.schedule(SetColors, 'catppuccin-mocha')
end

return M
