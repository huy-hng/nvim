local M = {
	'numToStr/Comment.nvim',
	event = 'VeryLazy',
}

function M.config()
	local Comment = require('Comment')

	Comment.setup {
		padding = true,
		sticky = true,
		ignore = '^$',
		mappings = {
			basic = false,
			extra = false,
		},
		toggler = {
			line = Keys.comment .. Keys.comment, -- gcc
			block = '', -- gbc
		},
		opleader = {
			line = Keys.comment, -- gc
			block = '', -- gb
		},
		extra = {
			above = '', -- gcO
			below = '', -- gco
			eol = '', -- gcA
		},
		pre_hook = nil,
		post_hook = nil,
	}

	local api = require('Comment.api')
	local extra = require('Comment.extra')
	local utils = require('Comment.utils')
	local ft = require('Comment.ft')
	-- NOTE: set commentstring in ./after/plugin/ft.lua

	-- ft.set('c', '//%s')

	local comment_empty = {
		padding = true,
		sticky = true,
		ignore = nil,
	}

	local function wrapper(fn, ...)
		local args = { ... }
		return function() fn(unpack(args)) end
	end

	-- stylua: ignore
	local mode_behavior = {
		i      = wrapper(api.toggle.linewise.current, nil, comment_empty),
		n      = wrapper(api.toggle.linewise.current, nil, comment_empty),
		v      = wrapper(api.toggle.linewise, 'V'),
		V      = wrapper(api.toggle.linewise, 'V'),
		[''] = wrapper(api.toggle.blockwise, ''),
	}
	local toggle_comment = function()
		local mode = vim.fn.mode()
		nvim.feedkeys('<esc>', 'nx')
		mode_behavior[mode]()
	end

	Map.nvi(Keys.comment, toggle_comment, 'Toggle Comment')

	Map.nv(Keys.comment_op, api.call('toggle.linewise', 'g@'), 'comment op', { expr = true })
	Map.o(Keys.comment_op, 'g@')
	Map.n(Keys.comment_op .. Keys.A, { extra.insert_eol, utils.ctype.linewise, comment_empty })
	Map.n(Keys.comment_op .. Keys.o, { extra.insert_below, utils.ctype.linewise, comment_empty })
	Map.n(Keys.comment_op .. Keys.O, { extra.insert_above, utils.ctype.linewise, comment_empty })
end

return M
