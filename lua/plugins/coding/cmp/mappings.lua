local cmp = require('cmp')

local ls = require('luasnip')

local function jump(jumpdir)
	return function(_)
		ls.unlink_current_if_deleted()
		if ls.locally_jumpable(jumpdir) then ls.jump(jumpdir) end
	end
end

local function confirm_or_jump_forward()
	return function(_)
		if ls.locally_jumpable(1) then
			ls.jump(1)
		elseif cmp.visible() then
			cmp.mapping.confirm { select = true }()
		end
	end
end

---@param direction number either 1 or -1
local function choice_node_or_select_item(fn, direction)
	return function(_)
		if ls.choice_active() then
			ls.change_choice(direction)
		elseif cmp.visible() then
			fn()
		else
			cmp.complete()
		end
	end
end

---@param direction number either 1 or -1
local function change_choice_or_feedkeys(direction, key)
	return function(_)
		if ls.choice_active() then
			ls.change_choice(direction)
		elseif key then
			nvim.feedkeys(key)
		end
	end
end

local function if_not_visible_feedkeys(fn, keys)
	return function(_)
		if cmp.visible() then
			fn()
		else
			nvim.feedkeys(keys)
		end
	end
end

local function if_visible(fn)
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

	[Keys.ctrl.h] = cmp.mapping(jump(-1), { 'i', 's' }),
	[Keys.ctrl.l] = cmp.mapping(confirm_or_jump_forward(), { 'i', 's', 'c' }),

	[Keys.alt.j] = cmp.mapping.scroll_docs(-8),
	[Keys.alt.k] = cmp.mapping.scroll_docs(8),

	[Keys.ctrl.j] = cmp.mapping {
		i = if_visible(cmp.select_next_item),
		s = if_visible(cmp.select_next_item),
		c = if_not_visible_feedkeys(cmp.select_next_item, '<Down>'),
	},
	[Keys.ctrl.k] = cmp.mapping {
		i = if_visible(cmp.select_prev_item),
		s = if_visible(cmp.select_prev_item),
		c = if_not_visible_feedkeys(cmp.select_prev_item, '<Up>'),
	},

	-- open completion menu
	['<C-Space>'] = cmp.mapping(
		if_visible(cmp.mapping.confirm { select = true }),
		{ 'i', 's', 'c' }
	),

	['<Tab>'] = cmp.mapping(change_choice_or_feedkeys(1, '<Tab>'), { 'i', 's' }),
	['<S-Tab>'] = cmp.mapping(change_choice_or_feedkeys(-1), { 'i', 's' }),
	-- ['<S-Tab>'] = cmp.config.disable,
}
