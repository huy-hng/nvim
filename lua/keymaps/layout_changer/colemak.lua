local M = {}

local function uppermap(lhs, rhs)
	Map(lhs, rhs)
	Map(string.upper(lhs), string.upper(rhs))
end

function M.set_keymap()
	-- Map('QQ', '<cmd>qa!<cr>')

	Map('q', 's')

	Map('<C-d>', '', '', { mode = { 'n', 'v' } })

	Map('<C-u>', '<C-o>')
	Map('<C-y>', '<C-i>')

	uppermap(Keys.g, 'g')
	Map(Keys.gg, 'gg', 'Go to top of file')
	Map(Keys.g .. '<C-a>', 'g<C-a>', 'Increment cumulatively')
	Map(Keys.g .. Keys.v, 'gv', 'Highlight last VISUAL', { mode = 'n' })

	Map(Keys.gE, 'gE')
	Map(Keys.ge, 'ge')
	uppermap(Keys.b, 'b')
	uppermap(Keys.w, 'w')
	uppermap(Keys.e, 'e')

	-- text objects
	Map.vo(Keys.i .. Keys.w, 'iw')
	Map.vo(Keys.i .. Keys.W, 'iW')
	Map.vo(Keys.a .. Keys.w, 'aw')
	Map.vo(Keys.a .. Keys.W, 'aW')

	Map.unmap('', 'g%')

	local utils = require('core.statuscolumn.utils')
	local function open_fold()
		local lnum = vim.fn.line('.')
		if vim.fn.foldclosed(lnum) ~= -1 and utils.is_foldline(lnum) then --
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
	Map(Keys.l, 'l', '', { callback = open_fold })

	Map(Keys.u, 'u')
	Map(Keys.redo, '<C-r>')

	uppermap(Keys.r, 'r')
	uppermap(Keys.i, 'i')
	-- uppermap(Keys.a, 'a')

	-- bound by quickscope
	-- uppermap(Keys.t, 't')
	-- uppermap(Keys.f, 'f')
end

return M
