local M = {}

local path = require('lspconfig.util').path
local job = require('plenary.job')

-- TODO:

-- https://github.com/neovim/nvim-lspconfig/wiki/Project-local-settings
-- nvim_lsp.rust_analyzer.setup {
--   on_init = function(client)
--     client.config.settings.xxx = "yyyy"
--     client.notify("workspace/didChangeConfiguration")
--     return true
--   end
-- }

local pipenv_venv_cmd = { 'pipenv', '--venv', '--quiet' }
local poetry_venv_cmd = { 'poetry', 'env', 'info', '-p' }
local pdm_venv_cmd = { 'pdm', 'info', '--packages' }

local function set_env_vars(venv)
	vim.env.VIRTUAL_ENV = venv
	vim.env.PATH = path.join(venv, 'bin:') .. vim.env.PATH
	vim.env.PYTHONPATH = venv .. '/bin/python'

	if vim.env.PYTHONHOME then
		vim.env.old_PYTHONHOME = vim.env.PYTHONHOME
		vim.env.PYTHONHOME = ''
	end

	M.set_python_path(vim.env.PYTHONPATH)
end

M.init = function(config, root_dir)
	vim.env.PYTHONPATH = 'python'

	if vim.env.VIRTUAL_ENV and vim.env.VIRTUAL_ENV == '' then return end

	local match = function(...) return vim.fn.glob(path.join(root_dir, ...)) end

	local cmd
	if match('Pipfile.lock') ~= '' then cmd = pipenv_venv_cmd end
	if match('poetry.lock') ~= '' then cmd = poetry_venv_cmd end

	if cmd then
		job:new({
			command = cmd[1],
			args = table.slice(cmd, 2),
			on_exit = function(j, exit_code)
				if exit_code ~= 0 then return end

				-- local res = table.concat(j:result(), '\n')
				local venv = j:result()[1]
				nvim.schedule(set_env_vars, venv)
			end,
		}):start()
		return
	end

	-- Find and use virtualenv in root_dir directory.
	for _, pattern in ipairs { '*', '.*' } do
		local matched = match(root_dir, pattern, 'pyvenv.cfg')
		if matched ~= '' then return path.dirname(matched) end
	end

	-- return vim.fn.trim(vim.fn.system(cmd))
end

-- PEP 582 support
M.pep582 = function(root_dir)
	local package_ = ''
	local pdm_match = vim.fn.glob(path.join(root_dir, 'pdm.lock'))
	if pdm_match ~= '' then package_ = set_venv_dir(pdm_venv_cmd) end

	if package_ ~= '' then return path.join(package_, 'lib') end
end

function M.organize_imports()
	local params = {
		command = 'pyright.organizeimports',
		arguments = { vim.uri_from_bufnr(0) },
	}
	vim.lsp.buf.execute_command(params)
end

function M.set_python_path(py_path)
	py_path = py_path or '.'
	local clients = vim.lsp.get_active_clients {
		bufnr = vim.api.nvim_get_current_buf(),
		name = 'pyright',
	}
	for _, client in ipairs(clients) do
		client.config.settings.python.pythonPath = py_path
		-- client.config.settings = vim.tbl_deep_extend(
		-- 	'force',
		-- 	client.config.settings,
		-- 	{ python = { pythonPath = py_path } }
		-- )
		client.notify('workspace/didChangeConfiguration', { settings = nil })
	end
end

return M
