local M = {}

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

M.loaded = function(name) vim.pretty_print(package.loaded[name]) end

---@module 'plenary.reload'
local reload = M.nrequire('plenary.reload')

if reload then
	M.reload = reload.reload_module
else
	M.reload = function(name, ...) package.loaded[name] = nil end
end

M.print_keys = function(tbl)
	for key, val in pairs(tbl) do
		print(key)
	end
	print(' ')
end

M.reload_require = function(name, starts_with_only)
	M.reload(name, starts_with_only)
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

function M.auto_reload_file(init_file, load)
	if not init_file then return end

	local current_file = vim.fn.expand('%')
	if current_file == '' then return end

	P(init_file, load, current_file)
	local group_name = 'Autoreload_' .. current_file

	local saved_group = F.npcall(vim.api.nvim_get_autocmds, { group = group_name })
	if saved_group and load then return end

	vim.notify('Auto Reloading ' .. init_file)
	Augroup(group_name, {
		Autocmd('BufWritePost', current_file, function() --
			-- vim.cmd.luafile(init_file)
			vim.notify('autoreload ' ..  init_file)
			-- R(init_file).config()
			R(init_file)
		end),
	}, true, load)
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

return M
