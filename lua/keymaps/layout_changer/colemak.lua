local M = {}

local native = require('config.native_keymaps')

function M.set_langmap()
	local langmaps = require('keymaps.layout_changer.langmaps')
	local translator = require('keymaps.layout_changer.key_translator').translate_keycode

	langmaps.langmap(langmaps.colemak, langmaps.custom_mappings)
	-- native.K = '<C-,>' -- same comma location as qwerty, basically right below qwerty K
	-- native.J = '<C-m>' -- keep column when joining lines
	native.v = 'e'
	-- native['<C-d>'] = '<C-n>'
	-- native['<C-u>'] = '<C-e>'
	native.file_explorer = '<C-r>'

	LangmapTranslator = function(lhs) return translator(lhs, langmaps.qwerty, langmaps.colemak) end
end

function M.set_keymap()
	local colemap = MapCreator('n', '', '[Colemak Remaps]', { langmap = false })

	-- folding shortcuts
	colemap('<A-h>', Util.wrap(pcall, vim.cmd.foldclose))
	colemap('<A-l>', Util.wrap(pcall, vim.cmd.foldopen))

	colemap('~', 'ge', 'Move back (opposite of e)')
	colemap('|', 'gE', 'Move back (opposite of E)')
	colemap('gf', 'gv', 'Switch to last VISUAL using last selection')
	colemap('gt', 'gf', 'Go to file under cursor')
	-- Omap('e', 'v')

	colemap('<C-u>', '<C-o>')
	colemap('<C-y>', '<C-i>')

	colemap(';', '~')

	colemap(
		'<leader>v',
		function() pcall(vim.api.nvim_exec, 'silent w', false) end,
		'Write File',
		{ langmap = false }
	)
	-- vim.keymap.set('n', '<leader>o', ':w<cr>')
	-- Nmap('<leader>l', '<cmd>50message<cr>', 'Show Messages')

	-- needs langmap off for some reason
	colemap('ff', 'V', 'V-line', { langmap = false })
	-- Nmap('ee', 'V')
	-- Nmap('E', 'vg_')
	-- Vmap('E', 'V')

	colemap('<C-l>', '<C-r>', { langmap = false })
end

M.set_keymap()

return M
