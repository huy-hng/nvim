local status, cmp = pcall(require, 'cmp')
if not status then
	return
end

local check_backspace = function()
	local col = vim.fn.col '.' - 1
	return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

local if_visible = function(fn)
	return function(_)
		if cmp.visible() then
			fn()
		else
			cmp.complete()
		end
	end
end

return {
	-- navigation
	['<C-n>'] = if_visible(cmp.select_next_item),
	['<C-p>'] = if_visible(cmp.select_prev_item),
	['<C-j>'] = cmp.mapping(if_visible(cmp.select_next_item), { 'i' }),
	['<C-k>'] = cmp.mapping(if_visible(cmp.select_prev_item), { 'i' }),

	-- ['A-d'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior, count = 4 },
	-- ['A-u'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior, count = 4 },

	['<C-u>'] = cmp.mapping.scroll_docs(-4),
	['<C-d>'] = cmp.mapping.scroll_docs(4),

	-- accept / abort
	['<C-c>'] = cmp.abort,
	['<C-l>'] = cmp.mapping.confirm { select = true },

	-- open completion menu
	['<C-Space>'] = if_visible(cmp.mapping.confirm { select = true }),

	-- remove bindings
	['<C-y>'] = cmp.config.disable,
	['<Tab>'] = cmp.config.disable,
	['<C-e>'] = cmp.config.disable,
}

-- ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- ["<tab>"] = cmp.mapping {
--   i = cmp.config.disable,
--   c = function(fallback)
--     fallback()
--   end,
-- },

-- Testing
-- ["<c-q>"] = cmp.mapping.confirm {
--	behavior = cmp.ConfirmBehavior.Replace,
--	select = true,
-- },

-- If you want tab completion :'(
--  First you have to just promise to read `:help ins-completion`.
--
-- ["<Tab>"] = function(fallback)
--   if cmp.visible() then
--     cmp.select_next_item()
--   else
--     fallback()
--   end
-- end,
-- ["<S-Tab>"] = function(fallback)
--   if cmp.visible() then
--     cmp.select_prev_item()
--   else
--     fallback()
--   end
-- end,

-- alternate tab and shift tab
-- ['<Tab>'] = cmp.mapping(function(fallback)
--	if cmp.visible() then
--		cmp.select_next_item()
--	elseif luasnip.expandable() then
--		luasnip.expand()
--	elseif luasnip.expand_or_jumpable() then
--		luasnip.expand_or_jump()
--	elseif check_backspace() then
--		fallback()
--	else
--		fallback()
--	end
-- end, {
--	'i',
--	's',
-- }),
-- ['<S-Tab>'] = cmp.mapping(function(fallback)
--	if cmp.visible() then
--		cmp.select_prev_item()
--	elseif luasnip.jumpable(-1) then
--		luasnip.jump(-1)
--	else
--		fallback()
--	end
-- end, {
--	'i',
--	's',
-- }),
