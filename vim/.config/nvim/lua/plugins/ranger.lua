local g = vim.g

local float2nr = vim.fn.float2nr
local round = vim.fn.round
local o = vim.o

-- Make Ranger replace Netrw and be the file explorer
g.rnvimr_enable_ex = 1

-- Make Ranger to be hidden after picking a file
g.rnvimr_enable_ex = 1
g.rnvimr_enable_picker = 1
g.rnvimr_draw_border = 0
g.rnvimr_border_attr = { fg = 1, bg = -1 }
g.rnvimr_shadow_winblend = 50
-- g.rnvimr_ranger_cmd = ['ranger', '--cmd=set draw_borders both']
-- highlight link RnvimrNormal CursorLine

g.rnvimr_action = {
	['<C-t>'] = 'NvimEdit tabedit',
	['<C-_>'] = 'NvimEdit split',
	['<C-|>'] = 'NvimEdit vsplit',
	gw = 'JumpNvimCwd',
	yw = 'EmitRangerCwd',
}

g.rnvimr_ranger_views = {
	{ minwidth = 90, ratio = {} },
	{ minwidth = 50, maxwidth = 89, ratio = { 1, 1 } },
	{ maxwidth = 49, ratio = { 1 } },
}

-- Initial layout
g.rnvimr_layout = {
	relative = 'editor',
	width = float2nr(round(0.7 * o.columns)),
	height = float2nr(round(0.7 * o.lines)),
	col = float2nr(round(0.15 * o.columns)),
	row = float2nr(round(0.15 * o.lines)),
	style = 'minimal',
}

-- g.rnvimr_presets = {
-- 	{},
-- 	{ width = 30, height = 1.0, col = 0, row = 0 },
-- 	{ width = 30, height = 1.0, col = 1.0, row = 0 },
-- 	{ width = 1.0, height = 0.5, col = 0, row = 0.5 },
-- 	{ width = 1.0, height = 1.0 },
-- }

vim.cmd([[
let g:rnvimr_presets = [
            \ {},
            \ {'width': 30, 'height': 1.0, 'col': 0, 'row': 0},
            \ {'width': 30, 'height': 1.0, 'col': 1.0, 'row': 0},
            \ {'width': 1.0, 'height': 0.5, 'col': 0, 'row': 0.5},
            \ {'width': 1.0, 'height': 1.0},
            \ ]
]])
