local has_dapui, dapui = pcall(require, 'dapui')
if not has_dapui then return end

dapui.setup {
	icons = { expanded = '', collapsed = '', current_frame = '' },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { '<CR>', '<2-LeftMouse>' },
		open = 'o',
		remove = 'd',
		edit = 'e',
		repl = 'r',
		toggle = 't',
	},
	-- Use this to override mappings for specific elements
	element_mappings = {
		-- Example:
		-- stacks = {
		--   open = "<CR>",
		--   expand = "o",
		-- }
	},
	-- Expand lines larger than the window
	-- Requires >= 0.7
	expand_lines = vim.fn.has('nvim-0.7') == 1,
	-- Layouts define sections of the screen to place windows.
	-- The position can be "left", "right", "top" or "bottom".
	-- The size specifies the height/width depending on position. It can be an Int
	-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
	-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
	-- Elements are the elements shown in the layout (in order).
	-- Layouts are opened in order so that earlier layouts take priority in window sizing.
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = 'scopes', size = 0.25 },
				'breakpoints',
				'stacks',
				'watches',
			},
			size = 40, -- 40 columns
			position = 'left',
		},
		{
			elements = {
				'repl',
				'console',
			},
			size = 0.25, -- 25% of total lines
			position = 'bottom',
		},
	},
	controls = {
		enabled = true,
		-- Display controls in this element
		element = 'repl',
		icons = {
			pause = '',
			play = '',
			step_into = '',
			step_over = '',
			step_out = '',
			step_back = '',
			run_last = '',
			terminate = '',
		},
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = 'rounded', -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { 'q', '<Esc>' },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil, -- Can be integer or nil.
		max_value_lines = 100, -- Can be integer or nil.
	},
	-- -- You can change the order of elements in the sidebar
	-- sidebar = {
	--   elements = {
	--     -- Provide as ID strings or tables with "id" and "size" keys
	--     {
	--       id = "scopes",
	--       size = 0.75, -- Can be float or integer > 1
	--     },
	--     { id = "watches", size = 00.25 },
	--   },
	--   size = 50,
	--   position = "left", -- Can be "left" or "right"
	-- },
	--
	-- tray = {
	--   elements = {},
	--   size = 15,
	--   position = "bottom", -- Can be "bottom" or "top"
	-- },
}
