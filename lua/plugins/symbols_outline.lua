local M = {
	'simrat39/symbols-outline.nvim', -- show symbols in sidebar
}

function M.config()
	local outline = require('symbols-outline')

	local outlinemap = MapCreator('n', '<localleader>', '[Symbols Outline]')
	outlinemap('o', outline.toggle_outline, 'Toggle Symbols Outline')
	-- outlinemap('o', outline.open_outline, 'Toggle Symbols Outline')
	-- outlinemap('c', outline.close_outline, 'Toggle Symbols Outline')

	vim.api.nvim_set_hl(0, 'FocusedSymbol', {
		fg = '#45475a',
		-- sp = 'red',
		-- link = 'Whitespace',
		-- bg = 'black',
		-- blend = 100,
	})

	outline.setup {
		highlight_hovered_item = true,
		auto_preview = false,
		preview_bg_highlight = 'NormalFloat',
		winblend = 0,

		position = 'right',
		relative_width = false,
		width = 40,
		auto_close = false,

		show_guides = true,
		show_numbers = false,
		show_relative_numbers = false,
		show_symbol_details = true,
		autofold_depth = 3,
		auto_unfold_hover = true,
		fold_markers = { '', '' },
		wrap = false,
		-- These keymaps can be a string or a table for multiple keys
		keymaps = {
			-- close = { '<Esc>', 'q' },
			close = { 'q' },
			goto_location = '<Cr>',
			focus_location = 'o',
			toggle_preview = '<C-space>',
			hover_symbol = 'K',
			rename_symbol = 'r',
			code_actions = 'a',
			fold = { 'h', 'za' },
			unfold = 'l',
			fold_all = 'W',
			unfold_all = 'E',
			fold_reset = 'R',
		},
		lsp_blacklist = {},
		symbol_blacklist = {},
		symbols = {
			String = { icon = '', hl = '@string' },
			Method = { icon = '', hl = '@method' },
			Function = { icon = '', hl = '@function' },
			Constructor = { icon = '', hl = '@constructor' },
			Field = { icon = '', hl = '@field' },
			Variable = { icon = '', hl = '@constant' },
			Class = { icon = '𝓒', hl = '@type' },
			Interface = { icon = '', hl = '@type' },
			Module = { icon = '', hl = '@namespace' },
			Property = { icon = '', hl = '@method' },

			Enum = { icon = '', hl = '@type' },
			Key = { icon = '', hl = '@type' },

			File = { icon = '', hl = '@text.uri' },

			EnumMember = { icon = '', hl = '@field' },
			Constant = { icon = '', hl = '@constant' },
			Struct = { icon = 'פּ', hl = '@type' },
			Event = { icon = '🗲', hl = '@type' },
			Operator = { icon = '', hl = '@operator' },
			TypeParameter = { icon = '', hl = '@parameter' },

			Null = { icon = 'NULL', hl = '@type' },
			Namespace = { icon = '', hl = '@namespace' },
			Package = { icon = '', hl = '@namespace' },
			Number = { icon = '', hl = '@number' },
			Boolean = { icon = '⊨', hl = '@boolean' },
			Array = { icon = '', hl = '@constant' },
			Object = { icon = '⦿', hl = '@type' },
		},
	}
end
return M
