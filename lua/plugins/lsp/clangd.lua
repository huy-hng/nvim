local M = {
	'p00f/clangd_extensions.nvim',
	event = 'VeryLazy',
}

function M.config()
	require('clangd_extensions').setup {
		inlay_hints = {
			inline = false,
			-- inline = vim.fn.has('nvim-0.10') == 1,
			-- Options other than `highlight' and `priority' only work
			-- if `inline' is disabled
			-- Only show inlay hints for the current line
			only_current_line = true,
			-- Event which triggers a refresh of the inlay hints.
			-- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
			-- not that this may cause  higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = { 'CursorHold', 'CursorMoved' },
			-- whether to show parameter hints with the inlay hints or not
			show_parameter_hints = true,
			-- prefix for parameter hints
			parameter_hints_prefix = '<- ',
			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = '=> ',
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			max_len_align_padding = 1,
			right_align = false,
			right_align_padding = 7,
			highlight = 'NonText',
			priority = 100,
		},
		ast = {
			role_icons = {
				type = '',
				declaration = '',
				expression = '',
				specifier = '',
				statement = '',
				['template argument'] = '',
			},
			kind_icons = {
				Compound = '',
				Recovery = '',
				TranslationUnit = '',
				PackExpansion = '',
				TemplateTypeParm = '',
				TemplateTemplateParm = '',
				TemplateParamObject = '',
			},
			highlights = {
				detail = 'Comment',
			},
		},
	}
end

return M
