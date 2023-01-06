local wk = require('which-key')

----------------------------------------------Labels------------------------------------------------

wk.register { ['<leader>w'] = { name = 'Vimwiki' } }
wk.register { ['<leader>b'] = { name = 'Buffers' } }
wk.register { ['<leader>f'] = { name = 'Telescope' } }
wk.register { ['<leader>D'] = { name = 'Database' } }
wk.register { ['<leader>d'] = { name = 'NeoTest' } }
wk.register { ['<leader>a'] = { name = 'Harpon' } }
wk.register { ['<leader>t'] = { name = 'Tabs' } }

------------------------------------------Window Commands-------------------------------------------

wk.register {
	['<C-w>'] = {
		name = '+Window',
		-- creating windows
		n = 'New empty Window',
		['< s,v >'] = 'Split Horizontal/Vertical',
		['^'] = 'Split and edit alternate file',
		-- closing windows
		['< c,q >'] = 'Close/Quit',
		o = 'Close all, except current',
		-- Moving windows around
		['< r,R >'] = 'Rotate down/right',
		x = 'Swap with next',
		-- Change / move window layout
		['< H,J,K,L >'] = 'move window to the far sides',
		['< h,j,k,l >'] = 'move cursor to window',
		-- resizing
		['='] = 'make windows equal size',
		['< |,_ >'] = 'set width,height to N (full)',
		['<,>'] = 'de-/increase width',
		['< -,+ >'] = 'de-/increase height',
	},
}

local function example()
	-- As an example, we will create the following mappings:
	--  * <leader>ff find files
	--  * <leader>fr show recent files
	--  * <leader>fb Foobar
	-- we'll document:
	--  * <leader>fn new file
	--  * <leader>fe edit file
	-- and hide <leader>1

	wk.register({
		f = {
			name = 'file', -- optional group name
			f = { '<cmd>Telescope find_files<cr>', 'Find File' }, -- create a binding with label
			r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File', noremap = false, buffer = 122 }, -- additional options for creating the keymap
			n = { 'New File' }, -- just a label. don't create any mapping
			e = 'Edit File', -- same as above
			['1'] = 'which_key_ignore', -- special label to hide it in the popup
			b = {
				function() print('bar') end,
				'Foobar',
			}, -- you can also pass functions!
		},
	}, { prefix = '<leader>' })

	-- all of the mappings below are equivalent

	-- method 2
	wk.register {
		['<leader>'] = {
			f = {
				name = '+file',
				f = { '<cmd>Telescope find_files<cr>', 'Find File' },
				r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
				n = { '<cmd>enew<cr>', 'New File' },
			},
		},
	}

	-- method 3
	wk.register {
		['<leader>f'] = {
			name = '+file',
			f = { '<cmd>Telescope find_files<cr>', 'Find File' },
			r = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
			n = { '<cmd>enew<cr>', 'New File' },
		},
	}

	-- method 4
	wk.register {
		['<leader>f'] = { name = '+file' },
		['<leader>ff'] = { '<cmd>Telescope find_files<cr>', 'Find File' },
		['<leader>fr'] = { '<cmd>Telescope oldfiles<cr>', 'Open Recent File' },
		['<leader>fn'] = { '<cmd>enew<cr>', 'New File' },
	}
end
