local M = {}

M.modes = {
	n     = 'N',
	v     = 'V',
	V     = 'V-L',
	['']= 'V-B',
	i     = 'I',
	R     = 'R',
	Rv    = 'V-R',
	c     = 'C',
	t     = 'T',
}
-- M.modes = {
-- 	n     = 'Normal',
-- 	v     = 'Visual',
-- 	V     = 'V-Line',
-- 	[''] = 'V-Block',
-- 	i     = 'Insert',
-- 	R     = 'Replace',
-- 	Rv    = 'V-Replace',
-- 	c     = 'Command',
-- 	t     = 'Terminal',
-- }

M.text_style = {
	normal = 'Normal',
	bold = 'Bold',
	italic = 'Italic',
	underline = 'Underline',
	invisible = 'Invisible',
	inverse = 'Inverse',
}

M.colors = {
	active = 'StatusLine',
	inactive = 'StatusLineNC',

	tabline = 'TabLineSel',
	pmenu = 'PmenuSel',
	user1 = '%1*',
	userend = '%*',
}

M.get_opts = function()
	return {
		active_color = M.colors['active'],
		inactive_color = M.colors['inactive'],
		left_padding = ' ',
		right_padding = ' ',
		delimiter = ' | ',
	}
end

-- get_highlight_color('StatusLineNC', 'guibg')

return M
