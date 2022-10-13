local M = {}

M.colors = {
	active = 'StatusLine',
	inactive = 'StatusLineNC',

	tabline = 'TabLineSel',
	pmenu = 'PmenuSel',
	user1 = '%1*',
	userend = '%*',

	normal = 'MiniStatuslineModeNormal',
	insert = 'MiniStatuslineModeInsert',
	visual = 'MiniStatuslineModeVisual',
	command = 'MiniStatuslineModeCommand',
	replace = 'MiniStatuslineModeReplace',
	inactive2 = 'MiniStatuslineInactive',
	other = 'MiniStatuslineModeOther',
}

M.mode_names = {
	n     = 'NORMAL',
	v     = 'VISUAL',
	V     = 'V-LINE',
	['']= 'V-BLOCK',
	i     = 'INSERT',
	R     = 'REPLACE',
	Rv    = 'V-REPLACE',
	c     = 'COMMAND',
	t     = 'TERMINAL',
}

-- M.mode_names = {
-- 	n     = 'N',
-- 	v     = 'V',
-- 	V     = 'V-L',
-- 	['']= 'V-B',
-- 	i     = 'I',
-- 	R     = 'R',
-- 	Rv    = 'V-R',
-- 	c     = 'C',
-- 	t     = 'T',
-- }

M.mode_colors = {
	n     = M.colors['normal'],
	v     = M.colors['visual'],
	V     = M.colors['visual'],
	['']= M.colors['visual'],
	i     = M.colors['insert'],
	R     = M.colors['replace'],
	Rv    = M.colors['replace'],
	c     = M.colors['other'],
	t     = M.colors['other'],
}


M.text_style = {
	normal = 'Normal',
	bold = 'Bold',
	italic = 'Italic',
	underline = 'Underline',
	invisible = 'Invisible',
	inverse = 'Inverse',
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
