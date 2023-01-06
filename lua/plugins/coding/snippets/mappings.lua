local has_luasnip, ls = pcall(require, 'luasnip')
if not has_luasnip then return end


-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
-- map({ 'i', 's' }, '<C-n>', function()
-- 	if ls.expand_or_jumpable() then
-- 		ls.expand_or_jump()
-- 	else
-- 		-- Feedkeys('<C-n>')
-- 	end
-- end)

-- -- <c-j> is my jump backwards key.
-- -- this always moves to the previous item within the snippet
-- map({ 'i', 's' }, '<C-p>', function()
-- 	if ls.jumpable(-1) then
-- 		ls.jump(-1)
-- 	else
-- 		-- Feedkeys('<C-p>')
-- 	end
-- end)

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
-- imap('<c-l>', function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	else
-- 		Feedkeys('<C-k>')
-- 	end
-- end)



-- shorcut to source my luasnips file again, which will reload my snippets
-- nmap('<leader><leader>s', FN(R, 'plugins.snippets'))

