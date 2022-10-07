"===============================================================================
" => Buffers
"===============================================================================

nnoremap <A-1> <cmd>call GoToBufferIndex(1)<cr>
nnoremap <A-2> <cmd>call GoToBufferIndex(2)<cr>
nnoremap <A-3> <cmd>call GoToBufferIndex(3)<cr>
nnoremap <A-4> <cmd>call GoToBufferIndex(4)<cr>
nnoremap <A-5> <cmd>call GoToBufferIndex(5)<cr>
nnoremap <A-6> <cmd>call GoToBufferIndex(6)<cr>
nnoremap <A-7> <cmd>call GoToBufferIndex(7)<cr>
nnoremap <A-8> <cmd>call GoToBufferIndex(8)<cr>
nnoremap <A-9> <cmd>call GoToBufferIndex(9)<cr>

" nnoremap <leader>bl :bnext<cr>

" nnoremap <leader>bh :bprevious<cr>
" nnoremap <Leader>bb :buffers<CR>:buffer<Space>
" nnoremap <leader>bd :Bclose<cr>:tabclose<cr>gT
" nnoremap <leader>bda <cmd> %bd <bar> e# <bar> bd# <cr>
" nnoremap <leader>bf <cmd>

" 'l':  'Next Buffer',
" 'h':  'Previous Buffer',
" 'n':  'List Buffers',
" 'd':  'Close current buffer',
" 'da': 'Close all buffers except current one',


" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>


" Specify the behavior when switching between buffers 
set switchbuf=useopen,usetab,newtab


"===============================================================================
" => Windows
"===============================================================================

" Move buffer to split
" only works for one window
noremap <S-Up>		<cmd>aboveleft split<CR><cmd>bnext<CR><cmd>wincmd p<CR>
noremap <S-Down>	<cmd>belowright split<CR><cmd>bnext<CR><cmd>wincmd p<CR>
noremap <S-Left>	<cmd>belowright vsplit<CR><cmd>bnext<CR><cmd>wincmd p<CR>
noremap <S-Right>	<cmd>vsplit<CR><cmd>bnext<CR><cmd>wincmd p<CR>


" Move between windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

nnoremap <Up>    <cmd>resize -4<CR>
nnoremap <Down>  <cmd>resize +4<CR>
nnoremap <Left>  <cmd>vertical resize -4<CR>
nnoremap <Right> <cmd>vertical resize +4<CR>

"===============================================================================
" => Tabs
"===============================================================================
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
