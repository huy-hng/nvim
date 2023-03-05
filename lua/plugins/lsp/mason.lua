local M = {
	'williamboman/mason.nvim',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
		'jayp0521/mason-null-ls.nvim',
	},
	event = 'VeryLazy',
}

function M.config()
	require('mason').setup()

	require('mason-lspconfig').setup {
		ensure_installed = {
			-- 'LuaLS',
			'pyright',
			-- 'json-lsp',
		},
		automatic_installation = true, -- not the same as ensure_installed
	}

	require('mason-null-ls').setup {
		ensure_installed = {
			'autopep8', -- python linter
			'prettier', -- ts/js formatter
			'stylua', -- lua formatter
			'yamlfmt',
			'fixjson',
		},
		automatic_installation = true,
	}
end

-- M.tools = {
-- 	'prettierd',
-- 	'stylua',
-- 	'selene',
-- 	'luacheck',
-- 	'eslint_d',
-- 	'shellcheck',
-- 	'black',
-- 	'isort',
-- 	'flake8',
-- }

-- function M.check()
-- 	local mr = require('mason-registry')
-- 	for _, tool in ipairs(M.tools) do
-- 		local p = mr.get_package(tool)
-- 		if not p:is_installed() then p:install() end
-- 	end
-- end
return M
