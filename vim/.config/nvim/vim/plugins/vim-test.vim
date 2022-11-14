let test#strategy = {
  \ 'nearest': 'basic',
  \ 'file':    'basic',
  \ 'suite':   'basic',
\}

let g:test#preserve_screen = 1
tmap <C-o> <C-\><C-n>

" let test#neovim#term_position = "topleft"
" let test#neovim#term_position = "vert"
" let test#neovim#term_position = "vert botright 30"

let g:test#echo_command = 0

nmap <leader>'n <cmd>TestNearest<CR>
nmap <leader>'f <cmd>TestFile<CR>
nmap <leader>'c <cmd>TestClass<CR>
nmap <leader>'s <cmd>TestSuite<CR>
nmap <leader>'l <cmd>TestLast<CR>
nmap <leader>'v <cmd>TestVisit<CR>
