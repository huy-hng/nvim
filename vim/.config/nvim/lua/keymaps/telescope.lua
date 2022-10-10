local status, wk = pcall(require, 'which-key')
if not status then return end

wk.register({["<leader>f"] = { name = "+find" }})


local maps = require 'helpers.keymaps'
local nor = maps.nor

local telescope = require("telescope.builtin")

nor('<C-p>', telescope.find_files, 'Find Files')
nor('<leader>ff', telescope.find_files, 'Find Files')
nor('<leader>fo', telescope.oldfiles, 'Find Old Files')
nor('<leader>ft', '<cmd>Telescope<cr>', 'Telescope')

nor('<leader>fl', telescope.live_grep, 'Live Grep')
nor('<leader>fg', telescope.grep_string, 'Grep String')

nor('<leader>fb', telescope.buffers, 'Find Buffers')
nor('<leader>fh', telescope.help_tags, 'Find Help Tags')
nor('<leader>fk', telescope.keymaps, 'Find Keymaps')

-- 			\ 't': [':Telescope', 'Telescope'],
