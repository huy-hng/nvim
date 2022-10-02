let $path = $HOME.'/.config/nvim/vim'

"source $path/key_bindings/key_maps.vim

function SourceDir(dir_name)
	let $dir_path = $path.'/'.a:dir_name.'/*.vim'

	for f in split(glob($dir_path), '\n')
		exe 'source' f
	endfor
endfunction


call SourceDir('key_bindings')

source $path/sets.vim
source $path/functions.vim
source $path/user_interface.vim
source $path/misc.vim


"call SourceDir('plugins')

source $path/autocmds.vim
source $path/plugins/plugins.vim
source $path/colors.vim
"source $path/plugins/gitgutter.vim
"source $path/plugins/goyo.vim
"source $path/plugins/lightline.vim
"source $path/plugins/limeline.vim
"source $path/plugins/ranger.vim
"source $path/plugins/vimwiki.vim
"source $path/plugins/vscode.vim
"source $path/plugins/which_key.vim




