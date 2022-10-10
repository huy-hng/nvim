local status, wk = pcall(require, 'which-key')
if not status then
	print(status, wk)
	return
end

local maps = require 'helpers.keymaps'
local map = maps.map
local nmap = maps.nmap
local nor = maps.nor
local vis = maps.vis
local vix = maps.vix
local ins = maps.ins

local wrappers = require 'helpers.wrappers'
local cmd = wrappers.cmd
local fn = wrappers.fn


wk.register({['<leader>b'] = {name = '+Buffers'}})

-- nor('<leader>bb', ':buffers<cr>:buffer<space>', 'Select')
nor('<leader>ba', cmd('%bd | e# | bd#'), 'Close all, except current')
-- nor('<leader>bd', cmd('Bclose | tabclose') .. 'gT', 'Close current')
nor('<leader>bf', cmd('Telescope buffers'), 'Fuzzy find')

----------------------------------------
--          -> BufferLine <-
----------------------------------------
local bufferline = require 'bufferline'

nor('<leader>bh', fn(bufferline.move, -1), 'Move Right')
nor('<leader>bl', fn(bufferline.move, 1), 'Move Right')
nor('<leader>bd', bufferline.close_buffer_with_pick, 'Pick')
-- nor('<leader>bd', bufferline.close_with_pick, 'Pick')


local absolute = true
nor('<A-1>', fn(bufferline.go_to_buffer,  1, absolute), 'Go to BufferLine')
nor('<A-2>', fn(bufferline.go_to_buffer,  2, absolute), '')
nor('<A-3>', fn(bufferline.go_to_buffer,  3, absolute), '')
nor('<A-4>', fn(bufferline.go_to_buffer,  4, absolute), '')
nor('<A-5>', fn(bufferline.go_to_buffer,  5, absolute), '')
nor('<A-6>', fn(bufferline.go_to_buffer,  6, absolute), '')
nor('<A-7>', fn(bufferline.go_to_buffer,  7, absolute), '')
nor('<A-8>', fn(bufferline.go_to_buffer,  8, absolute), '')
nor('<A-9>', fn(bufferline.go_to_buffer,  9, absolute), '')
nor('<A-0>', fn(bufferline.go_to_buffer, -1, absolute), '')


