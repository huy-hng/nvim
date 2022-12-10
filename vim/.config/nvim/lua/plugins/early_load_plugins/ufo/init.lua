local has_ufo, ufo = pcall(R, 'ufo')
if not has_ufo then return end

local fn = R('plugins.early_load_plugins.ufo.functions')

-- ufo.closeFoldsWith(level)
-- ufo.openFoldsExceptKinds(kinds)

-- ufo.enableFold(bufnr)
-- ufo.disableFold(bufnr)

-- ufo.getFolds(bufnr, providerName)
-- ufo.applyFolds(bufnr, ranges)

-- ufo.setFoldVirtTextHandler(bufnr, handler)

local function set_keymaps(bufnr)
	local ufomap = PrefixMap('n', '', '[UFO]', { buffer = bufnr })

	ufomap('[f', fn.goPreviousClosedAndPeek, 'go to previous fold and peek')
	ufomap(']f', fn.goNextClosedAndPeek, 'go to next fold and peek')

	ufomap('zR', ufo.openAllFolds, 'open all folds')
	ufomap('zM', ufo.closeAllFolds, 'close all folds')

	-- ufomap('z;', ufo.goPreviousStartFold, 'inspect')
	ufomap('zX', { fn.applyFoldsAndThenCloseAllFolds, 'treesitter' }, 'Apply and close folds')

	-- ufomap('zr', ufo.openFoldsExceptKinds, 'open folds except kinds')
	-- ufomap('zm', ufo.closeFoldsWith, 'close folds with') -- closeAllFolds == closeFoldsWith(0)

	ufomap('K', fn.peekOrHover, 'peek or hover')
end

-- Option 3: treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
ufo.setup {
	provider_selector = function(bufnr, filetype, buftype)
		-- P(bufnr, filetype, buftype)
		if filetype ~= 'help' then --
			set_keymaps(bufnr)
			fn.customizeBufFoldText()
		end
		-- return ftMap[filetype]
		-- if you prefer treesitter provider rather than lsp,
		-- return ftMap[filetype] or {'treesitter', 'indent'}

		-- refer to ./doc/example.lua for detail
		return { 'treesitter', 'indent' }
	end,
	open_fold_hl_timeout = 150,
	close_fold_kinds = { 'imports', 'comment' },
	-- close_fold_kinds = {},
	fold_virt_text_handler = fn.fold_text_handler,
	-- fold_virt_text_handler = fn.inspectVirtTextForFoldedLines(),
	enable_get_fold_virt_text = true,
	preview = {
		win_config = {
			-- border = { '', '─', '', '', '', '─', '', '' },
			border = { '', '━', '', '', '', '━', '', '' },
			-- border = { '', '▀', '', '', '', '▄', '', '' },
			-- border = { '', '═', '', '', '', '═', '', '' },
			-- border = { '1', '2', '3', '4', '5', '6', '7', '8' },
			-- border = 'rounded',
			winhighlight = 'Normal:Normal',
			-- winhighlight = 'Normal:Folded',
			-- winblend = 50,
			winblend = 20,
			maxheight = 40,
		},
		mappings = {
			scrollB = '',
			scrollF = '',
			scrollU = '<C-u>',
			scrollD = '<C-d>',
			scrollE = '<C-E>',
			scrollY = '<C-Y>',
			close = 'q',
			switch = 'K',
			trace = '<CR>',
		},
	},
}

-- UfoEnable		Enable ufo
-- UfoDisable		Disable ufo
-- UfoInspect		Inspect current buffer information
-- UfoAttach		Attach current buffer to enable all features
-- UfoDetach		Attach current buffer to disable all features
-- UfoEnableFold	Enable to get folds and update them at once for current buffer
-- UfoDisableFold	Disable to get folds for current buffer

vim.cmd([[
" hi default UfoFoldedFg guifg=Normal.foreground
" hi default UfoFoldedBg guibg=Folded.background
" hi default UfoFoldedBg guibg=Visual
hi default link UfoPreviewSbar PmenuSbar
hi default link UfoPreviewThumb PmenuThumb
hi default link UfoPreviewWinBar UfoFoldedBg
hi default link UfoPreviewCursorLine Visual
hi default link UfoFoldedEllipsis Comment
]])

-- UfoFoldedFg: Foreground for raw text of folded line.
-- UfoFoldedBg: Background of folded line.
-- UfoPreviewSbar: Scroll bar of preview window, only take effect if the border is missing right horizontal line, like border = 'none'.
-- UfoPreviewCursorLine: Highlight current line in preview window if it isn't the start of folded lines.
-- UfoPreviewWinBar: Virtual winBar of preview window.
-- UfoPreviewThumb: Thumb of preview window.
-- UfoFoldedEllipsis: Ellipsis at the end of folded line, invalid if fold_virt_text_handler is set.
