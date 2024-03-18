local dap = require('dap')
local dapui = require('dapui')

local dap_map = Map.new('<leader>d', '', '[DAP] ')

local function get_input(msg)
	return function() vim.fn.input { msg } end
end

dap_map.n('b', dap.toggle_breakpoint, 'toggle breakpoint')
dap_map.n('c', dap.continue, 'Continue / Start')
-- dap_map.n(
-- 	'B',
-- 	{ dap.toggle_breakpoint, get_input('[DAP] Breakpoint Condition: ') },
-- 	'breakpoint condition'
-- )
-- -- dap_map.n('p', { dap.set_breakpoint, nil, nil, get_input('Log point message: ') }, 'set log point')
-- dap_map.n('r', dap.repl.open, 'repl open')
dap_map.n('l', dap.run_last, 'Run Last')

-- dap_map.n('E', { dapui.eval, get_input('[DAP] Expression > ') }, 'evaluate expression')
-- dap_map.nv('e', dapui.eval, 'evaluate expression under cursor')

local map = Map.meta('Debugging')

-- map:n('<F5>', dap.continue, '[DAP]  Continue')
-- map:n('<F9>', dap.step_back, '[DAP]  Step Back')
-- map:n('<F10>', dap.step_into, '[DAP]  Step Into')
-- map:n('<F11>', dap.step_over, '[DAP]  Step Over')
-- map:n('<F12>', dap.step_out, '[DAP]  Step Out')
-- map:n('<leader>dD', dap.terminate, '[DAP]  Terminate')

map:n('r', dap.step_back, '[DAP]  Step Back')
map:n('s', dap.step_into, '[DAP]  Step Into')
map:n('t', dap.step_over, '[DAP]  Step Over')
map:n('f', dap.step_out, '[DAP]  Step Out')
-- map:n('g', dap.continue, '[DAP]  Continue')
map:n('c', dap.continue, '[DAP]  Continue')
map:n('q', dap.terminate, '[DAP]  Terminate')

dap_map.n('m', function() map:create_maps() end, 'map dap keymaps')

-- You can use nvim-dap events to open and close the windows automatically (:help dap-extensions)
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
	map:create_maps()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
	map:restore_maps()
end

dap.listeners.before.event_exited['dapui_config'] = function()
	map:restore_maps()
	dapui.close()
end
