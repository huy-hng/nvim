-- vim.api.nvim_out_write('123\n')

function GetCommandCompletion()
	vim.cmd([[
		function! GetCommandCompletion( base )
			silent execute "normal! :" a:base . "\<c-a>'\<c-b>return '\<cr>"
		endfunction
		" let cmds = GetCommandCompletion('setfiletype ')
		" echo cmds
	]])
	local res = nvim.exec('echo GetCommandCompletion("setfiletype ")')
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

local function vim_api()
	vim.api.nvim_get_all_options_info()
	vim.api.nvim_err_writeln()
	vim.api.nvim_err_write()

	vim.api.nvim_get_context()
	vim.api.nvim_get_color_by_name()
	vim.api.nvim_notify() -- ?
	
end

local function vim_functions()
	vim.loop.now() -- to measure time
	vim.fn.winlayout(1) -- get layout of tab

	vim.fn.winline() -- where the cursor is relative to the window (not buffer)
	vim.fn.wincol() -- get cursor column relative to window
	-- print(vim.fn.screencol())
	-- print(vim.fn.screenrow())

	local winline = vim.fn.win_splitmove(winid, -10) -- move window
	local info = vim.fn.api_info()
	local winline = vim.fn.win_move_separator(winid, -10) -- change window size
	P(info)
end


local function recurse_layout(parent, nodes)
	for _, node in ipairs(nodes) do
		local type, val = unpack(node)
		if type ~= 'leaf' then
			node = recurse_layout({}, val)
			parent[type] = node
		else
			parent[val] = type
		end
	end
	return parent
end

local function win_layout()
	local tabnr = vim.api.nvim_get_current_tabpage()
	local layout = vim.fn.winlayout(tabnr) -- get layout of tab

	local formatted = recurse_layout({}, { layout })
	P(formatted)
end
