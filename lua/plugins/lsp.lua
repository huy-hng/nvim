-- lua/plugins/lsp.lua
--
-- Responsibilities:
--   Mason: install external tools
--   nvim-lspconfig: provide server configurations
--   vim.lsp: configure and enable language servers

-- 1. Install plugins
local M = {
	'neovim/nvim-lspconfig',
	dependencies = {
		'WhoIsSethDaniel/mason-tool-installer.nvim',
		'mason-org/mason.nvim',
	},
	event = 'VeryLazy',
}


function M.config()
	-- 2. Configure Mason
	require("mason").setup()

	-- 3. Declare tools to install
	-- These are Mason package names, not LSP configuration names.
	require("mason-tool-installer").setup({
		ensure_installed = {
			"lua-language-server",
			-- "clangd",
			-- "pyright",
		},
	})

	-- 4. Configure language servers
	-- These configurations come from nvim-lspconfig.
	vim.lsp.config("lua_ls", {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})

	-- 5. Enable language servers
	-- These are nvim-lspconfig configuration names.
	vim.lsp.enable({
		'lua_ls',
		'clangd',
		'pyright',
	})

	-- 6. Configure diagnostics
	vim.diagnostic.config({
		virtual_text = true,
		underline = true,
		signs = true,
		severity_sort = true,
	})

	-- 7. Set buffer-local keymaps when an LSP attaches
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

		callback = function(event)
			local opts = { buffer = event.buf }

			vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = event.buf })

			local lsp_map = Map.new('<leader>l', '', '[LSP]', opts)

			lsp_map.n('gl', vim.diagnostic.setloclist)

			lsp_map.n('l', { vim.lsp.buf.format, { bufnr = event.buf } }, 'Format Document or Selection')
			-- Map.nv('<leader>ll', fns.lsp_format, 'Format Document or Selection')
			-- Map.nv('<leader>ll', { vim.lsp.buf.format, { bufnr = event.buf } }, 'Format Document or Selection')

			lsp_map.n('d', vim.lsp.buf.definition, 'Definition')
			lsp_map.n('rf', vim.lsp.buf.references, 'References')
			lsp_map.n('i', vim.lsp.buf.implementation, 'Implementation')
			lsp_map.n('D', vim.lsp.buf.declaration, 'Declaration')
			lsp_map.n('h', vim.lsp.buf.signature_help, 'Signature Help')

			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

			local list_workspace_folders = function() vim.print(vim.lsp.buf.list_workspace_folders()) end
			lsp_map.n('wl', list_workspace_folders, 'List Workspaces')
			lsp_map.n('wa', vim.lsp.buf.add_workspace_folder, 'Add Workspace')
			lsp_map.n('wr', vim.lsp.buf.remove_workspace_folder, 'Remove Workspace')

			lsp_map.n('r', vim.lsp.buf.rename, 'Rename')
			lsp_map.n('a', vim.lsp.buf.code_action, 'Code Actions')
			-- lsp_map.n('c', require('plugins.lsp.core.codelens').run, 'codelens')


			if not nrequire('lspsaga') then return end
			require('plugins.lsp.lspsaga').keymaps()
		end,
	})
end

return M
