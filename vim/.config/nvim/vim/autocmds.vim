" Set to auto read when a file is changed from the outside
set autoread
"autocmd FocusGained,BufEnter * checktime
"autocmd VimEnter * echo 'hello'
autocmd FocusLost *.vim echo 'asd'
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 
