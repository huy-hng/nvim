local require_dir = require('core.require_dir')

local function nmap_execute(lhs, package, description, opts)
	nmap(lhs, function()
		pcall(require, package)
		Schedule(Feedkeys, lhs, true)
	end, description, opts)
end

local lazy_group = vim.api.nvim_create_augroup('lazyload_plugins', { clear = true })

local function lazy_autocmd(event, pattern, callback)
	vim.api.nvim_create_autocmd(event, {
		pattern = pattern,
		once = true,
		group = lazy_group,
		callback = callback,
	})
end

local function lazy_require(package, event, pattern)
	lazy_autocmd(event, pattern, function()
		if type(package) == 'string' then
			pcall(require, package)
			return
		end

		for _, p in ipairs(package) do
			pcall(require, p)
		end
	end)
end

local function lazy_require_dir(path, event, pattern)
	lazy_autocmd(event, pattern, function()
		require_dir(path)
	end)
end

local function lazy_require_function(callback, event, pattern)
	lazy_autocmd(event, pattern, callback)
end

local function buf_read_pre()
	require_dir('lua/plugins/treesitter')
	require_dir('lua/plugins/lspsaga')
	require_dir('lua/plugins/whichkey')
	require_dir('lua/plugins/git')

	pcall(require, 'plugins.comment')
	pcall(require, 'plugins.database')
	pcall(require, 'plugins.harpoon')
	pcall(require, 'plugins.leap')
	-- pcall(require, 'plugins.luasnip.init')
	pcall(require, 'plugins.ranger')
end

lazy_require('lsp.init', 'FileType', { 'python', 'lua', 'c' })
-- lazy_require('plugins.lualine', 'WinEnter')
lazy_require_function(buf_read_pre, 'BufReadPre')
lazy_require_dir('lua/plugins/dap', 'FileType', 'python')
lazy_require('plugins.autopairs', { 'InsertEnter', 'CmdlineEnter', 'CmdwinEnter' })
-- lazy_require(
-- 	{ 'plugins.cmp.cmp', 'plugins.autopairs' },
-- 	{ 'InsertEnter', 'CmdlineEnter', 'CmdwinEnter' }
-- )

nmap_execute('<C-p>', 'plugins.telescope')
nmap_execute('<C-e>', 'plugins.tree')
-- nmap_execute('<C-g>', 'plugins.git.neogit') -- gets called in BufReadPre
