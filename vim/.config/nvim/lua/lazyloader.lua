local function save_require(package, keys)
	return function()
		-- pcall(R, package)
		pcall(require, package)
		Schedule(Feedkeys, keys, true)
	end
end

local function nmap_execute(lhs, package, description, opts)
	nmap(lhs, save_require(package, lhs), description, opts)
end

nmap_execute('<C-p>', 'plugins.telescope')
nmap_execute('<C-e>', 'plugins.tree')
nmap_execute('<C-g>', 'plugins.git.neogit')

-- lsp
vim.api.nvim_create_autocmd('FileType', {
	once = true,
	pattern = { 'python', 'lua' },
	-- pattern = '*',
	group = vim.api.nvim_create_augroup('lsp_lazyload', { clear = true }),
	callback = function()
		pcall(require, 'lsp.init')
	end,
})

-- vim.api.nvim_create_autocmd('WinEnter', {
-- 	once = true,
-- 	group = vim.api.nvim_create_augroup('lualine_lazyload', { clear = true }),
-- 	callback = function()
-- 		pcall(require, 'plugins.lualine')
-- 	end,
-- })

vim.api.nvim_create_autocmd('BufReadPre', {
	once = true,
	group = vim.api.nvim_create_augroup('treesitter_lazyload', { clear = true }),
	callback = function()
		pcall(require, 'plugins.treesitter.completion')
		pcall(require, 'plugins.treesitter.context')
		pcall(require, 'plugins.treesitter.playground')
		pcall(require, 'plugins.treesitter.selection')
		pcall(require, 'plugins.treesitter.textobjects')
		pcall(require, 'plugins.treesitter.treehopper')
		pcall(require, 'plugins.treesitter.treesitter')
		pcall(require, 'plugins.treesitter.visual')

		pcall(require, 'plugins.bufferline')
		pcall(require, 'plugins.comment')
		pcall(require, 'plugins.database')
		pcall(require, 'plugins.git.diffview')
		pcall(require, 'plugins.git.gitsigns')
		pcall(require, 'plugins.harpoon')
		pcall(require, 'plugins.leap')
		pcall(require, 'plugins.lspsaga.config')
		pcall(require, 'plugins.lspsaga.keymaps')
		pcall(require, 'plugins.lspsaga.winbar')
		pcall(require, 'plugins.luasnip.init')
		pcall(require, 'plugins.ranger')
		pcall(require, 'plugins.whichkey.ignores')
		pcall(require, 'plugins.whichkey.setup')
		pcall(require, 'plugins.whichkey.whichkey')
	end,
})

-- dap
vim.api.nvim_create_autocmd('FileType', {
	once = true,
	pattern = 'python',
	group = vim.api.nvim_create_augroup('dap_lazyload', { clear = true }),
	callback = function()
		pcall(require, 'plugins.dap.dap')
		pcall(require, 'plugins.dap.dapui')
		pcall(require, 'plugins.dap.neotest')
		pcall(require, 'plugins.dap.zmappings')
	end,
})

-- cmp
vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter', 'CmdwinEnter' }, {
	once = true,
	group = vim.api.nvim_create_augroup('cmp_lazyload', { clear = true }),
	callback = function()
		pcall(require, 'plugins.cmp.cmp')
		pcall(require, 'plugins.autopairs')
	end,
})
