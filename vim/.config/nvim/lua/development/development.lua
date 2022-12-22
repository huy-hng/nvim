function Prequire(package)
	return Try(1, require, package)
	-- return require(package)
end

I = vim.inspect

P = function(...)
	vim.pretty_print(...) -- print(vim.inspect(v))
	return ...
end

RELOAD = function(...) require('plenary.reload').reload_module(...) end


---@param name string
R = function(name)
	RELOAD(name)
	return require(name)
end



LOADED = function(name) vim.pretty_print(package.loaded[name]) end

RESET = function(name) package.loaded[name] = nil end

WriteFile = function(path, text, append)
	local mode = 'a' and append or 'w'
	local file = io.open(path, mode)
	---@diagnostic disable-next-line: param-type-mismatch
	io.output(file)
	io.write(text)
	io.close(file)
end

function RemoveAllAutoReloaders()
	local cmds = vim.api.nvim_get_autocmds { event = 'BufWritePost' }
	for _, cmd in ipairs(cmds) do
		if cmd.group_name:match('Autosave') then --
			vim.api.nvim_del_augroup_by_id(cmd.group)
		end
	end
end
-- RemoveAllAutoReloaders()

function AutoReloadFolder(load)
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

function RequireWrapper()
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
