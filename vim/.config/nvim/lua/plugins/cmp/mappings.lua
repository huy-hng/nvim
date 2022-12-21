local status, cmp = pcall(require, 'cmp')
if not status then return end

local has_luasnip, ls = pcall(require, 'luasnip')
if not has_luasnip then return end

local function jump_or_select_item(fn, jumpdir)
	return function(_)
		-- vim.notify(ls.in_snippet())
		ls.unlink_current_if_deleted()
		if ls.in_snippet() and ls.jumpable(jumpdir) then
			ls.jump(jumpdir)
		elseif cmp.visible() then
			fn()
		else
			cmp.complete()
		end
	end
end

local function choice_node_or_select_item(fn)
	return function(_)
		if ls.choice_active() then
			ls.change_choice(1)
		elseif cmp.visible() then
			fn()
		else
			cmp.complete()
		end
	end
end

local function if_not_visible_feedkeys(fn, keys)
	return function(_)
		if cmp.visible() then
			fn()
		else
			Feedkeys(keys)
		end
	end
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
	['<C-c>'] = ls.unlink_current,

	-- navigation
	['<C-n>'] = cmp.mapping(choice_node_or_select_item(cmp.select_next_item), { 'i', 's' }),
	['<C-p>'] = cmp.mapping(choice_node_or_select_item(cmp.select_prev_item), { 'i', 's' }),

	['<C-j>'] = cmp.mapping {
		-- i = if_visible(cmp.select_next_item),
		i = jump_or_select_item(cmp.select_next_item, 1),
		s = jump_or_select_item(cmp.select_next_item, 1),
		-- i = next_item,
		-- s = next_item,
		c = if_not_visible_feedkeys(cmp.select_next_item, '<Down>'),
	},
	['<C-k>'] = cmp.mapping {
		-- i = if_visible(cmp.select_prev_item),
		i = jump_or_select_item(cmp.select_prev_item, -1),
		s = jump_or_select_item(cmp.select_prev_item, -1),
		-- i = prev_item,
		-- s = prev_item,
		c = if_not_visible_feedkeys(cmp.select_prev_item, '<Up>'),
	},
	-- ['<C-k>'] = cmp.mapping(if_visible(cmp.select_prev_item), { 'i', 'c' }),

	['<C-f>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior, count = 16 },
	['<C-b>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior, count = 16 },

	['<C-u>'] = cmp.mapping.scroll_docs(-8),
	['<C-d>'] = cmp.mapping.scroll_docs(8),

	-- accept / abort
	-- ['<C-c>'] = cmp.abort,
	['<C-e>'] = cmp.mapping {
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	},
	['<C-l>'] = cmp.mapping.confirm { select = true },

	-- open completion menu

	['<C-Space>'] = cmp.mapping(
		if_visible(cmp.mapping.confirm { select = true }),
		{ 'i', 's', 'c' }
	),

	-- remove bindings
	-- ['<C-p>'] = cmp.config.disable,
	-- ['<C-n>'] = cmp.config.disable,
	-- ['<C-y>'] = cmp.config.disable,
	['<Tab>'] = cmp.config.disable,
	['<S-Tab>'] = cmp.config.disable,
	-- ['<C-e>'] = cmp.config.disable,
}
