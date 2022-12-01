local has_neotest, neotest = pcall(require, 'neotest')
if not has_neotest then return end

-- local config = require('neotest.config')

local python_adapter = require('neotest-python') {
	-- Extra arguments for nvim-dap configuration
	-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
	dap = { justMyCode = false },
	-- Command line arguments for runner
	-- Can also be a function to return dynamic values
	args = { '--log-level', 'DEBUG' },
	-- Runner to use. Will use pytest if available by default.
	-- Can be a function to return dynamic value.
	-- runner = "pytest",

	-- Custom python path for the runner.
	-- Can be a string or a list of strings.
	-- Can also be a function to return dynamic value.
	-- If not provided, the path will be inferred by checking for
	-- virtual envs in the local directory and for Pipenev/Poetry configs
	-- python = ".venv/bin/python",
	-- Returns if a given file path is a test file.
	-- NB: This function is called a lot so don't perform any heavy tasks within it.
	-- is_test_file = function(file_path)
	-- ...
	-- end,
}

neotest.setup {
	adapters = {
		python_adapter,
		-- require('neotest-plenary'),
		-- require('neotest-vim-test')({
		--   ignore_file_types = { 'python', 'vim', 'lua' },
		-- }),
	},
	benchmark = {
		enabled = true,
	},
	consumers = {},
	default_strategy = 'integrated',
	diagnostic = {
		enabled = true,
	},
	discovery = {
		concurrent = 0,
		enabled = true,
	},
	floating = {
		border = 'rounded',
		max_height = 0.6,
		max_width = 0.6,
		options = {},
		-- relative = 'editor', -- editor | win | cursor
		-- row = 0,
		-- col = 0,
	},
	highlights = {
		adapter_name = 'NeotestAdapterName',
		border = 'NeotestBorder',
		dir = 'NeotestDir',
		expand_marker = 'NeotestExpandMarker',
		failed = 'NeotestFailed',
		file = 'NeotestFile',
		focused = 'NeotestFocused',
		indent = 'NeotestIndent',
		marked = 'NeotestMarked',
		namespace = 'NeotestNamespace',
		passed = 'NeotestPassed',
		running = 'NeotestRunning',
		select_win = 'NeotestWinSelect',
		skipped = 'NeotestSkipped',
		target = 'NeotestTarget',
		test = 'NeotestTest',
		unknown = 'NeotestUnknown',
	},
	icons = {
		running_animated = { '', '🞅', '🞈', '🞉', '', '', '🞉', '🞈', '🞅', '', },
		child_indent = '│',
		child_prefix = '├',
		collapsed = '─',
		expanded = '╮',
		failed = '',
		final_child_indent = ' ',
		final_child_prefix = '╰',
		non_collapsible = '─',
		passed = '',
		running = '',
		skipped = '',
		unknown = '',
	},
	jump = {
		enabled = true,
	},
	log_level = 3,
	output = {
		enabled = true,
		-- open_on_run = 'short', -- (string|boolean) Open nearest test result after running
		open_on_run = true, -- (string|boolean) Open nearest test result after running
	},
	output_panel = {
		enabled = true,
		open = 'botright split | resize 15', -- (string) | fun(): integer A command or function to open a window for the output panel
	},
	projects = {},
	run = {
		enabled = true,
	},
	running = {
		concurrent = true,
	},
	status = {
		enabled = true,
		signs = true, -- Display status using signs
		virtual_text = false, -- Display status using virtual text
	},
	strategies = {
		integrated = {
			height = 40,
			width = 120,
		},
	},
	summary = {
		animated = true,
		enabled = true,
		expand_errors = true, -- Expand all failed positions
		follow = true, -- Expand user's current file
		mappings = {
			attach = 'a',
			stop = 'u',

			jumpto = 'i',

			target = 't',
			clear_target = 'T',

			mark = 'm',
			clear_marked = 'M',

			expand_all = 'e',
			expand = { '<CR>', '<2-LeftMouse>' },

			output = 'o',
			short = 'O',

			next_failed = 'J',
			prev_failed = 'K',

			run = 'r',
			run_marked = 'R',
			debug = 'd',
			debug_marked = 'D',
		},
	},
}
