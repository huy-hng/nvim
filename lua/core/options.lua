---@diagnostic disable: cast-local-type
local opt = vim.opt
local o = vim.o
local go = vim.go
local g = vim.g
local opt_g = vim.opt_global

g.mapleader = ' '
vim.cmd([[ let maplocalleader="\<BS>" ]])

----------------------------------------------Appearance--------------------------------------------
-- window transparency
o.winblend = 0
o.pumblend = 0
o.shell = '/bin/zsh'

o.conceallevel = 2
o.concealcursor = 'c'

-- cursor line
o.cursorline = true -- highlight the current cursor line
o.cursorlineopt = 'number'
-- o.cursorlineopt = 'line,number'

-- colors
-- o.background = "dark" -- for colorschemes that can be light or dark
o.termguicolors = true -- richer color (also causes ugly colors when using no colorscheme)

---------------------------------------------Statuscolumn-------------------------------------------

go.relativenumber = false -- show relative line numbers
go.number = true -- shows absolute line number on cursor line
o.number = true

----------------------------------------------Gutter------------------------------------------------
-- opt_g.colorcolumn:append { 80 }
-- o.signcolumn = 'auto:1-2' -- show sign column so that text doesn't shift
-- o.signcolumn = 'yes' -- show sign column so that text doesn't shift
o.signcolumn = 'no' -- show sign column so that text doesn't shift
o.numberwidth = 1 -- set to something smaller to reduce gutter size
-- go.foldcolumn = 'auto:1'
o.foldcolumn = '0'
o.showtabline = 2

-----------------------------------------------Folding----------------------------------------------
go.foldenable = true
o.foldlevelstart = 99 -- find a way to get the highest possible folds in a file and set it to it
-- or just zR at on bufenter
-- find a way to get the highest possible folds in a file and set it to it
o.foldclose = '' -- set to 'all' to close folds after cursor leaves
o.foldminlines = 1
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

----------------------------------------------Editor------------------------------------------------
go.cmdheight = 0
go.ruler = true
-- go.winbar = '%#bold# %{expand("%:.")}'
go.laststatus = 3 -- global statusline
go.statusline = ' '
go.cmdwinheight = 20
-- go.showcmd = true
go.showmode = false
-- go.ruler = false
-- opt_g.shortmess:append('')

-- display indentations
local icons = require('config.ui.icons')
o.list = true
opt.listchars = icons.listchars
opt.fillchars = icons.fillchars

----------------------------------------Editor User Interface---------------------------------------

-- go.winminheight = 1
-- go.winminwidth = 1

-- disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

go.scrolloff = 4
go.sidescroll = 1
go.sidescrolloff = 0
opt_g.wildignore:append { '*.o', '*~', '*.pyc' }
go.wildmenu = true

-- g.showmatch = true
-- g.match = 2
-- g.magic = true
go.timeoutlen = 300

-----------------------------------------------Behavior---------------------------------------------

-- to edit with no text in visual block mode
o.virtualedit = 'block'

-- show complete option popup
-- go.completeopt = 'menu,menuone,noselect,preview'

--------------------------------------------Indentation---------------------------------------------
-- indentation width
go.tabstop = 4 -- tab
o.tabstop = 4 -- tab

go.shiftwidth = 4 -- space
o.shiftwidth = 4 -- space

go.expandtab = false -- false to use tabs, true for spaces

go.autoindent = true -- copy indent from current line when starting new one
go.smartindent = true
go.smarttab = true

---------------------------------------------Wrapping-----------------------------------------------
o.wrap = false -- disable line wrapping
o.showbreak = icons.misc.showbreak -- prefix for wrapped lines
o.linebreak = true -- wrap lines only at certain characters (see :help breakat)
o.breakindent = true -- indent wraps
-- vim.cmd('set breakindentopt=shift:4')

-- opt.cpoptions:append('n') -- causes linewrap not to work with statuscolumn

opt.whichwrap:append('<,>,h,l') -- keys that wrap around line and go to next/prev line
opt.matchpairs:append { '<:>' }

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
o.incsearch = true
o.inccommand = 'split' -- show substitutes collected in a split

o.hidden = true
o.lazyredraw = false

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom
o.splitkeep = 'screen'
-- opt.switchbuf:append { 'useopen', 'vsplit' }

opt.iskeyword:remove { '-' } -- consider string-string and str_str not as whole word
opt.isfname:append('@-@') -- use @ for filename completion

-- when pressing "K" then do a vim command, pressing K on 'h statusline' will open the help page
-- go.keywordprg = ':help'
go.keywordprg = ':help'

go.swapfile = false
go.backup = false
o.undofile = true

go.updatetime = 2000 -- used for CursorHold

-----------------------------------------------Mouse------------------------------------------------

o.mouse = 'a'
o.mousemodel = 'popup_setpos'
-- o.mousemodel = 'extend'
-- o.selectmode = 'mouse'
o.selectmode = ''

-- No annoying sound on errors
go.errorbells = false
go.visualbell = false
go.compatible = false

-- stop auto comment for new lines
opt.formatoptions:remove { 'c', 'r', 'o' }

-- opt_g.path:append(NVIM_CONFIG_PATH)
opt_g.path:append('**')

-- opt.sessionoptions:remove { 'buffers', 'terminal', 'blank', 'folds' }
opt.sessionoptions:remove { 'terminal', 'blank', 'folds', 'help' }
opt.sessionoptions:append { 'winpos' }
