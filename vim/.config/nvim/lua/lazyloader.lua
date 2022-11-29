-- pcall(require, 'plugins.lualine')
-- require('plugins.bufferline')
-- require('plugins.lualine')
-- require('plugins.quickscope')
-- require('plugins.startify')
-- require('plugins.vimwiki')

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

		pcall(require, 'lua.plugins.bufferline')
		pcall(require, 'lua.plugins.comment')
		pcall(require, 'lua.plugins.database')
		pcall(require, 'lua.plugins.git.diffview')
		pcall(require, 'lua.plugins.git.gitsigns')
		pcall(require, 'lua.plugins.harpoon')
		pcall(require, 'lua.plugins.leap')
		pcall(require, 'lua.plugins.lspsaga.config')
		pcall(require, 'lua.plugins.lspsaga.keymaps')
		pcall(require, 'lua.plugins.lspsaga.winbar')
		pcall(require, 'lua.plugins.luasnip.init')
		pcall(require, 'lua.plugins.ranger')
		pcall(require, 'lua.plugins.whichkey.ignores')
		pcall(require, 'lua.plugins.whichkey.setup')
		pcall(require, 'lua.plugins.whichkey.whichkey')
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
