local neotest = require 'neotest'
local config = require 'neotest.config'

local python_adapter = require 'neotest-python' {
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
		relative = 'editor', -- editor | win | cursor
		row = 0,
		col = 0,

		max_height = 0.9,
		max_width = 0.9,
		border = 'rounded',
		options = {},
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
		-- running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
		running_animated = {
			'',
			'🞅',
			'🞈',
			'🞉',
			'',
			'',
			'🞉',
			'🞈',
			'🞅',
			'',
		},
		-- running_animated = { '◴' ,'◷' ,'◶', '◵'},
		-- running_animated = { '◢', '◣', '◤', '◥'},
		-- running_animated = { '◐', '◓', '◑', '◒'},
		-- running_animated = { '◰', '◳', '◲', '◱'},
		-- running_animated = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
		-- running_animated = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'},
		-- running_animated = { '⠋', '⠙', '⠚', '⠞', '⠖', '⠦', '⠴', '⠲', '⠳', '⠓'},
		-- running_animated = { '⠄', '⠆', '⠇', '⠋', '⠙', '⠸', '⠰', '⠠', '⠰', '⠸', '⠙', '⠋', '⠇', '⠆'},
		-- running_animated = { '⠋', '⠙', '⠚', '⠒', '⠂', '⠂', '⠒', '⠲', '⠴', '⠦', '⠖', '⠒', '⠐', '⠐', '⠒', '⠓', '⠋' },
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
		open_on_run = 'short',
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
		signs = true,
		virtual_text = false,
	},
	strategies = {
		integrated = {
			height = 40,
			width = 120,
		},
	},
	summary = {
		enabled = true,
		animated = true,
		expand_errors = true,
		follow = true,
		mappings = {
			attach = 'a',
			clear_marked = 'M',
			clear_target = 'T',
			expand = { '<CR>', '<2-LeftMouse>' },
			expand_all = 'e',
			jumpto = 'i',
			mark = 'm',
			next_failed = 'J',
			output = 'o',
			prev_failed = 'K',
			run = 'r',
			debug = 'd',
			run_marked = 'R',
			debug_marked = 'D',
			short = 'O',
			stop = 'u',
			target = 't',
		},
	},
}

local neotest_prefix = '<leader>d'
nmap(neotest_prefix .. 'd', neotest.run.run_last, 'Run last test')
nmap(neotest_prefix .. 'n', neotest.run.run, 'Run nearest test')
nmap(neotest_prefix .. 's', neotest.run.stop, 'Stop nearest test')
nmap(neotest_prefix .. 'a', neotest.run.attach, 'Attach to nearest test')

local popup_config = {
	row = 0,
	-- row = -1,
	col = 0,

	width = 120,
	height = vim.api.nvim_win_get_height(0) - 5,

	relative = 'editor', -- editor | win | cursor

	border = 'rounded', -- none | single | double | rounded | solid | shadow
	style = 'minimal',
}

local output_opts = {
	enter = true,
	auto_close = true,
	-- short = true,
	open_win = function()
		local winid = vim.api.nvim_open_win(0, true, popup_config)
		-- vim.api.nvim_create_autocmd()
	end
}
nmap(neotest_prefix .. 'o', function()
	neotest.output.open(output_opts)
	-- neotest.output.open()
end, 'Show test output')
nmap(neotest_prefix .. 'u', neotest.summary.toggle, 'Show summary')
-- nmap(neotest_prefix .. 'd', neotest.diagnostic, 'Show diagnostics')
-- nmap(neotest_prefix .. 't', neotest.status, 'Show status')

-- nearest test
-- neotest.run.run()

-- current file
-- neotest.run.run(vim.fn.expand("%"))

-- debug nearest test
-- neotest.run.run({strategy='dap'})

-- stop nearest test
-- neotest.run.stop()

-- attach to nearest test
-- neotest.run.attach()
