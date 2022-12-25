local M = {}

M.loaded = function(name) vim.pretty_print(package.loaded[name]) end
M.reset = function(name) package.loaded[name] = nil end
local has_plenary, reload = pcall(require, 'plenary.reload')
if has_plenary then
	M.reload = reload.reload_module
else
	M.reload = M.reset
end

M.reload_require = function(name)
	RELOAD(name)
	return require(name)
end

M.write_file = function(path, text, append)
	local mode = 'a' and append or 'w'
	local file = io.open(path, mode)
	---@diagnostic disable-next-line: param-type-mismatch
	io.output(file)
	io.write(text)
	io.close(file)
end

function M.remove_all_auto_reloaders()
	local cmds = vim.api.nvim_get_autocmds { event = 'BufWritePost' }
	for _, cmd in ipairs(cmds) do
		if cmd.group_name:match('Autosave') then --
			vim.api.nvim_del_augroup_by_id(cmd.group)
		end
	end
end

function M.auto_reload_folder(load)
	local path = vim.fn.expand('%:h')
	local folder = vim.fn.expand('%:h:t')
	local init_file = vim.fn.expand('%')
	vim.notify('Autoreloading ' .. folder)
	print('Autoreloading ' .. folder)
	print(path, folder, init_file)
	Augroup('Autosave' .. init_file, {
		Autocmd('BufWritePost', path .. '*', function(data) --
			vim.cmd.luafile(init_file)
			vim.notify('Reloaded ' .. vim.fn.fnamemodify(init_file, 't'))
			print('Reloaded ' .. vim.fn.fnamemodify(init_file, 't'))
		end),
	}, true, load)

	-- if load then
	-- 	return R
	-- else
	-- 	return require
	-- end
end

function M.require_wrapper()
	local init_file = vim.fn.expand('%')

	---@param require_path string
	return function(require_path)
		local file_path = vim.fn.substitute(require_path, '\\.', '/', 'g')
		if string.match(require_path, '\\.') then print('aaaaaaaaaaaaaa') end
		local match = '*/' .. file_path .. '.lua'
		print(match)

		Augroup('Autosave' .. init_file, {
			Autocmd('BufWritePost', match, function(data) --
				vim.cmd.luafile(init_file)
			end),
		}, true, load)
		-- table.insert(require_table, req)
		return require(require_path)
	end
end

local function handle_pcall(status, ...) --
	return status and ... or nil
end

-- return result or nil
---@param fn function
---@param ... any
---@return unknown | nil
function M.npcall(fn, ...) --
	return handle_pcall(pcall(fn, ...))
end

-- return required package or nil
---@param name string
---@return unknown | nil
function M.nrequire(name) --
	return handle_pcall(pcall(require, name))
end
return M
