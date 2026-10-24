local M = {
	'windwp/nvim-autopairs', -- pair brackets
	dependencies = { 'hrsh7th/nvim-cmp' },
	event = { 'InsertEnter', 'CmdlineEnter', 'CmdwinEnter' },
}

function M.config()
	local npairs = require('nvim-autopairs')

	npairs.setup {
		check_ts = true,
		ts_config = {
			lua = { 'string', 'source' },
			javascript = { 'string', 'template_string' },
			java = false,
		},
		disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
		fast_wrap = {
			map = '<M-t>',
			chars = { '{', '[', '(', '"', "'" },
			pattern = string.gsub([[ [%'%'%)%>%]%)%}%,] ]], '%s+', ''),
			offset = 0, -- Offset from pattern match
			end_key = '$',
			keys = 'qwertyuiopzxcvbnmasdfghjkl',
			check_comma = true,
			-- highlight = 'PmenuSel',
			-- highlight_grey = 'LineNr',
			highlight = 'Search',
			highlight_grey = 'Comment',
		},
	}

	local event = require('cmp').event
	local cmp_autopairs = require('nvim-autopairs.completion.cmp')

	event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
end

return M
