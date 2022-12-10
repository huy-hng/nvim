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
		if chunkText == '\t' then
			chunk[1] = vim.fn.substitute(chunkText , '\t', '▏   ', 'g')
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

return M
