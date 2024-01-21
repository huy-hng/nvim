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
		transparent_background = vim.env.KITTY_WINDOW_ID and true or false,
		show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
		term_colors = false,
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
		color_overrides = {
			-- mocha = {
				-- base = '#1E1E2E',
				-- base = '#1E1E4E',
			-- }
		},
		-- :h catppuccin-overwriting-colors
		custom_highlights = function(colors)
			return {
				LineNr              = { fg = colors.surface2 },
				LineNrHighlight     = { fg = colors.overlay2 },
				LineNrHighlightFold = { fg = colors.subtext1 },

				-- CursorLineNr = { fg = colors.text },
				FoldColumn = { fg = colors.overlay2 },

				Statusline = { fg = colors.text, bg = nil },
				TabLine = { fg = colors.surface2 },
				TabLineSel = { bg = colors.surface0 },
				Float = { fg = colors.text },

				-- default colors
				-- CursorLineNr = { fg = colors.lavender },
				-- Comment = { fg = colors.overlay0 },
			}
		end,
		integrations = integrations,
	}
	-- prevented breaking of all colors on plugin reload
	-- nvim.schedule(SetColors, 'catppuccin-mocha')
end

-- rosewater #f5e0dc  rgb(245, 224, 220)  hsl( 10, 56%, 91%)
-- flamingo  #f2cdcd  rgb(242, 205, 205)  hsl(  0, 59%, 88%)
-- pink 	 #f5c2e7  rgb(245, 194, 231)  hsl(316, 72%, 86%)
-- mauve 	 #cba6f7  rgb(203, 166, 247)  hsl(267, 84%, 81%)
-- red 	     #f38ba8  rgb(243, 139, 168)  hsl(343, 81%, 75%)
-- maroon 	 #eba0ac  rgb(235, 160, 172)  hsl(350, 65%, 77%)
-- peach 	 #fab387  rgb(250, 179, 135)  hsl( 23, 92%, 75%)
-- yellow 	 #f9e2af  rgb(249, 226, 175)  hsl( 41, 86%, 83%)
-- green 	 #a6e3a1  rgb(166, 227, 161)  hsl(115, 54%, 76%)
-- teal 	 #94e2d5  rgb(148, 226, 213)  hsl(170, 57%, 73%)
-- sky 	     #89dceb  rgb(137, 220, 235)  hsl(189, 71%, 73%)
-- sapphire  #74c7ec  rgb(116, 199, 236)  hsl(199, 76%, 69%)
-- blue 	 #89b4fa  rgb(137, 180, 250)  hsl(217, 92%, 76%)
-- lavender  #b4befe  rgb(180, 190, 254)  hsl(232, 97%, 85%)
-- text 	 #cdd6f4  rgb(205, 214, 244)  hsl(226, 64%, 88%)
-- subtext1  #bac2de  rgb(186, 194, 222)  hsl(227, 35%, 80%)
-- subtext0  #a6adc8  rgb(166, 173, 200)  hsl(228, 24%, 72%)
-- overlay2  #9399b2  rgb(147, 153, 178)  hsl(228, 17%, 64%)
-- overlay1  #7f849c  rgb(127, 132, 156)  hsl(230, 13%, 55%)
-- overlay0  #6c7086  rgb(108, 112, 134)  hsl(231, 11%, 47%)
-- surface2  #585b70  rgb( 88,  91, 112)  hsl(233, 12%, 39%)
-- surface1  #45475a  rgb( 69,  71,  90)  hsl(234, 13%, 31%)
-- surface0  #313244  rgb( 49,  50,  68)  hsl(237, 16%, 23%)
-- base		 #1e1e2e  rgb( 30,  30,  46)  hsl(240, 21%, 15%)
-- mantle 	 #181825  rgb( 24,  24,  37)  hsl(240, 21%, 12%)
-- crust 	 #11111b  rgb( 17,  17,  27)  hsl(240, 23%,  9%)

return M
