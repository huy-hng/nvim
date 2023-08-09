local M = {
	'booperlv/nvim-gomove',
	event = 'VeryLazy',
}

---@alias direction
---| 'Left'
---| 'Down'
---| 'Up'
---| 'Right'

---@param dir direction
local function visual_move(dir)
	local lookup = {
		v = '<Plug>GoVMLine' .. dir,
		V = '<Plug>GoVMLine' .. dir,
		[''] = '<Plug>GoVMBlock' .. dir,
	}
	return function()
		nvim.feedkeys('<esc>')
		vim.schedule(function()
			print(vim.fn.visualmode())
			print(lookup[vim.fn.visualmode()])
			nvim.feedkeys(lookup[vim.fn.visualmode()])
		end)
		-- return lookup[vim.fn.visualmode()]
	end
end
local function smart()
	-- vertical move
	local nmap = Map.create('n', '', '', { expr = true, remap = true })
	local vmap = Map.create('v', '', '', { expr = true })

	Map.n(Keys.alt.j, '<Plug>GoNSMDown', 'Move Line down')
	Map.n(Keys.alt.k, '<Plug>GoNSMUp', 'Move Line up')

	vmap(Keys.alt.j, visual_move('Down'))
	vmap(Keys.alt.k, visual_move('Up'))

	-- vertical duplicate
	Map.n(Keys.alt.J, '<Plug>GoNSDDown')
	Map.n(Keys.alt.K, '<Plug>GoNSDUp')

	Map.v(Keys.alt.J, '<Plug>GoVSDDown')
	Map.v(Keys.alt.K, '<Plug>GoVSDUp')

	-- horizontal move
	-- Map.n(Keys.alt.h, '<Plug>GoNSMLeft')
	-- Map.n(Keys.alt.l, '<Plug>GoNSMRight')

	-- Map.v(Keys.alt.h, '<Plug>GoVSMLeft')
	-- Map.v(Keys.alt.l, '<Plug>GoVSMRight')

	-- -- horizontal duplicate
	-- Map.n(Keys.alt.H, '<Plug>GoNSDLeft')
	-- Map.n(Keys.alt.L, '<Plug>GoNSDRight')

	-- Map.v(Keys.alt.H, '<Plug>GoVSDLeft')
	-- Map.v(Keys.alt.L, '<Plug>GoVSDRight')
end

local function dumb()
	-- vertical move
	Map.n(Keys.alt.j, '<Plug>GoNMLineDown', 'Move Line down')
	Map.n(Keys.alt.k, '<Plug>GoNMLineUp', 'Move Line up')

	Map.v(Keys.alt.j, '<Plug>GoVMLineDown')
	Map.v(Keys.alt.k, '<Plug>GoVMLineUp')

	-- vertical duplicate
	Map.n(Keys.alt.J, '<Plug>GoNDLineDown')
	Map.n(Keys.alt.K, '<Plug>GoNDLineUp')

	-- vertical duplicate
	Map.n(Keys.alt.J, '<Plug>GoNDLineDown')
	Map.n(Keys.alt.K, '<Plug>GoNDLineUp')

	Map.v(Keys.alt.J, '<Plug>GoVDLineDown')
	Map.v(Keys.alt.K, '<Plug>GoVDLineUp')
end

function M.config()
	require('gomove').setup {
		map_defaults = false, -- whether or not to map default key bindings, (true/false)
		reindent = true,
		undojoin = true, -- whether or not to undojoin same direction moves
		move_past_end_col = true, -- whether to not to move past end column when moving blocks horizontally
	}
	dumb()
end

return M
