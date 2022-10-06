let g:which_key_map = {}
let g:which_key_vertical = 0
" let g:which_key_position = 'topleft'
" let g:which_key_position = 'botright'
" let g:which_key_use_floating_win = 1
let g:which_key_hspace = 2
let g:which_key_centered = 1

" which key
nnoremap <silent> <leader>      :c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <C-w>			:<c-u>WhichKey 'C-w'<CR>
vnoremap <silent> <leader> 		:<c-u>WhichKeyVisual ' '<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey '\'<CR>


call which_key#register('<Space>', "g:which_key_map")
call which_key#register('<Space>', "g:which_key_map", 'n')
call which_key#register('<Space>', "g:which_key_map_visual", 'v')



" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
" Define a separator
" let g:which_key_sep = '→'
" set timeoutlen=100

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler


let g:which_key_map.v = {
			\ 'name': '+Vimwiki',
			\ 'w': [':VimwikiIndex', 'Wiki Index'],
			\ 'i': [':VimwikiDiaryIndex', 'Diary Index'],
			\ 's': [':VimwikiUISelect', 'Select Wiki Index'],
			\ 'd': [':VimwikiMakeDiaryNote', 'Daily Log Note'],
			\ 'l': [':VimwikiDiaryGenerateLinks', 'Update Daily Log Index'],
			\ }
			" \ 'y': [':VimwikiMakeYesterdayDiaryNote', 'Yesterday Log Note'],
			" \ 'm': [':VimwikiMakeTomorrowDiaryNote', 'Tomorrow Log Note'],
			" \ 't': [':VimwikiTabMakeDiaryNote', 'Daily Log Tab'],

" Single mappings
" let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'	, 'comment' ]
" let g:which_key_map['f'] = [ ':Files'						, 'search files' ]
let g:which_key_map['_'] = [ '<C-W>s'						, 'split below']
let g:which_key_map['|'] = [ '<C-W>v'						, 'split right']
" let g:which_key_map['e'] = [ ':RnvimrToggle'				, 'Ranger' ]
let g:which_key_map['S'] = [ 'Startify'					, 'start screen' ]
nnoremap <leader>z <cmd>Goyo<CR>
nnoremap <leader>Z <cmd>Zen<CR>
let g:which_key_map['z'] = 'Goyo'
let g:which_key_map['Z'] = 'Zen'
let g:which_key_map['?'] = [ ':Limelight!!'					, 'Limelight' ]
" nnoremap <silent><leader>? <cmd>Limelight!!<CR>



let g:which_key_map.t = {
			\ 'name': '+Telescope',
			\ 't': [':Telescope', 'Telescope'],
			\ 'f': [':Telescope find_files', 'files'],
			\ 'k': [':Telescope keymaps', 'keymaps'],
			\ 'b': [':Telescope buffers', 'buffers'],
			\ 'g': [':Telescope grep_string', 'grep string'],
			\ 'l': [':Telescope live_grep', 'live grep'],
			\ 'h': [':Telescope help_tags', 'help tags'],
			\ }

" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }


"===============================================================================
"                               |=> Ignores <=|
"===============================================================================
let g:which_key_map['/'] = 'which_key_ignore'
let g:which_key_map[';'] = 'which_key_ignore'
let g:which_key_map.w = { 'name': 'which_key_ignore' }
let g:which_key_map['w '] = { 'name': 'which_key_ignore' }
let g:which_key_map.x = 'which_key_ignore'
let g:which_key_map.wq = 'which_key_ignore'
let g:which_key_map.Q = 'which_key_ignore'
let g:which_key_map.p = 'which_key_ignore'
let g:which_key_map.P = 'which_key_ignore'
let g:which_key_map.q = 'which_key_ignore'
" let g:which_key_map.w = 'which_key_ignore'
let g:which_key_map.W = 'which_key_ignore'
let g:which_key_map.y = { 'name': 'which_key_ignore' }
