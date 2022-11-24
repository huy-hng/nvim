vim.cmd([[
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
nnoremap <leader>tn <cmd>tabnew<cr>
nnoremap <leader>tc <cmd>tabclose<cr>

nnoremap <leader>to <cmd>tabonly<cr>
nnoremap <leader>th <cmd>tabmove -<cr>
nnoremap <leader>tl <cmd>tabmove +<cr>

nnoremap <leader>h <cmd>tabprevious<cr>
nnoremap <leader>l <cmd>tabnext<cr>

let g:lasttab = 1
nnoremap <leader>t; :exe "tabn "..g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
]])
