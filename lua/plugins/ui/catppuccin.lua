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
				-- LineNr = { fg = colors.surface2 },
				LineNr = { fg = colors.overlay0 },
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


-- Rosewater 	#f5e0dc    rgb(245, 224, 220) 	hsl( 10, 56%, 91%)
-- Flamingo 	#f2cdcd    rgb(242, 205, 205) 	hsl(  0, 59%, 88%)
-- Pink 	    #f5c2e7    rgb(245, 194, 231) 	hsl(316, 72%, 86%)
-- Mauve 	    #cba6f7    rgb(203, 166, 247) 	hsl(267, 84%, 81%)
-- Red 	    	#f38ba8    rgb(243, 139, 168) 	hsl(343, 81%, 75%)
-- Maroon 	    #eba0ac    rgb(235, 160, 172) 	hsl(350, 65%, 77%)
-- Peach 	    #fab387    rgb(250, 179, 135) 	hsl( 23, 92%, 75%)
-- Yellow 	    #f9e2af    rgb(249, 226, 175) 	hsl( 41, 86%, 83%)
-- Green 	    #a6e3a1    rgb(166, 227, 161) 	hsl(115, 54%, 76%)
-- Teal 	    #94e2d5    rgb(148, 226, 213) 	hsl(170, 57%, 73%)
-- Sky 	    	#89dceb    rgb(137, 220, 235) 	hsl(189, 71%, 73%)
-- Sapphire 	#74c7ec    rgb(116, 199, 236) 	hsl(199, 76%, 69%)
-- Blue 	    #89b4fa    rgb(137, 180, 250) 	hsl(217, 92%, 76%)
-- Lavender 	#b4befe    rgb(180, 190, 254) 	hsl(232, 97%, 85%)
-- Text 	    #cdd6f4    rgb(205, 214, 244) 	hsl(226, 64%, 88%)
-- Subtext1 	#bac2de    rgb(186, 194, 222) 	hsl(227, 35%, 80%)
-- Subtext0 	#a6adc8    rgb(166, 173, 200) 	hsl(228, 24%, 72%)
-- Overlay2 	#9399b2    rgb(147, 153, 178) 	hsl(228, 17%, 64%)
-- Overlay1 	#7f849c    rgb(127, 132, 156) 	hsl(230, 13%, 55%)
-- Overlay0 	#6c7086    rgb(108, 112, 134) 	hsl(231, 11%, 47%)
-- Surface2 	#585b70    rgb( 88,  91, 112) 	hsl(233, 12%, 39%)
-- Surface1 	#45475a    rgb( 69,  71,  90)	hsl(234, 13%, 31%)
-- Surface0 	#313244    rgb( 49,  50,  68) 	hsl(237, 16%, 23%)
-- Base			#1e1e2e    rgb( 30,  30,  46)	hsl(240, 21%, 15%)
-- Mantle 		#181825    rgb( 24,  24,  37) 	hsl(240, 21%, 12%)
-- Crust 		#11111b    rgb( 17,  17,  27) 	hsl(240, 23%,  9%)

return M
