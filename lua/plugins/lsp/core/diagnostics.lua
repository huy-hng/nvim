local icons = require('config.ui.icons').diagnostics_sign

vim.diagnostic.config {
	virtual_text = false,
	signs = {
		severity = { min = vim.diagnostic.severity.HINT },
		text = {
			[vim.diagnostic.severity.ERROR] = icons.error,
			[vim.diagnostic.severity.WARN] = icons.warning,
			[vim.diagnostic.severity.INFO] = icons.info,
			[vim.diagnostic.severity.HINT] = icons.hint,
		},
	},
	update_in_insert = false,
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
	severity_sort = true,
	float = {
		max_height = 20,
		max_width = 120,

		severity_sort = true,
		pad_bottom = 1,
		-- pad_top = 1, -- creates weird bug with highlighting
		focusable = true,
		style = 'minimal',
		border = 'solid', -- bold | double | none | rounded | shadow | single | solid
		source = 'if_many',
		header = '',

		-- header = '  Diagnostics',
		prefix = function(diagnostic, i, total)
			local prefix = '  '
			if total > 1 then prefix = prefix .. i .. ': ' end
			return prefix, 'Diagnostics'
		end,
		suffix = function(diagnostic, i, total)
			local suffix = ' (' .. diagnostic.code .. ')  '
			-- P(diagnostic)
			return suffix, 'Comment'
		end,
		-- relative = 'editor',
		-- position = { row = -2, col = '55%' },
	},
}
