local M = {}

local native = require('config.native_keymaps')

function M.set_langmap()
	local langmaps = require('keymaps.layout_changer.langmaps')
	local translator = require('keymaps.layout_changer.key_translator').translate_keycode

	-- langmaps.langmap(langmaps.colemak, langmaps.qwerty)
	-- langmaps.langmap(langmaps.colemak, langmaps.minimal_changes)
	
	langmaps.langmap(langmaps.colemak, langmaps.word_nav_gap)
	native.v = 's'
	native.file_explorer = '<C-r>'

	-- for i, from in ipairs(langmaps.colemak) do
	-- 	local to = langmaps.word_nav_gap[i]
	-- 	-- print(from, to)
	-- 	Map(from, to)
	-- end

	LangmapTranslator = function(lhs)
		return translator(lhs, langmaps.qwerty, langmaps.colemak, langmaps.word_nav_gap)
	end
end

function M.set_keymap()
	local langmaps = require('keymaps.layout_changer.langmaps')

	Map('QQ', '<cmd>qa!<cr>')
	Map('-', '$')

	local colemap = Map.create({ 'n', 'v', 'o' }, '', '[Colemak Remaps]', { langmap = false })

	-- colemap('<C-d>', '<C-v>', 'V-Block', { mode = { 'n', 'v' } })

	-- colemap('<C-d>', '<nop>', '', { mode = {'n', 'v'} })

	-- folding shortcuts
	colemap('<A-h>', Util.wrap(pcall, vim.cmd.foldclose))
	colemap('<A-l>', Util.wrap(pcall, vim.cmd.foldopen))

	colemap('gg', 'gg', 'Go to top of file')
	colemap('gs', 'gv', 'Switch to last VISUAL using last selection')
	colemap('gt', 'gf', 'Go to file under cursor')

	colemap('<C-u>', '<C-o>')
	colemap('<C-y>', '<C-i>')

	colemap('<leader>y', function() pcall(vim.api.nvim_exec, 'silent w', false) end, 'Write File')

	colemap('<leader>n', '<cmd>50message<cr>', 'Show Messages')

	-- needs langmap off for some reason
	-- colemap('ff', 'V', 'V-line', { langmap = false })
	-- Nmap('ee', 'V')
	-- Nmap('E', 'vg_')
	-- Vmap('E', 'V')

	colemap('<C-h>', '<C-r>', { langmap = false })
end

-- M.set_keymap()

return M
