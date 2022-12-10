local has_indent, indent = pcall(require, 'indent_blankline')
if not has_indent then return end

local active_color = '#7f849c'
local inactive_color = '#45475a'

vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = inactive_color })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = active_color })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = active_color, underline = true })
indent.setup()

local config = {
	enabled = false,

	bufname_exclude = { 'alpha', 'NvimTree' },
	buftype_exclude = {},

	char = '▏',
	char_blankline = '▏',
	char_highlight_list = {},
	char_list = {},
	char_list_blankline = {},
	char_priority = 1,

	show_current_context = false,
	show_current_context_start = true,
	show_current_context_start_on_current_line = true,

	-- context_char = same as char,
	context_char_blankline = '▏',
	context_char_list = {},
	context_char_list_blankline = {},
	context_highlight_list = {},
	context_pattern_highlight = {},
	context_start_priority = 0,
	context_patterns = {
		'class',
		'^func',
		'method',
		'^if',
		'while',
		'for',
		'with',
		'try',
		'except',
		'arguments',
		'argument_list',
		'object',
		'dictionary',
		'element',
		'table',
		'tuple',
		'do_block',
	},
	use_treesitter = true,
	use_treesitter_scope = false,

	disable_warning_message = false,
	disable_with_nolist = false,

	filetype = {},
	filetype_exclude = {
		'NvimTree',
		'NeogitStatus',
		'lspinfo',
		'packer',
		'checkhealth',
		'help',
		'man',
		'',
	},

	indent_level = 10,
	max_indent_increase = 10,
	show_end_of_line = false,
	show_first_indent_level = true,
	show_foldtext = false,
	show_trailing_blankline_indent = false,

	space_char_blankline = ' ',
	space_char_blankline_highlight_list = {},
	space_char_highlight_list = {},

	strict_tabs = true,

	viewport_buffer = 10,
}

for setting, value in pairs(config) do
	vim.g['indent_blankline_' .. setting] = value
end
