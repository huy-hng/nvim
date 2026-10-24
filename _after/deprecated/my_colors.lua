local color_data = {
	RayNormal   = { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#7aa2f7' },
	RayInsert   = { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#9ece6a' },
	RayVisual   = { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#bb9af7' },
	RayCommand  = { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#e0af68' },
	RayReplace  = { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#f7768e' },
	RayOther    = { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#1abc9c' },

	RayInactive = 								{ guifg = '#7aa2f7', guibg = '#16161e' },
	RayFilename = 								{ guifg = '#a9b1d6', guibg = '#3b4261' },
}

-- for k, v in pairs(color_data) do
-- 	P(v)
-- 	vim.api.nvim_set_hl(0, k, v)
-- end
