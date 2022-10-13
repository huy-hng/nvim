local status, wk = pcall(require, 'which-key')
if not status then return end

wk.register({["<leader>f"] = { name = "+find" }})

local telescope = require("telescope.builtin")

nmap('<C-p>', telescope.find_files, 'Find Files')
nmap('<leader>ff', telescope.find_files, 'Find Files')
nmap('<leader>fo', telescope.oldfiles, 'Find Old Files')
nmap('<leader>ft', '<cmd>Telescope<cr>', 'Telescope')

nmap('<leader>fl', telescope.live_grep, 'Live Grep')
nmap('<leader>fg', telescope.grep_string, 'Grep String')

nmap('<leader>fb', telescope.buffers, 'Find Buffers')
nmap('<leader>fh', telescope.help_tags, 'Find Help Tags')
nmap('<leader>fk', telescope.keymaps, 'Find Keymaps')

