local M = {}

local path = require('lspconfig.util').path
local job = require('plenary.job')

-- FIX: if pipfile is found but the venv is not installed: silent bug

-- https://github.com/neovim/nvim-lspconfig/wiki/Project-local-settings
-- nvim_lsp.rust_analyzer.setup {
--   on_init = function(client)
--     client.config.settings.xxx = "yyyy"
--     client.notify("workspace/didChangeConfiguration")
--     return true
--   end
-- }

local util = require('lspconfig.util')

local root_files = {
	'pyproject.toml',
	'setup.py',
	'setup.cfg',
	'requirements.txt',
	'Pipfile',
	'Pipfile.lock',
	'poetry.lock',
	'pyrightconfig.json',
	'.git',
}

function M.get_root_dir(fname) --
	return util.root_pattern(unpack(root_files))(fname)
end

local pipenv_venv_cmd = { 'pipenv', '--venv', '--quiet' }
local poetry_venv_cmd = { 'poetry', 'env', 'info', '-p' }
local pdm_venv_cmd = { 'pdm', 'info', '--packages' }

local function match(root_dir, ...) return vim.fn.glob(path.join(root_dir, ...)) end

-- necessary for debian based distros because of 'python3'
local function get_system_python_path()
	local system_path = vim.fn.exepath('/bin/python')
	if system_path == '' then system_path = vim.fn.exepath('/bin/python3') end
	return system_path
end

local function get_package_manager_cmd(root_dir)
	local cmd
	if match(root_dir, 'Pipfile.lock') ~= '' then cmd = pipenv_venv_cmd end
	if match(root_dir, 'poetry.lock') ~= '' then cmd = poetry_venv_cmd end
	return cmd
end

local function set_env_vars(venv_path)
	local python_path = venv_path .. get_system_python_path()

	vim.env.PYTHONPATH = python_path

	vim.env.VIRTUAL_ENV = venv_path
	vim.env.PATH = path.join(venv_path, 'bin:') .. vim.env.PATH

	if vim.env.PYTHONHOME then
		vim.env.old_PYTHONHOME = vim.env.PYTHONHOME
		vim.env.PYTHONHOME = ''
	end
end

---@param root_dir string
---@param callback function takes pythonPath as param (usually sets python path)
function M.get_python_path(root_dir, callback)
	local cmd = get_package_manager_cmd(root_dir)
	if not cmd then
		print('Pyright: No Virtual Environment found.')
		callback(get_system_python_path())
		return
	end
	job:new({
		command = cmd[1],
		args = table.slice(cmd, 2),
		cwd = root_dir,
		on_exit = function(j, exit_code)
			if exit_code ~= 0 then return end

			-- local res = table.concat(j:result(), '\n')
			local venv_path = j:result()[1]
			local python_path = venv_path .. '/bin/python'
			nvim.schedule(callback, python_path)
		end,
	}):start()
end

-- Find and use virtualenv in root_dir directory.
local function use_virtualenv_in_root_dir(root_dir)
	for _, pattern in ipairs { '*', '.*' } do
		local matched = match(root_dir, pattern, 'pyvenv.cfg')
		if matched ~= '' then return path.dirname(matched) end
	end
end

function M.organize_imports()
	local params = {
		command = 'pyright.organizeimports',
		arguments = { vim.uri_from_bufnr(0) },
	}
	vim.lsp.buf.execute_command(params)
end

function M.set_python_path(python_path, bufnr)
	local system_path = get_system_python_path()

	-- appends /bin/python at the end, just in case
	if not string.match(python_path, system_path) then --
		python_path = python_path .. system_path
	end

	bufnr = bufnr or vim.api.nvim_get_current_buf()

	local clients = vim.lsp.get_active_clients {
		bufnr = bufnr,
		name = 'pyright',
	}
	for _, client in ipairs(clients) do
		if client.config.settings.python.pythonPath == python_path then return end

		client.config.settings.python.pythonPath = python_path
		-- client.config.settings = vim.tbl_deep_extend(
		-- 	'force',
		-- 	client.config.settings,
		-- 	{ python = { pythonPath = py_path } }
		-- )
		-- NOTE: below line is needed to update lsp
		client.notify('workspace/didChangeConfiguration', { settings = nil })
	end
end

Augroup('PythonVenv', {
	Autocmd('BufEnter', '*.py', function(data)
		---@cast data autocmd_data

		local bufnr = data.buf

		if vim.b[bufnr].pythonPath then
			M.set_python_path(vim.b[bufnr].pythonPath, bufnr)
			return
		end

		local root_dir = M.get_root_dir(data.file)
		M.get_python_path(root_dir, function(python_path) --
			vim.b[bufnr].pythonPath = python_path
			M.set_python_path(vim.b[bufnr].pythonPath, bufnr)
		end)
	end),
})

-- PEP 582 support
M.pep582 = function(root_dir)
	local package_ = ''
	local pdm_match = vim.fn.glob(path.join(root_dir, 'pdm.lock'))
	if pdm_match ~= '' then package_ = set_venv_dir(pdm_venv_cmd) end

	if package_ ~= '' then return path.join(package_, 'lib') end
end

return M
