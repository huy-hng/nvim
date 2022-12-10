local has_luasnip, ls = pcall(require, 'luasnip')
if not has_luasnip then return end

-- this will expand the current item or jump to the next item within the snippet.
imap('<Tab>', function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	else
		Feedkeys('<Tab>')
	end
end)

-- this always moves to the previous item within the snippet
imap('<S-Tab>', function()
	if ls.jumpable(-1) then ls.jump(-1) end
end)

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
imap('<c-k>', function()
	if ls.choice_active() then ls.change_choice(1) end
end)
imap('<c-j>', function()
	if ls.choice_active() then ls.change_choice(1) end
end)

imap('<c-u>', require('luasnip.extras.select_choice'))

-- shorcut to source my luasnips file again, which will reload my snippets
-- nmap('<leader><leader>s', FN(R, 'plugins.snippets'))
