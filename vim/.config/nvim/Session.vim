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
badd +188 vim/functions.vim
badd +42 vim/autocmds.vim
badd +35 vim/sets.vim
badd +28 plugs/goyo.vim/autoload/goyo.vim
badd +25 init.lua
badd +42 vim/key_bindings/navigation.vim
badd +21 vimrc
badd +1 init.vim
badd +1 init.lua.bak
badd +4 vim/misc.vim
badd +1 .vimrc
badd +1 ~/.dotfiles/vim/.config/vim/.vimrc
badd +5 vim/key_bindings/auto_completion.vim
badd +99 lua/user/cmp.lua_
badd +60 vim/plugins/plugins.vim
badd +68 lua/user/plugins.lua_
badd +1 lua/user/plugins.lua
badd +163 lua/user/cmp.lua
badd +2 vim/plugins/gitgutter.vim
badd +1 lua/user/cmpp.lua
badd +1 lua/user/lsp/init.lua
badd +1 ~/.dotfiles/personal/personal/vimwiki/Main/index.md
badd +3 ~/.dotfiles/personal/personal/vimwiki/Main/daily_log/2022-10-04.md
badd +1 vim/plugins/telescope.vim
badd +36 after/plugin/telescope.lua
badd +32 ~/.dotfiles/tmux/.config/tmux/tmux.conf
badd +31 lua/user/autopairs.lua
badd +13 lua/user/treesitter.lua
badd +90 lua/user/lsp/handlers.lua
badd +52 lua/user/nvim-tree.lua
badd +554 lua/work_in_progress.init.lua
badd +18 lua/user/bufferline.lua
badd +40 vim/colors.vim
badd +1 ~/repositories/Neovim-from-scratch/lua/user/bufferline.lua
argglobal
%argdel
edit lua/user/bufferline.lua
argglobal
balt vim/plugins/plugins.vim
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 10 - ((9 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 09|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
