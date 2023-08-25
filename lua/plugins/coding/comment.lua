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
			line = Keys.ctrl.comment .. Keys.ctrl.comment, -- gcc
			block = Keys.alt.comment .. Keys.alt.comment, -- gbc
		},
		opleader = {
			line = Keys.ctrl.comment, -- gc
			block = Keys.alt.comment, -- gb
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
	local ft = require('Comment.ft')
	-- ft.set('vimwiki', '- %s')

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

	Map.nvi(Keys.ctrl.comment, toggle_comment, 'Toggle Comment')

	Map.nv(Keys.ctrl.o, api.call('toggle.linewise', 'g@'), 'comment op', { expr = true })
	Map.o(Keys.ctrl.o, 'g@')
end

return M
