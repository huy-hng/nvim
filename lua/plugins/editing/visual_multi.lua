local M = {
	'mg979/vim-visual-multi',
	branch = 'master',
	keys = { Keys.ctrl.n },
	event = 'VeryLazy',
	-- lazy = false,
}

local g = vim.g

g.VM_default_mappings = 1 -- set to 0 to disable default mappings
g.VM_mouse_mappings = 0 -- set to 1 to enable mouse mappings
g.VM_maps = {
	-- ['Find Word'] = '<C-l>',
	['Find Under'] = Keys.ctrl.n,
	['Find Subword Under'] = Keys.ctrl.n,
	-- ['Goto Next'] = '<C-n>',
	-- ['Goto Prev'] = '<C-p>',
}

g.VM_leader = { default = [[\\]], visual = [[\\]], buffer = [[\\]] }

-- see h vm-mappings for more information
-- also h visual-multi is pretty interesting

-- Find Next               n         find next occurrence
-- Find Prev               N         find previous occurrence
-- Goto Next               ]         go to next selected region
-- Goto Prev               [         go to previous selected region
-- Seek Next             <C-f>       fast go to next (from next page)
-- Seek Prev             <C-b>       fast go to previous (from previous page)
-- Skip Region             q         skip and find to next
-- Remove Region           Q         remove region under cursor
-- Slash Search            g/        extend/move cursors with /
-- Replace                 R         replace in regions, or start replace mode
-- Toggle Multiline        M         see |vm-multiline-mode|

-- Surround                S         requires |vim-surround| plugin
-- Move Right          <M-S-Right>   move all selections to the right
-- Move Left           <M-S-Left>    ,,      ,,          to the left

return M
