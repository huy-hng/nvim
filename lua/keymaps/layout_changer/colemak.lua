local M = {}

-- local native = require('config.native_keymaps')

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

function M.set_keymap()
	local langmaps = require('keymaps.layout_changer.langmaps')

	Map('QQ', '<cmd>qa!<cr>')

	Map('q', 's')
	-- Map('s', 'ge', 'Move back (opposite of e)')
	-- Map('S', 'gE', 'Move back (opposite of e)')

	local colemap = Map.create(
		{ 'n', 'v', 'o' },
		'',
		'[Colemak Remaps]',
		{ nowait = true, langmap = false }
	)
	-- colemap('<C-d>', '<C-v>', 'V-Block', { mode = { 'n', 'v' } })
	colemap('<C-d>', '', '', { mode = { 'n', 'v' } })

	-- folding shortcuts
	colemap('<A-h>', Util.wrap(pcall, vim.cmd.foldclose))
	colemap('<A-l>', Util.wrap(pcall, vim.cmd.foldopen))

	-- colemap('gg', 'gg', 'Go to top of file')
	-- colemap('gs', 'gv', 'Switch to last VISUAL using last selection')
	-- colemap('gt', 'gf', 'Go to file under cursor')

	colemap('<C-u>', '<C-o>')
	colemap('<C-y>', '<C-i>')

	colemap('<leader>f', { pcall, vim.api.nvim_exec, 'silent w', false }, 'Write File')
	-- colemap('<leader>l', '<cmd>50message<cr>', 'Show Messages')

	local function upper_map(lhs, rhs)
		colemap(lhs, rhs)
		colemap(string.upper(lhs), string.upper(rhs))
	end

	colemap('<C-h>', '<C-r>')

	colemap('a', 'ge')
	colemap('A', 'gE')

	upper_map('r', 'b')
	-- upper_map('s', 'v')
	-- upper_map('t', 'w')

	colemap('g', '')
	Map.n('g', 'e', '', { nowait = true })
	-- colemap('g', 'e', { nowait = false })
	-- upper_map('g', 'e')

	colemap('m', 'h')
	colemap('n', 'j')
	upper_map('e', 'k')
	colemap('i', 'l')

	colemap('h', 'u')
	upper_map('u', 'i')
	upper_map('y', 'a')
	-- upper_map('j', 'g')

	upper_map('l', 'n')
	-- upper_map('k', 't')
	-- upper_map('b', 'f')
end

-- M.set_keymap()
-- Map('<C-h>', '<C-r>', { nowait = true, langmap = false })

return M
