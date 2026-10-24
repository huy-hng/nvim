--  looks like a little devil

--stylua: ignore
return {
	-- |│¦┆┇┊┋▕▔▏
	--     
	fillchars = {
		stl       = ' ', -- StatusLine	 |hl-StatusLine|    statusline of the current window
		stlnc     = ' ', -- StatusLineNC |hl-StatusLineNC|  statusline of the non-current windows
		wbr       = ' ', -- WinBar		 |hl-WinBar| or |hl-WinBarNC| window bar

		-- WinSeparator  |hl-WinSeparator|
		horiz     = '─', -- horizontal separators |:split|
		horizup   = '┴', -- upwards facing horizontal separator
		horizdown = '┬', -- downwards facing horizontal separator
		vert      = '│', -- vertical separators |:vsplit|
		vertleft  = '┤', -- left facing vertical separator
		vertright = '├', -- right facing vertical separator
		verthoriz = '┼', -- overlapping vertical and horizontal separator

		-- Folded  |hl-Folded|
		fold	  = ' ', -- filling 'foldtext' '·'
		foldopen  = '', -- mark the beginning of a fold
		foldclose = '', -- show a closed fold
		foldsep	  = ' ', -- '│' open fold middle marker

		diff      = ' ', -- DiffDelete	 |hl-DiffDelete|    '╱' deleted lines of the 'diff'  option
		eob       = ' ', -- EndOfBuffer	 |hl-EndOfBuffer|   '~' empty lines at the end of a buffer
		msgsep    = ' ', --                                 message separator 'display' 
		-- lastline  = '@', -- NonText		 |hl-NonText|       'display'  contains lastline/truncate
	},

	listchars = {
		-- space    = ' ',
		tab      = '  ', --  ▏
		trail    = '·', -- •
		extends  = '…', -- ❯ Character to show in the last column, when 'wrap'  is off
		-- precedes = '❮', -- …
		nbsp     = '␣',
	},
	cmp_sources = {
		cmdline_history= '',
	},

	lsp_kinds = {
		Text          = '', --  𝓐
		Method        = '',
		Function      = '', --   
		Constructor   = '', --  
		Field         = '', --   ﰠ 
		Variable      = '', --   
		Class         = 'ﴯ', --  𝓒
		Interface     = '', -- 
		Module        = '', -- 
		Property      = 'ﰠ', --   
		Unit          = '', -- 
		Value         = '', -- 
		Enum          = '', -- ℰ
		Keyword       = '', -- 
		Snippet       = '',
		Color         = '', --  
		File          = '', --   
		Reference     = '', --   
		Folder        = '', -- 
		EnumMember    = '', -- 
		Constant      = '', --     
		Struct        = 'פּ', --     𝓢
		Event         = '', --   🗲
		Operator      = '', -- 
		TypeParameter = '', --     𝙏
	},

	settings = {
		Array         = ' ',
		Boolean       = ' ',
		Class         = ' ',
		Color         = ' ',
		Constant      = ' ',
		Constructor   = ' ',
		Enum          = ' ',
		EnumMember    = ' ',
		Event         = ' ',
		Field         = ' ',
		File          = ' ',
		Folder        = ' ',
		Function      = ' ',
		Interface     = ' ',
		Key           = ' ',
		Keyword       = ' ',
		Method        = ' ',
		Module        = ' ',
		Namespace     = ' ',
		Null          = 'ﳠ ',
		Number        = ' ',
		Object        = ' ',
		Operator      = ' ',
		Package       = ' ',
		Property      = ' ',
		Reference     = ' ',
		Snippet       = ' ',
		String        = ' ',
		Struct        = ' ',
		Text          = ' ',
		TypeParameter = ' ',
		Unit          = ' ',
		Value         = ' ',
		Variable      = ' ',
	},

	diagnostics = {
		error   = ' ', -- 
		warning = ' ', -- 
		info    = ' ', -- 
		hint    = ' ', --  
		debug   = ' ', -- 
		trace   = ' ', -- 
	},

	diagnostics_sign = {
		error   = '', -- 
		warning = '◉', -- 
		info    = '', -- 
		hint    = '·', -- 
	},

	dap = {
		breakpoint           = ' ',
		breakpoint_condition = ' ',
		log_point            = ' ',
		stopped              = ' ',
		breakpoint_rejected  = ' ',
		pause                = ' ',
		play                 = ' ',
		step_into            = ' ',
		step_over            = ' ',
		step_out             = ' ',
		step_back            = ' ',
		run_last             = ' ',
		terminate            = ' ',
	},

	git = {
		status_added    = ' ', --  
		status_removed  = ' ', --  
		status_modified = ' ', --  
		added           = ' ', --  
		deleted         = ' ', --  
		modified        = ' ', --  
		renamed         = ' ',
		untracked       = ' ',
		ignored         = ' ',
		unstaged        = ' ',
		staged          = ' ',
		conflict        = ' ',
	},

	misc = {
		showbreak     = '… ', -- ❯ Character when indicating line wrap
		collapsed     = ' ',
		expanded      = ' ',
		current       = ' ',
		folder_empty  = '',
		folder_closed = '',
		folder_open   = '',
		file          = '',
	},

	editor = {
		column_line = '▏',
		indent_line = '▏',
	},

	statuscolumn = {
		fold_expanded  = '',
		fold_collapsed = '┝', -- ❯⟩├┝
		border         = '│', -- '│' '▎''▕''▐''▏'
		thick_border   = '┃',
		full_block     = '█',
		double_border  = '║',
		spacing        = ' ',
	},

	blocks = {
		half_block_left  = '▌',
		full_block       = '█',
		half_block_right = '▐',
		thin_left        = '▏',
		thin_right       = '▕'
	},

	box_drawing = {
		thin_vert        = '│',
		thin_hori        = '─',

		thick_vert       = '┃',
		thick_hori       = '━',

		double_vert      = '║',
		double_hori      = '═',
	},

	gitsigns = {
		add =          '│',
		untracked =    '│',
		change =       '│',
		delete =       '│',
		topdelete =    '│',
		changedelete = '│',
	},
}
