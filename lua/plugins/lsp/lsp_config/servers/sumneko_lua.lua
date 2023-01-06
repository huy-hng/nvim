return {
	settings = {
		-- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
		-- single_file_support = true,
		Lua = {
			-- make the language server recognize "vim" global
			-- diagnostics = {
			-- 	globals = { 'vim' },
			-- },
			workspace = {
				-- make language server aware of runtime files
				-- library = vim.api.nvim_get_runtime_file('', true),
				checkThirdParty = false,
				-- library = {
				-- 	[vim.fn.expand('$VIMRUNTIME/lua')] = true,
				-- 	[vim.fn.stdpath('config') .. '/lua'] = true,
				-- },
			},
			-- completion = {
			-- 	workspaceWord = true,
			-- 	-- callSnippet = 'Replace',
			-- },
			misc = {
				parameters = {
					'--log-level=trace',
				},
			},
			-- diagnostics = {
			-- 	enable = false,
			-- 	groupSeverity = {
			-- 		strong = 'Warning',
			-- 		strict = 'Warning',
			-- 	},
			-- 	groupFileStatus = {
			-- 		['ambiguity'] = 'Opened',
			-- 		['await'] = 'Opened',
			-- 		['codestyle'] = 'None',
			-- 		['duplicate'] = 'Opened',
			-- 		['global'] = 'Opened',
			-- 		['luadoc'] = 'Opened',
			-- 		['redefined'] = 'Opened',
			-- 		['strict'] = 'Opened',
			-- 		['strong'] = 'Opened',
			-- 		['type-check'] = 'Opened',
			-- 		['unbalanced'] = 'Opened',
			-- 		['unused'] = 'Opened',
			-- 	},
			-- 	unusedLocalExclude = { '_*' },
			-- },
			format = {
				enable = false,
				defaultConfig = {
					indent_style = 'tab',
					indent_size = '4',
					continuation_indent_size = '4',
				},
			},
		},
	},
}
