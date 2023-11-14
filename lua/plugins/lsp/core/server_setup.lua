local M = {}

local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

---@module 'cmp_nvim_lsp'
local cmp_nvim_lsp = nrequire('cmp_nvim_lsp')
if cmp_nvim_lsp then --
	cmp_nvim_lsp.default_capabilities(capabilities)
end

capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local function on_attach(client, bufnr)
	-- if vim.lsp.semantic_tokens then vim.lsp.semantic_tokens.stop(bufnr, client.id) end
	require('plugins.lsp.core.keymaps')(bufnr)
end

-- TODO: vim.fn.glob the files instead of manually listing them here
-- requires moving the python helper file somewhere else
-- see get_package_manager_cmd in /home/huy/.dotfiles/nvim/.config/nvim/lua/plugins/lsp/servers/python.lua
local language_servers = {
	'jsonls',
	'lua_ls',
	'pyright',
	'clangd',
	'vimls',
}

local function merge_opts(server_opts)
	server_opts = server_opts or {}

	local opts = {
		autostart = true,
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			require('plugins.lsp.core.keymaps')(bufnr)
			if server_opts.on_attach then server_opts.on_attach(client, bufnr) end
		end,
		on_new_config = function(new_config, new_root_dir)
			if server_opts.on_new_config then
				server_opts.on_new_config(new_config, new_root_dir)
			end
		end,
	}

	-- local config = vim.tbl_deep_extend('force', base_config, server_config)
	return vim.tbl_extend('keep', opts, server_opts)
end

function M.setup()
	for _, server_name in ipairs(language_servers) do
		local server_opts = nrequire('plugins.lsp.servers.' .. server_name)
		local merged_opts = merge_opts(server_opts)
		lspconfig[server_name].setup(merged_opts)
	end
end

return M