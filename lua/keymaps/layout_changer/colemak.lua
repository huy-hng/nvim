local M = {}

local native = require('config.native_keymaps')

function M.set_langmap()
	local langmaps = require('keymaps.layout_changer.langmaps')
	local translator = require('keymaps.layout_changer.key_translator').translate_keycode

	langmaps.langmap(langmaps.colemak, langmaps.minimal_changes)
	-- native.K = '<C-,>' -- same comma location as qwerty, basically right below qwerty K
	-- native.J = '<C-m>' -- keep column when joining lines
	native.v = 'd'
	-- native['<C-d>'] = '<C-j>'
	-- native['<C-u>'] = '<C-k>'
	native.file_explorer = '<C-r>'

	LangmapTranslator = function(lhs) return translator(lhs, langmaps.qwerty, langmaps.colemak) end
end

function M.set_keymap()
	local colemap = Map.create('n', '', '[Colemak Remaps]', { langmap = false })

	colemap('<C-d>', '<C-v>', 'V-Block', { mode = { 'n', 'v' } })

	-- colemap('<C-d>', '<nop>', '', { mode = {'n', 'v'} })

	colemap('-', '$')

	-- folding shortcuts
	colemap('<A-h>', Util.wrap(pcall, vim.cmd.foldclose))
	colemap('<A-l>', Util.wrap(pcall, vim.cmd.foldopen))

	colemap('q', 'ge', 'Move back (opposite of e)')
	colemap('Q', 'gE', 'Move back (opposite of e)')

	colemap('gt', 'gv', 'Switch to last VISUAL using last selection')
	-- colemap('gt', 'gf', 'Go to file under cursor')

	colemap('<C-u>', '<C-o>')
	colemap('<C-y>', '<C-i>')

	colemap(';', '~', { mode = { 'n', 'v' } })

	-- colemap(
	-- 	'<leader>v',
	-- 	function() pcall(vim.api.nvim_exec, 'silent w', false) end,
	-- 	'Write File',
	-- 	{ langmap = false }
	-- )

	colemap('<leader>N', '<cmd>50message<cr>', 'Show Messages')

	-- needs langmap off for some reason
	-- colemap('ff', 'V', 'V-line', { langmap = false })
	-- Nmap('ee', 'V')
	-- Nmap('E', 'vg_')
	-- Vmap('E', 'V')

	colemap('<C-h>', '<C-r>', { langmap = false })
end

-- M.set_keymap()

return M
