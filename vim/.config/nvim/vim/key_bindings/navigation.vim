"===============================================================================
" => Buffers
"===============================================================================
fun! GoToBufferIndex(num)
	" let l:buffer_list = getbufinfo({'bufloaded': 1, 'buflisted': 1})
	let l:buffer_list = getbufinfo({'buflisted': 1})
	let l:len = len(buffer_list)

	let l:index = a:num
	if (a:num > l:len)
		let l:index = l:len
	endif

	let l:index -= 1
	" echo l:buffer_list[l:index].bufnr
	exec 'buffer ' .. l:buffer_list[l:index].bufnr
endfun

nnoremap <c> :echo 'test'<cr>

" nnoremap <C-1> <cmd>call GoToBufferIndex(1)<cr>
" nnoremap <C-1> <cmd>BufferLineGoToBuffer 1<cr>
" nnoremap <C-2> <cmd>BufferLineGoToBuffer 2<cr>
" nnoremap <C-3> <cmd>BufferLineGoToBuffer 3<cr>
" nnoremap <C-4> <cmd>BufferLineGoToBuffer 4<cr>
" nnoremap <C-5> <cmd>BufferLineGoToBuffer 5<cr>
" nnoremap <C-6> <cmd>BufferLineGoToBuffer 6<cr>
" nnoremap <C-7> <cmd>BufferLineGoToBuffer 7<cr>
" nnoremap <C-8> <cmd>BufferLineGoToBuffer 8<cr>
" nnoremap <C-9> <cmd>BufferLineGoToBuffer 9<cr>

" nnoremap <A-1> <cmd>BufferLineGoToBuffer 1<cr>
" nnoremap <A-2> <cmd>BufferLineGoToBuffer 2<cr>
" nnoremap <A-3> <cmd>BufferLineGoToBuffer 3<cr>
" nnoremap <A-4> <cmd>BufferLineGoToBuffer 4<cr>
" nnoremap <A-5> <cmd>BufferLineGoToBuffer 5<cr>
" nnoremap <A-6> <cmd>BufferLineGoToBuffer 6<cr>
" nnoremap <A-7> <cmd>BufferLineGoToBuffer 7<cr>
" nnoremap <A-8> <cmd>BufferLineGoToBuffer 8<cr>
" nnoremap <A-9> <cmd>BufferLineGoToBuffer 9<cr>


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
