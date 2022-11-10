local o = vim.o
local g = vim.g
local go = vim.go

-- vim.filetype.add({
-- 	plugin = true,
-- 	indent = true,
-- })

-- vim.opt.relativenumber = true

--==============================================================================
--                             |=> Appearance <=|
--==============================================================================
-- line numbers
o.relativenumber = true -- show relative line numbers
o.number = true -- shows absolute line number on cursor line (when relative number is on)

-- cursor line
o.cursorline = false -- highlight the current cursor line
o.cursorlineopt = 'line,number'

-- colors
-- o.background = "dark" -- colorschemes that can be light or dark will be made dark
o.termguicolors = true -- true color

-- gutter
o.signcolumn = "yes" -- show sign column so that text doesn't shift
o.numberwidth=4 -- set to something smaller to reduce gutter size

-- folding
-- go.foldlevelstart
o.foldcolumn = 'auto'
o.foldenable = false

o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    o.foldmethod = 'expr'
    o.foldexpr = 'nvim_treesitter#foldexpr()'
  end
})

-- editor
o.cmdheight = 0
o.ls = 1
o.ruler = true
go.winbar = '%f'
go.laststatus = 3

-- display indentations
o.list = true
-- o.lcs = 'tab:· ,trail:·,nbsp:+'
o.lcs = 'tab:│ ,trail:·,nbsp:+'
-- ['|', '¦', '┆', '┊']

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
o.cpoptions = o.cpoptions .. 'n'
o.whichwrap = 'b,s,<,>,h,l'

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
o.incsearch = true


o.hidden = true
o.lazyredraw = true

-- backspace
o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- g.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

-- o.iskeyword:append("-") -- consider string-string as whole word

o.undofile = true
o.mouse = 'a'
-- No annoying sound on errors
go.errorbells = false
go.visualbell = false
go.compatible = false

-- stop auto comment for new lines
o.formatoptions = 'tqj' -- should be optimally -=cro

--==============================================================================
--                       |=> Editor User Interface <=|
--==============================================================================

go.scrolloff = 8
go.sidescroll = 1
go.sidescrolloff = 8
vim.cmd('set wildignore=*.o,*~,*.pyc')
vim.cmd('set wildmenu')

-- g.showmatch = true
-- g.match = 2
-- g.magic = true
go.timeoutlen = 400
-- go.

