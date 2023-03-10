---@diagnostic disable: cast-local-type
local opt = vim.opt
local o = vim.o
local go = vim.go
local wo = vim.wo
local g = vim.g
local opt_g = vim.opt_global

g.mapleader = ' '
g.maplocalleader = '\\'

----------------------------------------------Appearance--------------------------------------------
-- window transparency
o.winblend = 0
o.pumblend = 0

o.conceallevel = 2
o.concealcursor = 'c'

-- line numbers
go.relativenumber = true -- show relative line numbers
go.number = true -- shows absolute line number on cursor line
o.number = true

-- cursor line
o.cursorline = true -- highlight the current cursor line
o.cursorlineopt = 'number'
-- o.cursorlineopt = 'line,number'

-- colors
-- o.background = "dark" -- colorschemes that can be light or dark will be made dark
o.termguicolors = true -- true color

----------------------------------------------Gutter------------------------------------------------
-- opt_g.colorcolumn:append { 80 }
o.signcolumn = 'yes' -- show sign column so that text doesn't shift
o.numberwidth = 1 -- set to something smaller to reduce gutter size

-- folding
go.foldenable = true
o.foldlevelstart = 99 -- find a way to get the highest possible folds in a file and set it to it
-- or just zR at on bufenter
-- find a way to get the highest possible folds in a file and set it to it
go.foldcolumn = 'auto:1'
-- go.foldcolumn = '1'
o.foldclose = '' -- set to 'all' to close folds after cursor leaves
o.foldminlines = 1
o.foldmethod = 'expr'
o.foldexpr = 'nvim_treesitter#foldexpr()'

----------------------------------------------Editor------------------------------------------------
go.cmdheight = 0
go.ruler = true
-- go.winbar = '%#bold# %{expand("%:.")}'
go.laststatus = 3 -- global statusline
go.cmdwinheight = 20
-- go.showcmd = true
-- go.showmode = false
-- go.ruler = false
-- opt_g.shortmess:append('')

-- display indentations
o.list = true
-- o.listchars = 'tab:▏ ,trail:·,nbsp:+'
o.listchars = 'tab:  ,trail:·,nbsp:+'

-- |│¦┆┇┊┋▕▔▏
opt.fillchars:append {
	--     
	diff = ' ', -- ╱
	fold = '·', -- '-' or '-' what the fold text is  filled with
	foldopen = '', -- '┬' or '-',
	foldclose = '', --  '+',
	foldsep = ' ', --  '│' or '|',
	eob = ' ', -- End of buffer, to remove ~ from the side
	-- horiz = '─' or '-',
}

--==============================================================================
--                       |=> Editor User Interface <=|
--==============================================================================

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

--==============================================================================
--                              |=> Behavior <=|
--==============================================================================

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
go.wrap = false -- disable line wrapping
o.showbreak = '  > ' -- prefix for soft-wrapped lines
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
o.lazyredraw = false

-- backspace
-- o.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- g.clipboard:append("unnamedplus") -- use system clipboard as default registier

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

go.iskeyword = '@,48-57,_,192-255,-'
o.iskeyword = '@,48-57,_,192-255,-'
opt_g.iskeyword:append('-') -- consider string-string as whole word
-- opt.iskeyword:remove({'-', '_'}) -- consider string-string as whole word
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
o.mousemodel = 'extend'
o.selectmode = 'mouse'

-- No annoying sound on errors
go.errorbells = false
go.visualbell = false
go.compatible = false

-- stop auto comment for new lines
opt.formatoptions:remove { 'c', 'r', 'o' }

opt_g.path:append(NVIM_CONFIG_PATH)
opt_g.path:append('**')

opt.switchbuf:append { 'useopen', 'usetab', 'vsplit' }
opt.sessionoptions:remove { 'buffers', 'terminal', 'blank' }
opt.sessionoptions:remove { 'folds' }

--==============================================================================
--                          |=> Plugin Settings <=|
--==============================================================================

g.startuptime_event_width = 40
g.startuptime_tries = 10
g.startuptime_sourced = 0
g.startuptime_exe_args = { '--noplugin' }
g.startuptime_exe_args = {}

function FoldText()
	local v = vim.v
	local line = vim.fn.getline(v.foldstart)
	local line_num = v.foldend - v.foldstart

	-- remove tab indentations
	---@diagnostic disable-next-line: param-type-mismatch
	line = vim.fn.substitute(line, '	', '', 'g')
	line = vim.fn.substitute(line, '    ', '', 'g')

	local indent_level = vim.fn.indent(v.foldstart)
	local indent = vim.fn['repeat'](' ', indent_level)

	-- local sub = vim.fn.substitute(line, [[/*|*/|{{{\d\=]], '', 'g')
	return indent .. line .. ' ---- ' .. line_num .. ' lines folded '
end
vim.o.foldtext = 'v:lua.FoldText()'
