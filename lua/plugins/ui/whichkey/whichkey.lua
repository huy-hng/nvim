local wk = require('which-key')

----------------------------------------------Labels------------------------------------------------

wk.register { ['<leader>w'] = { name = '[Vimwiki]' } }
wk.register { ['<leader>b'] = { name = '[Buffers]' } }
wk.register { [Keys.leader.telescope] = { name = 'Telescope]' } }
wk.register { ['<leader>D'] = { name = '[Database]' } }
wk.register { ['<leader>d'] = { name = '[DAP]' } }
wk.register { ['<leader>h'] = { name = '[Harpon]' } }
wk.register { ['<leader>w'] = { name = '[Tabs]' } }
wk.register { ['<leader>n'] = { name = '[Neorg]' } }

------------------------------------------Window Commands-------------------------------------------

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
