local M = {}

local function uppermap(lhs, rhs)
	Map(lhs, rhs)
	Map(string.upper(lhs), string.upper(rhs))
end

function M.set_keymap()
	Map('<C-d>', '', '', { mode = { 'n', 'v' } })

	Map('<C-u>', '<C-o>')
	Map('<C-y>', '<C-i>')

	-- local which_key = nrequire('which-key')
	-- if which_key then --
	-- 	local opts = { mode = 'n', auto = true }
	-- 	Map.n(Keys.g, { which_key.show, 'j', opts }, 'g')
	-- end

	-- Map(Keys.g, 'g', 'g', { remap = true })
	uppermap(Keys.g, 'g')
	Map(Keys.gg, 'gg', 'First line')
	Map(Keys.g .. '<C-a>', 'g<C-a>', 'Increment cumulatively')
	Map(Keys.g .. Keys.v, 'gv', 'Switch to VISUAL using last selection', { mode = 'n' })
	Map(Keys.g .. Keys.n, 'gn', 'Search forward and select')
	Map(Keys.g .. Keys.N, 'gN', 'Search backward and select')
	Map(Keys.g .. Keys.i, 'gi', 'Move to last insertion and INSERT')
	Map(Keys.g .. 'f', 'gf', 'Go to file under cursor')
	Map(Keys.g .. '%', 'g%', 'Cycle backwards through results')
	Map(Keys.g .. 'x', 'gx', 'Open the file under the cursor with system app')
	Map(Keys.g .. 'u', 'gu', 'Lower Case')
	Map(Keys.g .. 'U', 'gU', 'Upper Case')

	Map(Keys.gE, 'gE')
	Map(Keys.ge, 'ge')
	uppermap(Keys.b, 'b')
	uppermap(Keys.w, 'w')
	uppermap(Keys.e, 'e')

	-- bound by flash
	-- uppermap(Keys.t, 't')
	-- uppermap(Keys.f, 'f')

	Map(Keys.m, 'm')

	-- text objects
	Map.vo(Keys.i .. Keys.w, 'iw')
	Map.vo(Keys.i .. Keys.W, 'iW')
	Map.vo(Keys.a .. Keys.w, 'aw')
	Map.vo(Keys.a .. Keys.W, 'aW')

	Map.unmap('', 'g%')
	Map.unmap('', 'gx')
	Map.unmap('', 'gO')

	Map(Keys.g .. 'O', 'gO')

	local utils = require('core.statuscolumn.utils')
	local function open_fold()
		local lnum = vim.fn.line('.')
		if vim.fn.foldclosed(lnum) ~= -1 then --
			vim.cmd.foldopen()
		end
	end

	local function close_fold()
		local lnum = vim.fn.line('.')
		local cursor = vim.fn.getcurpos()
		if cursor[3] == 1 and vim.fn.foldclosed(lnum) == -1 and utils.is_foldline(lnum) then --
			vim.cmd.foldclose()
		end
	end

	Map(Keys.h, 'h')
	Map(Keys.j, 'j')
	Map(Keys.k, 'k')
	Map.v(Keys.K, 'K')
	Map(Keys.l, 'l', '', { callback = open_fold })

	uppermap(Keys.u, 'u')
	Map(Keys.redo, '<C-r>')

	Map(Keys.r, 'r')
	Map(Keys.s, 's')

	uppermap(Keys.i, 'i')
	-- uppermap(Keys.a, 'a')
end

-- R('config.native_keymaps')
-- M.set_keymap()

return M
