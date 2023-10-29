local opts = {
	width = 40,
	-- title_width = 40,
	-- divider_width = 44,
	header_hl = 'sapphire',
	divider_hl = 'lavender',
	footer_hl = 'white2',
	quote_hl = 'white3',
	text_hl = 'Comment',
}

opts.title_width = opts.title_width or opts.width
opts.divider_width = opts.divider_width or opts.width + 4

return opts

-- '@text.title',
-- '@text.strong',
-- '@keyword.export',

-- TodoBgTEST guibg=#f2cdcd gui=bold
-- TodoFgTEST guifg=#f2cdcd
-- TodoBgNOTE guibg=#94e2d5 gui=bold
-- TodoFgNOTE guifg=#94e2d5
-- TodoBgPERF guibg=#f2cdcd gui=bold
-- TodoFgPERF guifg=#f2cdcd
-- TodoBgHACK guibg=#f9e2af gui=bold
-- TodoFgHACK guifg=#f9e2af
-- TodoBgTODO guibg=#89dceb gui=bold
-- TodoFgTODO guifg=#89dceb
-- TodoBgWARN guibg=#f9e2af gui=bold
-- TodoFgWARN guifg=#f9e2af
-- TodoBgFIX  guibg=#f38ba8 gui=bold
-- TodoFgFIX  guifg=#f38ba8
