local opt = vim.opt
local o = vim.o
local go = vim.go
local wo = vim.wo
local g = vim.g
local opt_g = vim.opt_global

-- unmap('n', '<space>')
g.mapleader = ' '
g.maplocalleader = '\\'

--==============================================================================
--                             |=> Appearance <=|
--==============================================================================
-- window transparency
go.winblend = 10
go.pumblend = 10

-- line numbers
-- o.relativenumber = true -- show relative line numbers
o.number = true -- shows absolute line number on cursor line (when relative number is on)

-- cursor line
o.cursorline = false -- highlight the current cursor line
o.cursorlineopt = 'line,number'

-- colors
-- o.background = "dark" -- colorschemes that can be light or dark will be made dark
o.termguicolors = true -- true color

-- gutter
o.signcolumn = 'yes' -- show sign column so that text doesn't shift
o.numberwidth = 4 -- set to something smaller to reduce gutter size

-- folding
go.foldenable = false
o.foldlevelstart = 99 -- find a way to get the highest possible folds in a file and set it to it
					  -- or just zR at on bufenter
-- go.foldcolumn = 'auto:4'
go.foldcolumn = '0'
go.foldclose = '' -- set to 'all' to close folds after cursor leaves
go.foldminlines = 2
go.foldmethod = 'expr'
go.foldexpr = 'nvim_treesitter#foldexpr()'

-- editor
go.cmdheight = 0
go.ruler = true
-- go.winbar = '%#bold# %{expand("%:.")}'
go.laststatus = 3
go.cmdwinheight = 20

-- display indentations
o.list = true
-- o.lcs = 'tab:· ,trail:·,nbsp:+'
go.listchars = 'tab:│ ,trail:·,nbsp:+'
-- opt.listchars:append {
-- 	tab = '│',
-- 	trail = '·',
-- 	nbsp = '+',
-- }
-- ['|', '¦', '┆', '┊']
opt_g.fillchars:append {
	-- fold = '·' or '-',
	fold = '-' or '-',
	foldopen = '┬' or '-',
	foldclose = '+',
	foldsep = '│' or '|',
	-- horiz = '─' or '-',
}

--==============================================================================
--                       |=> Editor User Interface <=|
--==============================================================================

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

go.scrolloff = 8
go.sidescroll = 1
go.sidescrolloff = 8
opt_g.wildignore:append { '*.o', '*~', '*.pyc' }
go.wildmenu = true

-- g.showmatch = true
-- g.match = 2
-- g.magic = true
go.timeoutlen = 300

--==============================================================================
--                              |=> Behavior <=|
--==============================================================================

-- tabs & indentation
o.tabstop = 4 -- spaces for tabs (prettier default)
o.shiftwidth = 4 -- spaces for indent width
-- o.expandtab = true -- expand tab to spaces
o.autoindent = true -- copy indent from current line when starting new one
o.smartindent = true
o.smarttab = true

-- show complete option popup
-- go.completeopt = 'menu,menuone,noselect,preview'

-- line wrapping
o.wrap = false -- disable line wrapping
o.showbreak = '--> ' -- prefix for soft-wrapped lines
o.linebreak = true -- soft-wrap lines only at certain characters (see :help breakat)
o.breakindent = true -- indent wraps
opt.cpoptions:append('n')

opt.whichwrap:append('<,>,h,l')
opt.matchpairs:append { '<:>' }

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
o.incsearch = true

o.hidden = true
o.lazyredraw = true

-- backspace
-- o.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- g.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

-- o.iskeyword:append("-") -- consider string-string as whole word
go.swapfile = false
o.undofile = true
o.mouse = 'a'
-- No annoying sound on errors
go.errorbells = false
go.visualbell = false
go.compatible = false

-- stop auto comment for new lines
opt.formatoptions:remove { 'c', 'r', 'o' }

opt_g.path:append('**')

opt.switchbuf:append { 'useopen', 'usetab', 'vsplit' }

--==============================================================================
--                          |=> Plugin Settings <=|
--==============================================================================

g.startuptime_event_width = 40
g.startuptime_tries = 10
g.startuptime_sourced = 0
g.startuptime_exe_args = { '--noplugin' }
g.startuptime_exe_args = {}

-- Folding
-- vim.cmd([[
-- 	set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

-- 	function! MyFoldText()
-- 		let line = getline(v:foldstart)
-- 		echom line
-- 		" let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
-- 		" let sub = substitute(line, '/\\*\\\|\\*/\\\|{{{\\d\\=', '', 'g')

-- 		" return v:folddashes .. sub
-- 		return line
-- 		" v:foldstart	line number of first line in the fold
-- 		" v:foldend		line number of last line in the fold
-- 		" v:folddashes	a string that contains dashes to represent the foldlevel.
-- 		" v:foldlevel	the foldlevel of the fold
-- 	endfunction
-- 	" set foldtext=

-- 	set foldtext=MyFoldText()
-- ]])

function FoldText()
	local v = vim.v
	local line = vim.fn.getline(v.foldstart)
	local line_num = v.foldend - v.foldstart

	-- remove tab indentations
	line = vim.fn.substitute(line, '	', '', 'g')

	local indent_level = vim.fn.indent(v.foldstart)
    local indent = vim.fn['repeat'](' ', indent_level)

    -- local sub = vim.fn.substitute(line, [[/*|*/|{{{\d\=]], '', 'g')
	return indent .. line .. ' ---- ' .. line_num .. ' lines folded '
end
-- vim.o.foldtext = 'foldtext()'
vim.go.foldtext = 'v:lua.FoldText()'
