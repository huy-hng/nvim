local status, wk = pcall(require, 'which-key')
if not status then
	print(status, wk)
	return
end

local wrappers = require 'helpers.wrappers'
local cmd = wrappers.cmd
local fn = wrappers.fn


wk.register({['<leader>b'] = {name = '+Buffers'}})

-- nmap('<leader>bb', ':buffers<cr>:buffer<space>', 'Select')
nmap('<leader>ba', cmd('%bd | e# | bd#'), 'Close all, except current')
-- nmap('<leader>bd', cmd('Bclose | tabclose') .. 'gT', 'Close current')
nmap('<leader>bf', cmd('Telescope buffers'), 'Fuzzy find')

----------------------------------------
--          -> BufferLine <-
----------------------------------------
local bufferline = require 'bufferline'

nmap('<leader>bh', fn(bufferline.move, -1), 'Move Right')
nmap('<leader>bl', fn(bufferline.move, 1), 'Move Right')
nmap('<leader>bd', bufferline.close_buffer_with_pick, 'Pick')
-- nmap('<leader>bd', bufferline.close_with_pick, 'Pick')


local absolute = true
nmap('<A-1>', fn(bufferline.go_to_buffer,  1, absolute), 'Go to BufferLine')
nmap('<A-2>', fn(bufferline.go_to_buffer,  2, absolute), '')
nmap('<A-3>', fn(bufferline.go_to_buffer,  3, absolute), '')
nmap('<A-4>', fn(bufferline.go_to_buffer,  4, absolute), '')
nmap('<A-5>', fn(bufferline.go_to_buffer,  5, absolute), '')
nmap('<A-6>', fn(bufferline.go_to_buffer,  6, absolute), '')
nmap('<A-7>', fn(bufferline.go_to_buffer,  7, absolute), '')
nmap('<A-8>', fn(bufferline.go_to_buffer,  8, absolute), '')
nmap('<A-9>', fn(bufferline.go_to_buffer,  9, absolute), '')
nmap('<A-0>', fn(bufferline.go_to_buffer, -1, absolute), '')


