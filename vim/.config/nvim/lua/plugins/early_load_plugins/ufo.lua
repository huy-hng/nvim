local has_ufo, ufo = pcall(require, 'ufo')
if not has_ufo then return end

local o = vim.o
o.foldcolumn = '1' -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
nmap('zR', ufo.openAllFolds)
nmap('zM', ufo.closeAllFolds)

-- Option 3: treesitter as a main provider instead
-- Only depend on `nvim-treesitter/queries/filetype/folds.scm`,
-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
ufo.setup {
	provider_selector = function(bufnr, filetype, buftype)
		return { 'treesitter', 'indent' }
	end,
	open_fold_hl_timeout = 100,
	-- open_fold_hl_timeout = {
	-- 	description = [[Time in millisecond between the range to be highlgihted and to be cleared
	-- 					opening the folded line, `0` value will disable the highlight]],
	-- 	default = 400,
	-- },
	-- provider_selector = {
	-- 	description = [[A function as a selector for fold providers. For now, there are
	-- 		                    'lsp' and 'treesitter' as main provider, 'indent' as fallback provider]],
	-- 	default = nil,
	-- },
	-- close_fold_kinds = {
	-- 	description = [[After the buffer is displayed (opened for the first time), close the
	-- 					folds whose range with `kind` field is included in this option. For now,
	-- 					'lsp' provider's standardized kinds are 'comment', 'imports' and 'region',
	-- 					run `UfoInspect` for details if your provider has extended the kinds.]],
	-- 	default = {},
	-- },
	-- fold_virt_text_handler = {
	-- 	description = [[A function customize fold virt text, see ### Customize fold text]],
	-- 	default = nil,
	-- },
	-- enable_get_fold_virt_text = {
	-- 	description = [[Enable a function with `lnum` as a parameter to capture the virtual text
	-- 			                    for the folded lines and export the function to `get_fold_virt_text` field of
	-- 			                    ctx table as 6th parameter in `fold_virt_text_handler`]],
	-- 	default = false,
	-- },
	-- preview = {
	-- 	description = [[Configure the options for preview window and remap the keys for current
	-- 					buffer and preview buffer if the preview window is displayed.
	-- 					Never worry about the users's keymaps are overridden by ufo, ufo will save
	-- 					them and restore them if preview window is closed.]],
	-- 	win_config = {
	-- 		border = {
	-- 			description = [[The border for preview window,
	-- 							`:h nvim_open_win() | call search('border:')`]],
	-- 			default = 'rounded',
	-- 		},
	-- 		winblend = {
	-- 			description = [[The winblend for preview window, `:h winblend`]],
	-- 			default = 12,
	-- 		},
	-- 		winhighlight = {
	-- 			description = [[The winhighlight for preview window, `:h winhighlight`]],
	-- 			default = 'Normal:Normal',
	-- 		},
	-- 		maxheight = {
	-- 			description = [[The max height of preview window]],
	-- 			default = 20,
	-- 		},
	-- 	},
	-- 	mappings = {
	-- 		description = [[The table for {function = key}]],
	-- 		default = [[see ###Preview function table for detail]],
	-- 	},
	-- },
}

-- scrollB	Type CTRL-B in preview window
-- scrollF	Type CTRL-F in preview window
-- scrollU	Type CTRL-U in preview window
-- scrollD	Type CTRL-D in preview window
-- scrollE	Type CTRL-E in preview window					<C-E>
-- scrollY	Type CTRL-Y in preview window					<C-Y>
-- close	In normal window: Close preview window
-- 			In preview window: Close preview window			q
-- switch	In normal window: Go to preview window
-- 			In preview window: Go to normal window			<Tab>
-- trace	In normal window: Trace code based on topline
-- 			In preview window: Trace code based on cursor	<CR>

-- UfoEnable		Enable ufo
-- UfoDisable		Disable ufo
-- UfoInspect		Inspect current buffer information
-- UfoAttach		Attach current buffer to enable all features
-- UfoDetach		Attach current buffer to disable all features
-- UfoEnableFold	Enable to get folds and update them at once for current buffer
-- UfoDisableFold	Disable to get folds for current buffer

-- vim.cmd [[
-- " hi default UfoFoldedFg guifg=Normal.foreground
-- " hi default UfoFoldedBg guibg=Folded.background
-- hi default link UfoPreviewSbar PmenuSbar
-- hi default link UfoPreviewThumb PmenuThumb
-- hi default link UfoPreviewWinBar UfoFoldedBg
-- hi default link UfoPreviewCursorLine Visual
-- hi default link UfoFoldedEllipsis Comment
-- ]]

-- UfoFoldedFg: Foreground for raw text of folded line.
-- UfoFoldedBg: Background of folded line.
-- UfoPreviewSbar: Scroll bar of preview window, only take effect if the border is missing right horizontal line, like border = 'none'.
-- UfoPreviewCursorLine: Highlight current line in preview window if it isn't the start of folded lines.
-- UfoPreviewWinBar: Virtual winBar of preview window.
-- UfoPreviewThumb: Thumb of preview window.
-- UfoFoldedEllipsis: Ellipsis at the end of folded line, invalid if fold_virt_text_handler is set.

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.foldingRange = {
-- 	dynamicRegistration = false,
-- 	lineFoldingOnly = true,
-- }
-- local language_servers = {} -- like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
-- 	require('lspconfig')[ls].setup {
-- 		capabilities = capabilities,
-- 		other_fields = ...,
-- 	}
-- end
-- ufo.setup()
--

-- Option 4: disable all providers for all buffers
-- Not recommend, AFAIK, the ufo's providers are the best performance in Neovim
-- ufo.setup {
-- 	provider_selector = function(bufnr, filetype, buftype)
-- 		return ''
-- 	end,
-- }
