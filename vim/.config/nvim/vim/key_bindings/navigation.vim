"===============================================================================
" => Buffers
"===============================================================================

nnoremap <Leader>n :buffers<CR>:buffer<Space>


" Close current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT


" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Specify the behavior when switching between buffers 
set switchbuf=useopen,usetab,newtab


"===============================================================================
" => Windows
"===============================================================================

" Move buffer to split
noremap <C-A-Up>	:aboveleft	wincmd^<CR>
noremap <C-A-Down>	:belowright	wincmd^<CR>
noremap <C-A-Left>	:vertical rightbelow wincmd^<CR>
noremap <C-A-Right>	:vertical aboveleft	wincmd^<CR>

" Move between windows
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l

nnoremap <Up>    :resize -4<CR>
nnoremap <Down>  :resize +4<CR>
nnoremap <Left>  :vertical resize -4<CR>
nnoremap <Right> :vertical resize +4<CR>

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
