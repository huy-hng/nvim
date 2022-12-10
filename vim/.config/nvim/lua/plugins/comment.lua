local Comment = require('Comment')

local has_ft, ft = pcall(require, 'Comment.ft')
if not has_ft then return end



local comment_empty = {
	padding = true,
	sticky = true,
	ignore = nil,
}

local conf = {
	padding = true,
	sticky = false,
	ignore = '^$',
}

local extra_conf = {
	toggler = {
		line = 'gcc',
		block = 'gbc',
	},
	opleader = {
		line = 'gc',
		block = 'gb',
	},
	extra = {
		above = 'gcO',
		below = 'gco',
		eol = 'gcA',
	},
	mappings = {
		basic = false,
		extra = false,
	},
	pre_hook = nil,
	post_hook = nil,
}

Comment.setup(conf)
ft.set('vimwiki', '- %s')

local api = require('Comment.api')


local fn = require('core.wrappers').fn

-- map({ 'n', 'i' }, '<C-/>', api.locked('toggle.linewise.current'), 'Toggle Comment')

local ignore_empty = {
	padding = true,
	ignore = '^$',
}

local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

local toggle_comment = function()
	-- api.toggle.blockwise('v')
	-- api.toggle.linewise('V'j

	local mode = vim.fn.mode()
	if mode == 'n' or mode == 'i' then
		api.toggle.linewise.current(nil, comment_empty)
		return
	end

	vim.api.nvim_feedkeys(esc, 'nx', false)
	if mode == 'v' then
		-- api.locked('toggle.blockwise')(vim.fn.visualmode())
		api.locked('toggle.linewise')(vim.fn.visualmode())
	elseif mode == 'V' then
		api.locked('toggle.linewise')(vim.fn.visualmode())
		-- vim.api.nvim_command("lua require('Comment.api').toggle.linewise('V')")
		vim.api.nvim_feedkeys('gv', 'nt', false)
	elseif mode == '' then
		-- TODO: doesnt work
		-- api.toggle.linewise(vim.fn.visualmode(), ignore_empty)
		api.locked('toggle.blockwise')(vim.fn.visualmode())
	end
end

-- neovide bindings
-- if vim.g.neovide then
map({ 'n', 'i', 'v' }, '<C-/>', toggle_comment, 'Toggle Comment')
-- map({ 'n', 'i' }, '<C-/>', fn(api.toggle.linewise.current, nil, comment_empty), 'Toggle Comment')
map({ 'n', 'i' }, '<A-/>', api.insert.linewise.eol, 'Comment at end of line')
-- map({ 'n', 'i' }, '<A-/>a', api.insert.linewise.eol, 'Comment at end of line')

-- map({ 'n', 'i' }, '<A-/>o', api.insert.linewise.below, 'Comment next line')
-- map({ 'n', 'i' }, '<A-/>O', api.insert.linewise.above, 'Comment prev line')
-- else
-- 	map({ 'n', 'i', 'v' }, '<C-_>', toggle_comment, 'Toggle Comment')
-- 	map({ 'n', 'i' }, '<A-_>', api.insert.linewise.eol, 'Comment at end of line')
	-- map(
	-- 	{ 'n', 'i' },
	-- 	'<C-_>',
	-- 	fn(api.toggle.linewise.current, nil, comment_empty),
	-- 	'Toggle Comment'
	-- )
	-- 	-- terminal bindings
	-- 	map({ 'n', 'i' }, '<C-_>', fn(api.toggle.linewise.current, nil, comment_empty), 'Toggle Comment')
	-- 	map({ 'n', 'i' }, '<A-_>a', api.insert.linewise.eol, 'Comment at end of line')
	-- 	map({ 'n', 'i' }, '<A-_>', api.insert.linewise.eol, 'Comment at end of line')
	-- 	map({ 'n', 'i' }, '<A-_>o', api.insert.linewise.below, 'Comment next line')
	-- 	map({ 'n', 'i' }, '<A-_>O', api.insert.linewise.above, 'Comment prev line')
	-- 	vmap('<C-_>', toggle_visual, 'Toggle Comment')
-- end
