" general
cabbrev telp tab help
cabbrev hvw tab help vimwiki
cabbrev sovim so $HOME/.config/nvim/init.vim
cabbrev solua so $HOME/.config/nvim/init.lua

cabbrev h vertical h
" Vimwiki
cabbrev vwtoc VimwikiTOC

" other extensions
cnoreabbrev plugi PlugInstall
" cnoreabbrev tel Telescope

" command for opening help in current buffer
command! -nargs=1 -complete=help Help :enew | :set buftype=help | :h <args>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
"map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
"map <leader>pp :setlocal paste!<cr>


