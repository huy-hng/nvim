let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.dotfiles/vim/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +17 ~/.dotfiles/vim/.config/nvim/lua/helpers/require_dir.lua
badd +22 vim/neovide.vim
badd +4 vim/user_interface.vim
badd +7 ~/.dotfiles/personal/personal/vimwiki/Main/daily_log/2022-10-10.md
badd +108 ~/.dotfiles/vim/.config/nvim/vim/statusline.vim
badd +101 vim/plugins/startify.vim
argglobal
%argdel
edit ~/.dotfiles/personal/personal/vimwiki/Main/daily_log/2022-10-10.md
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 57 + 97) / 195)
exe 'vert 2resize ' . ((&columns * 137 + 97) / 195)
argglobal
balt vim/plugins/startify.vim
setlocal fdm=expr
setlocal fde=VimwikiFoldListLevel(v:lnum)
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 7 - ((6 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 7
normal! 02|
wincmd w
argglobal
if bufexists(fnamemodify("~/.dotfiles/vim/.config/nvim/vim/statusline.vim", ":p")) | buffer ~/.dotfiles/vim/.config/nvim/vim/statusline.vim | else | edit ~/.dotfiles/vim/.config/nvim/vim/statusline.vim | endif
if &buftype ==# 'terminal'
  silent file ~/.dotfiles/vim/.config/nvim/vim/statusline.vim
endif
balt ~/.dotfiles/personal/personal/vimwiki/Main/daily_log/2022-10-10.md
setlocal fdm=expr
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
54
normal! zo
114
normal! zo
let s:l = 107 - ((26 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 107
normal! 014|
wincmd w
exe 'vert 1resize ' . ((&columns * 57 + 97) / 195)
exe 'vert 2resize ' . ((&columns * 137 + 97) / 195)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
