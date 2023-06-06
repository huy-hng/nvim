local function open_win_fn()
	local popup_config = {
		row = 0,
		col = 0,

		width = vim.api.nvim_win_get_width(0) - 2,
		height = vim.api.nvim_win_get_height(0) - 3,

		relative = 'win', -- editor | win | cursor
		border = 'rounded', -- none | single | double | rounded | solid | shadow
		-- style = 'minimal',
	}
	local winid = vim.api.nvim_open_win(0, true, popup_config)

	local output_map = Map.create('n', '', '[Neotest]', { buffer = true })
	local close_win = function()
		vim.api.nvim_del_augroup_by_name('NeotestOutputWin')
		vim.api.nvim_win_close(winid, false)
	end

	vim.schedule(function()
		local augroup = vim.api.nvim_create_augroup('NeotestOutputWin', {})
		vim.api.nvim_create_autocmd('WinLeave', {
			group = augroup,
			callback = close_win,
		})
		output_map('q', close_win, 'Close Output Window', { nowait = true })
		output_map('<esc>', close_win, 'Close Output Window')
		-- vim.api.nvim_create_autocmd('FileType', {
		-- 	pattern = 'neotest-output',
		-- 	group = augroup,
		-- 	callback = function()
		-- 		print('herre')
		-- 		output_map('q', close_win, 'Close Output Window')
		-- 		output_map('<esc>', close_win, 'Close Output Window')
		-- 	end,
		-- })
	end)

	return winid
end

local output_opts = {
	open_win = open_win_fn,
	short = true, -- Show shortened output
	enter = true,
	-- quiet = true, -- Suppress warnings of no output
	last_run = true, -- Open output for last test run
	-- position_id = nil, -- Open output for position with this ID, opens nearest position if not given
	-- adapter = nil, -- Adapter ID, defaults to first found with matching position
	auto_close = true, -- Close output window when leaving it, or when cursor moves outside of window
}


local neotest = require('neotest')

local neomap = Map.create('n', '<localleader>t', '[Neotest]')

neomap('s', neotest.run.stop, 'Stop test')
neomap('a', neotest.run.attach, 'Attach to nearest test')

-- last test
neomap('t', neotest.run.run_last, 'Run last test')
neomap('T', { neotest.run.run_last, { strategy = 'dap' } }, 'Debug last test')

-- nearest test
neomap('n', neotest.run.run, 'Run nearest test')
neomap('N', { neotest.run.run, { strategy = 'dap' } }, 'Debug nearest test')

-- test entire file
neomap('f', { neotest.run.run, TryWrap(vim.fn.expand, '%') }, 'Run current file')
neomap(
	'fd',
	{ neotest.run.run, { TryWrap(vim.fn.expand, '%'), strategy = 'dap' } },
	'Debug current file'
)

-- adapters
neomap('ga', neotest.run.adapters, 'Get the list of all known adapter IDs')
neomap('gl', neotest.run.get_last_run, 'Get last test run tree and adapter id')

-- details
neomap('o', { neotest.output.open, output_opts }, 'Show test output')
-- neomap('o', neotest.output.open, 'Show test output')
neomap('p', neotest.output_panel.toggle, 'Toggle test output panel')
neomap('u', neotest.summary.toggle, 'Show summary')

-- jump
neomap('[n', { { neotest.jump.prev, { status = 'failed' } }, 'Jump to prev failed test' })
neomap(']n', { { neotest.jump.next, { status = 'failed' } }, 'Jump to next failed test' })

-- neomap('di', neotest.diagnostic, 'Show diagnostics' )
-- neomap('st', neotest.status, 'Show Status' )
