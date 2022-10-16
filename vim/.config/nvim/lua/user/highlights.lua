local color_data = {
	normal =  { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#7aa2f7' },
	insert =  { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#9ece6a' },
	visual =  { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#bb9af7' },
	command = { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#e0af68' },
	replace = { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#f7768e' },
	other =   { cterm = 'bold', gui = 'bold', guifg = '#15161e', guibg = '#1abc9c' },

	inactive =								{ guifg = '#7aa2f7', guibg = '#16161e' },
	filename =								{ guifg = '#a9b1d6', guibg = '#3b4261' },
}

vim.cmd [[

hi RayNormal  cterm=bold gui=bold guifg=#15161e guibg=#7aa2f7
hi RayInsert  cterm=bold gui=bold guifg=#15161e guibg=#9ece6a
hi RayVisual  cterm=bold gui=bold guifg=#15161e guibg=#bb9af7
hi RayCommand cterm=bold gui=bold guifg=#15161e guibg=#e0af68
hi RayReplace cterm=bold gui=bold guifg=#15161e guibg=#f7768e
hi RayOther   cterm=bold gui=bold guifg=#15161e guibg=#1abc9c

hi RayInactive					  guifg=#7aa2f7 guibg=#16161e
hi RayFilename					  guifg=#a9b1d6 guibg=#3b4261

]]
