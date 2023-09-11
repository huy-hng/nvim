local function switch_source_header_splitcmd(bufnr, splitcmd)
	bufnr = require('lspconfig').util.validate_bufnr(bufnr)
	local clangd_client = require('lspconfig').util.get_active_client_by_name(bufnr, 'clangd')
	local params = { uri = vim.uri_from_bufnr(bufnr) }
	if clangd_client then
		clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
			if err then error(tostring(err)) end
			if not result then
				print('Corresponding file can’t be determined')
				return
			end
			vim.api.nvim_command(splitcmd .. ' ' .. vim.uri_to_fname(result))
		end, bufnr)
	else
		print('textDocument/switchSourceHeader is not supported by the clangd server active on the current buffer')
	end
end

return {
	cmd = {
		'clangd',
		-- '--all-scopes-completion',
		-- '--suggest-missing-includes',
		'--background-index',
		-- '--pch-storage=disk',
		-- '--cross-file-rename',
		-- '--log=info',
		-- '--completion-style=detailed',
		'--enable-config', -- clangd 11+ supports reading from .clangd configuration file
		-- '--clang-tidy',
		'--offset-encoding=utf-16',
		-- '--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type',
		-- '--fallback-style=Google',
		-- '--header-insertion=never',
		-- '--query-driver=<list-of-white-listed-complers>',
	},

	commands = {
		-- ClangdSwitchSourceHeader = {
		-- 	function() switch_source_header_splitcmd(0, 'edit') end,
		-- 	description = 'Open source/header in current buffer',
		-- },
		ClangdSwitchSourceHeaderVSplit = {
			function() switch_source_header_splitcmd(0, 'vsplit') end,
			description = 'Open source/header in a new vsplit',
		},
		ClangdSwitchSourceHeaderSplit = {
			function() switch_source_header_splitcmd(0, 'split') end,
			description = 'Open source/header in a new split',
		},
	},
	settings = {
		clangd = {
			inactiveRegions = {
				opacity = 1,
				useBackgroundHighlight = true,
			},
			-- semanticHighlighting = true,
			-- fallbackFlags = {},
		},
	},
}
