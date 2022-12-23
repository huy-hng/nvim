-- vim.api.nvim_out_write('123\n')

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

function ReloadAll()
	-- local package = package.loaded['lua.core.development']
	ClearOutput()
	-- NewOutput()
	-- WriteToSplit(package)

	-- if true then return end
	local packages = package.loaded
	local keys = vim.tbl_keys(packages)

	-- print(' ')
	for _, package in ipairs(keys) do
		Try(R, package)
	end

	if true then return end

	local path = './lua/plugins/'
	local lua_dirs = vim.fn.glob(path .. '**', 0, 1)
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

-- Try(nmap, '\\9', ReloadAll)
-- nmap('\\9', ReloadAll)

local function slow_fn()
	-- Defer(1000, print, 'hello')
	local ns = vim.on_key(function(char) P(char) end)
	Nmap('\\7', function() vim.on_key(nil, ns) end)
end

-- vim.fn.timer_start()
-- slow_fn()

local function async() local a = require('plenary.async') end

