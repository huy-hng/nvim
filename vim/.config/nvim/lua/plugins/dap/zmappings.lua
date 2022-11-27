--==============================================================================
--                                |=> DAP <=|
--==============================================================================

local has_dap, dap = pcall(require, 'dap')
if not has_dap then return end

local dap_prefix = '<leader>d'

nmap('<F5>', dap.continue, '[DAP] continue')
nmap('<F9>', dap.step_back, '[DAP] step back')
nmap('<F10>', dap.step_into, '[DAP] step into')
nmap('<F11>', dap.step_over, '[DAP] step over')
nmap('<F12>', dap.step_out, '[DAP] step out')
nmap(dap_prefix .. 'D', dap.terminate, '[DAP] terminate')

nmap(dap_prefix .. 'b', dap.toggle_breakpoint, '[DAP] toggle breakpoint')
nmap(dap_prefix .. 'B', function()
	dap.set_breakpoint(vim.fn.input { '[DAP] Breakpoint Condition: ' })
end, '[DAP] set breakpoint condition')

nmap(dap_prefix .. 'lp', function()
	dap.set_breakpoint(nil, nil, vim.fn.input { 'Log point message: ' })
end, '[DAP] set log point message')

nmap(dap_prefix .. 'r', dap.repl.open, '[DAP] repl open')
nmap(dap_prefix .. 'l', dap.run_last, '[DAP] run last')

--==============================================================================
--                               |=> DAP UI <=|
--==============================================================================

local has_dapui, dapui = pcall(require, 'dapui')
if not has_dapui then return end

nvmap(dap_prefix .. 'e', dapui.eval, '[DAP] evaluate expression under cursor')
nmap(dap_prefix .. 'E', function()
	dapui.eval(vim.fn.input { '[DAP] Expression > ' })
end, '[DAP] evaluate expression')

-- You can use nvim-dap events to open and close the windows automatically (:help dap-extensions)
dap.listeners.after.event_initialized['dapui_config'] = FN(dapui.open)
dap.listeners.before.event_terminated['dapui_config'] = FN(dapui.close)
dap.listeners.before.event_exited['dapui_config'] = FN(dapui.close)

--==============================================================================
--                              |=> Neotest <=|
--==============================================================================

local has_neotest, neotest = pcall(require, 'neotest')
if not has_neotest then return end

local neotest_prefix = '<leader>n'
----------------------------------------
--             -> Run <-
----------------------------------------
-- global test commands
nmap(neotest_prefix .. 's', neotest.run.stop, 'Stop test')
nmap(neotest_prefix .. 'a', neotest.run.attach, 'Attach to nearest test')

-- last test
nmap(neotest_prefix .. 'd', neotest.run.run_last, 'Run last test')
nmap(neotest_prefix .. 'D', FN(neotest.run.run_last, { strategy = 'dap' }), 'Debug last test')

-- nearest test
nmap(neotest_prefix .. 'n', neotest.run.run, 'Run nearest test')
nmap(neotest_prefix .. 'N', FN(neotest.run.run, { strategy = 'dap' }), 'Debug nearest test')

-- test entire file
nmap(neotest_prefix .. 'f', function()
	neotest.run.run(vim.fn.expand('%'))
end, 'Run current file')

nmap(neotest_prefix .. 'fd', function()
	neotest.run.run { vim.fn.expand('%'), strategy = 'dap' }
end, 'Debug the current file')

-- nmap(neotest_prefix .. 'ga', neotest.run.adapters, 'Get the list of all known adapter IDs')
-- nmap(neotest_prefix .. 'gl', neotest.run.get_last_run, 'Get last test run tree and adapter id')

----------------------------------------
--         -> Get Details <-
----------------------------------------

local function open_win_fn()
	local popup_config = {
		row = 0,
		col = 0,

		width = 120,
		height = vim.api.nvim_win_get_height(0) - 5,

		relative = 'editor', -- editor | win | cursor
		border = 'rounded', -- none | single | double | rounded | solid | shadow
		style = 'minimal',
	}
	local winid = vim.api.nvim_open_win(0, true, popup_config)
	return winid
end

local output_opts = {
	-- open_win = open_win_fn,
	-- short = false, -- Show shortened output
	-- enter = false,
	-- quiet = true, -- Suppress warnings of no output
	-- last_run = true, -- Open output for last test run
	position_id = nil,-- Open output for position with this ID, opens nearest position if not given
	adapter = nil, -- Adapter ID, defaults to first found with matching position
	-- auto_close = false, -- Close output window when leaving it, or when cursor moves outside of window
}
-- nmap(neotest_prefix .. 'o', function()
-- 	neotest.output.open(output_opts)
-- end, 'Show test output')
nmap(neotest_prefix .. 'o', neotest.output.open, 'Show test output')
nmap(neotest_prefix .. 'op', neotest.output_panel.toggle, 'Toggle test output panel')
nmap(neotest_prefix .. 'u', neotest.summary.toggle, 'Show summary')
-- nmap(neotest_prefix .. 'd', neotest.diagnostic, 'Show diagnostics')
-- nmap(neotest_prefix .. 't', neotest.status, 'Show status')

----------------------------------------
--             -> Jump <-
----------------------------------------
-- nmap('[n', FN(neotest.jump.prev, { status = 'failed' }))
-- nmap(']n', FN(neotest.jump.next, { status = 'failed' }))
