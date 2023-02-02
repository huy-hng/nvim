-- better folding lines and column
local M = {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	event = 'BufReadPre',
}

-- hi default UfoFoldedFg guifg=Normal.foreground
-- hi default UfoFoldedBg guibg=Folded.background
-- hi default link UfoPreviewSbar PmenuSbar
-- hi default link UfoPreviewThumb PmenuThumb
-- hi default link UfoPreviewWinBar UfoFoldedBg
-- hi default link UfoPreviewCursorLine Visual
-- hi default link UfoFoldedEllipsis Comment
-- hi default link UfoCursorFoldedLine CursorLine

function M.config()
	local highlight = vim.api.nvim_set_hl
	highlight(0, 'UfoFoldedEllipsis', { link = 'FoldColumn' })
	highlight(0, 'UfoCursorFoldedLine', { link = 'CursorLine' })

	local fn = require('plugins.ui.ufo.functions')
	local fold_text = require('plugins.ui.ufo.fold_text_handler')

	require('ufo').setup {
		provider_selector = function(bufnr, filetype, buftype)
			local ftMap = {
				help = '',
				vimwiki = 'indent',
				Outline = '',
				norg = '',
			}
			Nmap('K', fn.peekOrHover, '[UFO] peek or hover')
			if ftMap[filetype] ~= '' then --
				fn.set_keymaps(bufnr)
				-- fn.customizeBufFoldText()
			end

			return ftMap[filetype] or { 'lsp', 'indent' }
		end,

		open_fold_hl_timeout = 150,
		close_fold_kinds = { 'imports', 'comment' },
		-- fold_virt_text_handler = fold_text.mark_copier,
		fold_virt_text_handler = fold_text.fold_text_handler,
		enable_get_fold_virt_text = true,
		preview = {
			win_config = {
				border = { '', '━', '', '', '', '━', '', '' },
				winhighlight = 'Normal:Normal',
				winblend = 50,
				-- winblend = 20,
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

	-- UfoFoldedFg: Foreground for raw text of folded line.
	-- UfoFoldedBg: Background of folded line.
	-- UfoPreviewSbar: Scroll bar of preview window, only take effect if the border is missing right horizontal line, like border = 'none'.
	-- UfoPreviewCursorLine: Highlight current line in preview window if it isn't the start of folded lines.
	-- UfoPreviewWinBar: Virtual winBar of preview window.
	-- UfoPreviewThumb: Thumb of preview window.
	-- UfoFoldedEllipsis: Ellipsis at the end of folded line, invalid if fold_virt_text_handler is set.
end
-- M.config()

return M
