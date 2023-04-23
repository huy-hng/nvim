--==============================================================================
--                                |=> DAP <=|
--==============================================================================

local has_dap, dap = pcall(require, 'dap')
if not has_dap then return end

local has_dapui, dapui = pcall(require, 'dapui')
if not has_dapui then return end

local dap_prefix = '<leader>d'

local dap_map = Map.create('n', dap_prefix, '[DAP]')

local function get_input(msg)
	return function() vim.fn.input { msg } end
end

dap_map('b', dap.toggle_breakpoint, 'toggle breakpoint')
dap_map(
	'B',
	{ dap.toggle_breakpoint, get_input('[DAP] Breakpoint Condition: ') },
	'breakpoint condition'
)
-- dap_map('p', { dap.set_breakpoint, nil, nil, get_input('Log point message: ') }, 'set log point')
dap_map('r', dap.repl.open, 'repl open')
dap_map('l', dap.run_last, 'Run Last')

dap_map('E', { dapui.eval, get_input('[DAP] Expression > ') }, 'evaluate expression')
dap_map('e', dapui.eval, 'evaluate expression under cursor')
Map.v(dap_prefix .. 'e', dapui.eval, 'evaluate expression under cursor')

local original = {}
local debug_map = function(lhs, rhs, desc)
	local keymaps = vim.api.nvim_get_keymap('n')
	original[lhs] = vim.tbl_filter(function(v) return v.lhs == lhs end, keymaps)[1] or true

	vim.keymap.set('n', lhs, rhs, { desc = desc })
end

local debug_unmap = function()
	for lhs, v in pairs(original) do
		if v == true then
			vim.keymap.del('n', lhs)
		else
			local rhs = v.rhs

			v.lhs = nil
			v.rhs = nil
			v.buffer = nil
			v.mode = nil
			v.sid = nil
			v.lnum = nil

			vim.keymap.set('n', lhs, rhs, v)
		end
	end

	original = {}
end

-- You can use nvim-dap events to open and close the windows automatically (:help dap-extensions)
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
	debug_map('<F5>', dap.continue, '[DAP]  Continue')
	debug_map('<F9>', dap.step_back, '[DAP]  Step Back')
	debug_map('<F10>', dap.step_into, '[DAP]  Step Into')
	debug_map('<F11>', dap.step_over, '[DAP]  Step Over')
	debug_map('<F12>', dap.step_out, '[DAP]  Step Out')
	debug_map(dap_prefix .. 'D', dap.terminate, '[DAP]  Terminate')
end

dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
	debug_unmap()
end

dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

--==============================================================================
--                              |=> Neotest <=|
--==============================================================================

local has_neotest, neotest = pcall(require, 'neotest')
if not has_neotest then return end
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

	vim.schedule(function() end)

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

----------------------------------------
--             -> Run <-
----------------------------------------
-- local neomap = PrefixMap('n', dap_prefix, '[Neotest]')
local neomap = Map.create('n', '<localleader>', '[Neotest]')
-- global test commands
-- Map({ key_prefix = '<leader>d', desc_prefix = '[Neotest]' }, {
neomap('s', neotest.run.stop, 'Stop test')
neomap('a', neotest.run.attach, 'Attach to nearest test')

-- last test
neomap('d', neotest.run.run_last, 'Run last test')
neomap('D', { neotest.run.run_last, { strategy = 'dap' } }, 'Debug last test')

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
