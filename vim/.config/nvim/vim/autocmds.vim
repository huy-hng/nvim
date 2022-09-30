" Set to auto read when a file is changed from the outside
set autoread
"autocmd FocusGained,BufEnter * checktime
"autocmd VimEnter * echo 'hello'
autocmd FocusLost *.vim echo 'asd'
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber 
autocmd BufNewFile */daily_log/[0-9]*.md : 0r !echo "= $(date -d '%:t:r' +'\%A, \%b \%d') =\n"
"autocmd BufNewFile */daily_log/[0-9]*.md : 0r !echo "= $(date -d '%:t:r' +'\%A, \%B \%d \%Y') =\n"


"augroup VimrcAuGroup
"	autocmd!
"	autocmd FileType vimwiki setlocal foldmethod=expr |
"		\ setlocal foldenable | set foldexpr=VimwikiFoldLevelCustom(v:lnum)
"augroup END
