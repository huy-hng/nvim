vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
-- vim.fn.sign_define('DapBreakpointCondition', { text = 'ü', texthl = '', linehl = '', numhl = '' })
-- Setup cool Among Us as avatar
vim.fn.sign_define('DapStopped', { text = 'ඞ', texthl = 'Error' })

local has_dap, dap = pcall(require, 'dap')
if not has_dap then return end

dap.set_log_level('DEBUG')



-- -- View the current scopes in a sidebar:
-- local widgets = require('dap.ui.widgets')
-- local my_sidebar = widgets.sidebar(widgets.scopes)
-- my_sidebar.open()

-- -- View the current frames in a sidebar:
-- local my_sidebar = widgets.sidebar(widgets.frames)
-- my_sidebar.open()

-- -- View the current scopes in a centered floating window:
-- widgets.centered_float(widgets.scopes)

-- -- View the value for the expression under the cursor in a floating window:
-- widgets.hover()

-- -- The widgets may have the following custom mappings enabled:

-- -- <CR> to expand or collapse an entry
-- -- a to show a menu with available actions

require('nvim-dap-virtual-text').setup {
	enabled = true,

	-- DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, DapVirtualTextForceRefresh
	enabled_commands = false,

	-- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_changed_variables = true,
	highlight_new_as_changed = true,

	-- prefix virtual text with comment string
	commented = false,

	show_stop_reason = true,

	-- experimental features:
	virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
}

-- TODO: How does terminal work?
dap.defaults.fallback.external_terminal = {
	command = '/home/tjdevries/.local/bin/kitty',
	args = { '-e' },
}

dap.adapters.nlua = function(callback, config)
	callback { type = 'server', host = config.host, port = config.port }
end

dap.configurations.lua = {
	{
		type = 'nlua',
		request = 'attach',
		name = 'Attach to running Neovim instance',
		host = function()
			return '127.0.0.1'
		end,
		port = function()
			-- local val = tonumber(vim.fn.input('Port: '))
			-- assert(val, "Please provide a port number")
			local val = 54231
			return val
		end,
	},
}


local dap_python = require('dap-python')
dap_python.setup('python', {
	-- So if configured correctly, this will open up new terminal.
	--    Could probably get this to target a particular terminal
	--    and/or add a tab to kitty or something like that as well.
	-- console = 'externalTerminal',

	-- include_configs = true,
})

dap_python.test_runner = 'pytest'

dap.adapters.python = {
	type = 'executable',
	command = 'debugpy-adapter',
}

dap.configurations.python = {
	{
		type = 'python',
		request = 'launch',
		name = 'Launch file',
		program = '${file}',
		pythonPath = function()
			return vim.env.PYTHONPATH
		end,
	},
	-- {
	-- 	type = 'python',
	-- 	request = 'launch',
	-- 	name = 'Build api',
	-- 	program = '${file}',
	-- 	args = { '--target', 'api' },
	-- 	console = 'integratedTerminal',
	-- },
	-- {
	-- 	type = 'python',
	-- 	request = 'launch',
	-- 	name = 'lsif',
	-- 	program = 'src/lsif/__main__.py',
	-- 	args = {},
	-- 	console = 'integratedTerminal',
	-- },
}

-- You can set trigger characters OR it will default to '.'
-- You can also trigger with the omnifunc, <c-x><c-o>
vim.cmd([[
augroup DapRepl
	au!
	au FileType dap-repl lua require('dap.ext.autocompl').attach()
augroup END
]])


local original = {}
local debug_map = function(lhs, rhs, desc)
	local keymaps = vim.api.nvim_get_keymap('n')
	original[lhs] = vim.tbl_filter(function(v)
		return v.lhs == lhs
	end, keymaps)[1] or true

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

dap.listeners.after.event_initialized['dapui_config'] = function()
	debug_map('asdf', ":echo 'hello world<CR>", 'showing things')

	dap_ui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
	debug_unmap()

	dap_ui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
	dap_ui.close()
end


-- vim.cmd [[nmap <silent> <space>db <Plug>VimspectorToggleBreakpoint]]
-- vim.cmd [[nmap <space>ds <Plug>VimscectorContinue]]

-- dap.adapters.lldb = {
--   type = "executable",
--   command = "/usr/bin/lldb-vscode-11",
--   name = "lldb",
-- }

-- local extension_path = vim.fn.expand "~/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/"
-- local codelldb_path = extension_path .. "adapter/codelldb"
-- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
--
-- dap.adapters.rt_lldb = {
--   type = "executable",
--   command = codelldb_path,
--   name = "rt_lldb",
-- }

-- dap.adapters.rt_lldb = function(callback, _)
--   local stdout = vim.loop.new_pipe(false)
--   local stderr = vim.loop.new_pipe(false)
--   local handle
--   local pid_or_err
--   local port
--   local error_message = ""
--
--   local opts = {
--     stdio = { nil, stdout, stderr },
--     args = { "--liblldb", liblldb_path },
--     detached = true,
--   }
--
--   handle, pid_or_err = vim.loop.spawn(codelldb_path, opts, function(code)
--     stdout:close()
--     stderr:close()
--     handle:close()
--     if code ~= 0 then
--       print("codelldb exited with code", code)
--       print("error message", error_message)
--     end
--   end)
--
--   assert(handle, "Error running codelldb: " .. tostring(pid_or_err))
--
--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       if not port then
--         local chunks = {}
--         for substring in chunk:gmatch "%S+" do
--           table.insert(chunks, substring)
--         end
--         port = tonumber(chunks[#chunks])
--         vim.schedule(function()
--           callback {
--             type = "server",
--             host = "127.0.0.1",
--             port = port,
--           }
--         end)
--       else
--         vim.schedule(function()
--           require("dap.repl").append(chunk)
--         end)
--       end
--     end
--   end)
--   stderr:read_start(function(_, chunk)
--     if chunk then
--       error_message = error_message .. chunk
--
--       vim.schedule(function()
--         require("dap.repl").append(chunk)
--       end)
--     end
--   end)
-- end
