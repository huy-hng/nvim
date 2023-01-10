local M = {}

local utils = require('plugins.ui.alpha.utils')

function M.text(text, highlight, width)
	return {
		type = 'text',
		val = utils.pad_text(text, width),
		opts = {
			position = 'center',
			hl = highlight,
		},
	}
end

local leader = 'Space'

--- @param sc string
--- @param txt string
--- @param keybind string|function? optional
--- @param keybind_opts table? optional
function M.button(sc, txt, keybind, keybind_opts)
	local sc_ = sc:gsub('%s', ''):gsub(leader, '<leader>')

	local opts = {
		position = 'center',
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = 'right',
		hl_shortcut = 'Keyword',
	}
	if keybind then
		keybind_opts = keybind_opts or { noremap = true, silent = true, nowait = true }
		opts.keymap = { 'n', sc_, keybind, keybind_opts }
	end

	local function on_press()
		if type(keybind) == 'function' then
			nvim.schedule(keybind)
			return
		end
		local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. '<Ignore>', true, false, true)
		vim.api.nvim_feedkeys(key, 't', false)
	end

	return {
		type = 'button',
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

function M.padding(size) return { type = 'padding', val = size } end
function M.group(vals, spacing)
	return {
		type = 'group',
		val = vals,
		opts = { spacing = spacing },
	}
end

return M
