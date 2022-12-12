P = function(...)
	vim.pretty_print(...)
	-- print(vim.inspect(v))
	return ...
end

RELOAD = function(...) require('plenary.reload').reload_module(...) end

-- pcall(require, package)
function Prequire(package) return pcall(require, package) end

R = function(name)
	RELOAD(name)
	return require(name)
end

LOADED = function(name) vim.pretty_print(package.loaded[name]) end

RESET = function(name) package.loaded[name] = nil end

WriteFile = function(path, text, append)
	local mode = 'a' and append or 'w'
	local file = io.open(path, mode)
	io.output(file)
	io.write(text)
	io.close(file)
end

local reload_module = function(module_name, starts_with_only)
	-- Default to starts with only
	if starts_with_only == nil then starts_with_only = true end

	-- TODO: Might need to handle cpath / compiled lua packages? Not sure.
	local matcher
	if not starts_with_only then
		matcher = function(pack)
			local match = string.find(pack, module_name, 1, true)
			print(match)
			return match
		end
	else
		local module_name_pattern = vim.pesc(module_name)
		matcher = function(pack)
			local match = string.find(pack, '^' .. module_name_pattern)
			if match then print(match) end
			return match
		end
	end

	-- Handle impatient.nvim automatically.
	local luacache = (_G.__luacache or {}).cache

	for pack, _ in pairs(package.loaded) do
		if matcher(pack) then
			package.loaded[pack] = nil

			if luacache then luacache[pack] = nil end
		end
	end
end

function BO(bufnr, name, value)
	bufnr = bufnr or 0
	if value == nil then --
		return vim.api.nvim_buf_get_option(bufnr, name)
	end
	vim.api.nvim_buf_set_option(bufnr, name, value)
end

function ReloadAll()
	local path = './lua/plugins/'
	local lua_dirs = vim.fn.glob(path .. '**', 0, 1)
	-- P(lua_dirs)
	for _, dir in ipairs(lua_dirs) do
		dir = string.gsub(dir, path, '')
		-- print('reloading ' .. dir)
		reload_module(dir)
		return
		-- require('plenary.reload').reload_module(dir)

		-- require(dir)
	end
	-- require('init')
end

function GetCommandCompletion()
	vim.cmd([[
		function! GetCommandCompletion( base )
			silent execute "normal! :" a:base . "\<c-a>'\<c-b>return '\<cr>"
		endfunction
		" let cmds = GetCommandCompletion('setfiletype ')
		" echo cmds
	]])
	local res = Exec('echo GetCommandCompletion("setfiletype ")')
	local filetypes = vim.fn.split(res, ' ')

	-- far easier solution
	local filetypes = vim.fn.getcompletion('', 'filetype')
end
