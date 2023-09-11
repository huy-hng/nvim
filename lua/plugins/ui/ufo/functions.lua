local ufo = require('ufo')

local M = {}

M.peek_fold = function()
	return ufo.peekFoldedLinesUnderCursor(false, false)
end

M.goPreviousClosedAndPeek = function()
	ufo.goPreviousClosedFold()
	ufo.peekFoldedLinesUnderCursor(false, false)
end

M.goNextClosedAndPeek = function()
	ufo.goNextClosedFold()
	ufo.peekFoldedLinesUnderCursor(false, false)
end

M.applyFoldsAndThenCloseAllFolds = function(providerName)
	require('async')(function()
		local bufnr = vim.api.nvim_get_current_buf()
		-- make sure buffer is attached
		ufo.attach(bufnr)
		-- getFolds return Promise if providerName == 'lsp'
		local ranges = await(ufo.getFolds(bufnr, providerName))
		local ok = ufo.applyFolds(bufnr, ranges)
		-- if ok then ufo.closeAllFolds() end
	end)
end

M.customizeBufFoldText = function()
	-- buffer scope handler
	-- will override global handler if it is existed
	local bufnr = vim.api.nvim_get_current_buf()
	ufo.setFoldVirtTextHandler(bufnr, M.fold_text_handler)
end

M.set_keymaps = function(bufnr)
	local ufomap = Map.new('', '', '[UFO]', { buffer = bufnr })

	ufomap.n('[f', M.goPreviousClosedAndPeek, 'go to previous fold and peek')
	ufomap.n(']f', M.goNextClosedAndPeek, 'go to next fold and peek')

	ufomap.n('zR', ufo.openAllFolds, 'open all folds')
	ufomap.n('zM', ufo.closeAllFolds, 'close all folds')

	-- ufomap.n('K', M.peekOrHover, 'peek or hover')

	-- ufomap.n('z;', ufo.goPreviousStartFold, 'inspect')
	ufomap.n('zX', { M.applyFoldsAndThenCloseAllFolds, 'lsp' }, 'Apply and close folds')
	-- Map.n('zX', 'zx')

	-- ufomap.n('zr', ufo.openFoldsExceptKinds, 'open folds except kinds')
	-- ufomap.n('zm', ufo.closeFoldsWith, 'close folds with') -- closeAllFolds == closeFoldsWith(0)

	-- calls the function below. If it there is nothing to peek, then lsp.hover will be executed
	-- which is defined in lsp.handlers. If the lsp doesnt provide anything, regular 'K' will be executed
	-- which is the keywordprg option, defined in options.lua.
	-- ufomap.n('K', M.peekOrHover, 'peek or hover')
end

-----------------------------------------providerSelector-------------------------------------------

--- if you prefer treesitter provider rather than lsp,
--- return ftMap[filetype] or {'treesitter', 'indent'}
M.selectProviderWithFt = function()
	local ftMap = {
		vim = 'indent',
		python = { 'indent' },
		git = '',
	}
	ufo.setup {
		provider_selector = function(bufnr, filetype, buftype)
			-- return a table with string elements: 1st is name of main provider, 2nd is fallback
			-- return a string type: use ufo inner providers
			-- return a string in a table: like a string type above
			-- return empty string '': disable any providers
			-- return `nil`: use default value {'lsp', 'indent'}
			-- return a function: it will be involved and expected return `UfoFoldingRange[]|Promise`

			-- if you prefer treesitter provider rather than lsp,
			-- return ftMap[filetype] or {'treesitter', 'indent'}
			return ftMap[filetype]
		end,
	}
end

-- lsp->treesitter->indent
M.selectProviderWithChainByDefault = function()
	local ftMap = {
		vim = 'indent',
		python = { 'indent' },
		git = '',
	}

	---@param bufnr number
	---@return Promise
	local function customizeSelector(bufnr)
		local function handleFallbackException(err, providerName)
			if type(err) == 'string' and err:match('UfoFallbackException') then
				return ufo.getFolds(bufnr, providerName)
			else
				return require('promise').reject(err)
			end
		end

		return ufo
			.getFolds(bufnr, 'lsp')
			:catch(function(err) return handleFallbackException(err, 'treesitter') end)
			:catch(function(err) return handleFallbackException(err, 'indent') end)
	end

	ufo.setup {
		provider_selector = function(bufnr, filetype, buftype) return ftMap[filetype] or customizeSelector end,
	}
end

M.selectProviderWithFunction = function()
	---@param bufnr number
	---@return UfoFoldingRange[]
	local function customizeSelector(bufnr)
		local res = {}
		table.insert(res, { startLine = 1, endLine = 3 })
		table.insert(res, { startLine = 5, endLine = 10 })
		return res
	end

	local ftMap = {
		vim = 'indent',
		python = { 'indent' },
		git = customizeSelector,
	}

	ufo.setup {
		provider_selector = function(bufnr, filetype, buftype) return ftMap[filetype] end,
	}
end

return M
