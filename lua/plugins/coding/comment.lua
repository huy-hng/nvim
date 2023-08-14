local M = {
	'numToStr/Comment.nvim',
	event = 'VeryLazy',
}

function M.config()
	local Comment = require('Comment')

	Comment.setup {
		padding = true,
		sticky = false,
		ignore = '^$',
		toggler = {
			line = '', -- gcc
			block = '', -- gbc
		},
		opleader = {
			line = '', -- gc
			block = '', -- gb
		},
		extra = {
			above = '', -- gcO
			below = '', -- gco
			eol = '', -- gcA
		},
		mappings = {
			basic = false,
			extra = false,
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

	local function toggle_current() api.toggle.linewise.current(nil, comment_empty) end

	local function locked(mode, blockwise)
		local cmd = 'toggle.' .. (blockwise and 'blockwise' or 'linewise')
		return function() api.locked(cmd)(mode) end
	end

	local mode_behavior = {
		i = toggle_current,
		n = toggle_current,
		v = locked('v'),
		V = locked('V'),
		[''] = locked('', true),
	}
	local toggle_comment = function()
		local mode = vim.fn.mode()
		nvim.feedkeys('<esc>', 'nx')
		mode_behavior[mode]()
	end

	Map.map(
		{ 'n', 'v', 'i' },
		Keys.ctrl.comment,
		vim.schedule_wrap(toggle_comment),
		'Toggle Comment'
	)
end

return M
