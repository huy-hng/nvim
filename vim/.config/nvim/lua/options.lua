---@diagnostic disable: cast-local-type
local opt = vim.opt
local o = vim.o
local go = vim.go
local wo = vim.wo
local g = vim.g
local opt_g = vim.opt_global

g.mapleader = ' '
g.maplocalleader = '\\'

--==============================================================================
--                             |=> Appearance <=|
--==============================================================================
-- window transparency
o.winblend = 10
o.pumblend = 10

-- line numbers
go.relativenumber = false -- show relative line numbers
go.number = true -- shows absolute line number on cursor line (when relative number is on)

-- cursor line
o.cursorline = true -- highlight the current cursor line
o.cursorlineopt = 'number'
-- o.cursorlineopt = 'line,number'

-- colors
-- o.background = "dark" -- colorschemes that can be light or dark will be made dark
o.termguicolors = true -- true color

----------------------------------------------Gutter------------------------------------------------
-- o.colorcolumn = '81,101'
o.colorcolumn = ''
o.signcolumn = 'yes' -- show sign column so that text doesn't shift
o.numberwidth = 1 -- set to something smaller to reduce gutter size

-- folding
go.foldenable = true
o.foldlevelstart = 99 -- find a way to get the highest possible folds in a file and set it to it
					  -- or just zR at on bufenter
 -- find a way to get the highest possible folds in a file and set it to it
go.foldcolumn = 'auto:4'
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
go.showcmd = false
go.showmode = false
go.ruler = false
-- print(vim.v.echospace)
-- print(vim.v.scrollstart)
-- opt_g.shortmess:append('')

-- display indentations
o.list = true
o.listchars = 'tab:▏ ,trail:·,nbsp:+'

-- |│¦┆┇┊┋▕▔▏
opt.fillchars:append {
	--     
	fold = '·', -- '-' or '-' what the fold text is  filled with
	foldopen = '', -- '┬' or '-',
	foldclose = '', --  '+',
	foldsep = ' ', --  '│' or '|',
	eob = ' ' -- End of buffer, to remove ~ from the side
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

-- to edit with no text in visual block mode
o.virtualedit = 'block'

-- show complete option popup
-- go.completeopt = 'menu,menuone,noselect,preview'

--------------------------------------------Indentation---------------------------------------------
-- indentation width
go.tabstop = 4 -- tab
go.shiftwidth = 4 -- space

go.expandtab = false -- false to use tabs, true for spaces

go.autoindent = true -- copy indent from current line when starting new one
go.smartindent = true
go.smarttab = true

---------------------------------------------Wrapping-----------------------------------------------
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
o.lazyredraw = false

-- backspace
-- o.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- g.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word
go.swapfile = false
o.undofile = true

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
opt.sessionoptions:remove {'buffers', 'terminal', 'blank'}

--==============================================================================
--                          |=> Plugin Settings <=|
--==============================================================================

g.startuptime_event_width = 40
g.startuptime_tries = 10
g.startuptime_sourced = 1
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
