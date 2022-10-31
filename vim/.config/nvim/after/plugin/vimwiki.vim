augroup VimwikiGroup
	autocmd!
	autocmd FileType vimwiki setlocal foldexpr=nvim_treesitter#foldexpr()
	autocmd Filetype vimwiki TSBufDisable highlight
augroup END
