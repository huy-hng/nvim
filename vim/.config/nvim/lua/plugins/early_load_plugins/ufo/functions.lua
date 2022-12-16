local ufo = require('ufo')

local M = {}

M.peekOrHover = function()
	local winid = ufo.peekFoldedLinesUnderCursor(nil, false)
	if winid then
		local bufnr = vim.api.nvim_win_get_buf(winid)
		-- local keys = { 'a', 'i', 'o', 'A', 'I', 'O', 'gd', 'gr' }
		-- for _, k in ipairs(keys) do
		-- 	-- Add a prefix key to fire `trace` action,
		-- 	-- if Neovim is 0.8.0 before, remap yourself
		-- 	vim.keymap.set('n', k, '<CR>' .. k, { noremap = false, buffer = bufnr })
		-- end
	else
		-- Feedkeys('K')
		vim.lsp.buf.hover()
	end
end

M.goPreviousClosedAndPeek = function()
	ufo.goPreviousClosedFold()
	ufo.peekFoldedLinesUnderCursor()
end

M.goNextClosedAndPeek = function()
	ufo.goNextClosedFold()
	ufo.peekFoldedLinesUnderCursor()
end

M.applyFoldsAndThenCloseAllFolds = function(providerName)
	require('async')(function()
		local bufnr = vim.api.nvim_get_current_buf()
		-- make sure buffer is attached
		ufo.attach(bufnr)
		-- getFolds return Promise if providerName == 'lsp'
		local ranges = await(ufo.getFolds(bufnr, providerName))
		local ok = ufo.applyFolds(bufnr, ranges)
		if ok then ufo.closeAllFolds() end
	end)
end

M.fold_text_handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = ('  %d '):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]

		chunk[1] = vim.fn.substitute(chunkText, '\t', '▏   ', 'g')
		if string.find(chunkText, '\t') then
			chunk[2] = 'Whitespace'
		end

		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end

	table.insert(newVirtText, { suffix, 'FoldColumn' })
	-- table.insert(newVirtText, { suffix, 'Comment' })
	return newVirtText
end

M.customizeBufFoldText = function()
	-- buffer scope handler
	-- will override global handler if it is existed
	local bufnr = vim.api.nvim_get_current_buf()
	ufo.setFoldVirtTextHandler(bufnr, M.fold_text_handler)
end

M.inspectVirtTextForFoldedLines = function()
	local fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate, ctx)
		for i = lnum, endLnum do
			print('lnum: ', i)
			P(ctx.get_fold_virt_text(i))
		end
		return virtText
	end
	return fold_virt_text_handler
end

M.set_keymaps = function(bufnr)
	local ufomap = PrefixMap('n', '', '[UFO]', { buffer = bufnr })

	ufomap('[f', M.goPreviousClosedAndPeek, 'go to previous fold and peek')
	ufomap(']f', M.goNextClosedAndPeek, 'go to next fold and peek')

	ufomap('zR', ufo.openAllFolds, 'open all folds')
	ufomap('zM', ufo.closeAllFolds, 'close all folds')

	-- ufomap('z;', ufo.goPreviousStartFold, 'inspect')
	ufomap('zX', { M.applyFoldsAndThenCloseAllFolds, 'treesitter' }, 'Apply and close folds')

	-- ufomap('zr', ufo.openFoldsExceptKinds, 'open folds except kinds')
	-- ufomap('zm', ufo.closeFoldsWith, 'close folds with') -- closeAllFolds == closeFoldsWith(0)

	-- calls the function below. If it there is nothing to peek, then lsp.hover will be executed
	-- which is defined in lsp.handlers. If the lsp doesnt provide anything, regular 'K' will be executed
	-- which is the keywordprg option, defined in options.lua.
	ufomap('K', M.peekOrHover, 'peek or hover')
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
	require('ufo').setup {
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
				return require('ufo').getFolds(bufnr, providerName)
			else
				return require('promise').reject(err)
			end
		end

		return require('ufo')
			.getFolds(bufnr, 'lsp')
			:catch(function(err) return handleFallbackException(err, 'treesitter') end)
			:catch(function(err) return handleFallbackException(err, 'indent') end)
	end

	require('ufo').setup {
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

	require('ufo').setup {
		provider_selector = function(bufnr, filetype, buftype) return ftMap[filetype] end,
	}
end

return M
