local M = {}


function M.set_langmap()
	local langmaps = require('keymaps.layout_changer.langmaps')
	local translator = require('keymaps.layout_changer.key_translator').translate_keycode

	-- langmaps.langmap(langmaps.colemak, langmaps.word_nav_gap)
	local maps = langmaps.minimize(langmaps.colemak_lower, langmaps.custom)
	vim.opt.langmap = maps

	LangmapTranslator = function(lhs)
		return translator(lhs, langmaps.qwerty, langmaps.colemak, langmaps.word_nav_gap)
	end
end

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
	-- uppermap(Keys.w, 'w')
	uppermap(Keys.e, 'e')

	Map.unmap('', 'g%', { langmap = false })

	Map(Keys.h, 'h')
	Map(Keys.j, 'j')
	Map(Keys.k, 'k')
	Map(Keys.l, 'l')

	Map(Keys.u, 'u')
	Map(Keys.redo, '<C-r>')

	uppermap(Keys.r, 'r')
	uppermap(Keys.i, 'i')
	uppermap(Keys.a, 'a')

	uppermap(Keys.t, 't')
	uppermap(Keys.f, 'f')
end

return M
