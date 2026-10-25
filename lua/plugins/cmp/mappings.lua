local cmp = require('cmp')
local view = require('cmp.view')

local ls = require('luasnip')

local function if_visible(fn)
	return function(_)
		if cmp.visible() then
			fn()
		else
			cmp.complete()
		end
	end
end

local function complete_or_confirm()
	if cmp.visible() then
		cmp.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace }
	else
		cmp.complete()
	end
end

local function jump(jumpdir)
	return function(_)
		ls.unlink_current_if_deleted()
		if ls.locally_jumpable(jumpdir) then ls.jump(jumpdir) end
	end
end

---@param direction number either 1 or -1
local function change_choice(direction)
	return function(_)
		if ls.choice_active() then ls.change_choice(direction) end
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

return {
	['<C-c>'] = ls.unlink_current,

	-- [Keys.up] = cmp.mapping {
	-- 	i = if_visible(cmp.select_prev_item),
	-- 	s = if_visible(cmp.select_prev_item),
	-- 	c = cmp.config.disable,
	-- },

	-- [Keys.down] = cmp.mapping {
	-- 	i = if_visible(cmp.select_next_item),
	-- 	s = if_visible(cmp.select_next_item),
	-- 	c = cmp.config.disable,
	-- },

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

	[Keys.ctrl.m] = cmp.config.disable,
	[Keys.ctrl.l] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace },

	[Keys.alt.h] = cmp.mapping(jump(-1), { 'i', 's' }),
	[Keys.alt.l] = cmp.mapping(jump(1), { 'i', 's' }),

	[Keys.alt.j] = cmp.mapping(change_choice(1), { 'i', 's' }),
	[Keys.alt.k] = cmp.mapping(change_choice(-1), { 'i', 's' }),

	-- [Keys.alt.j] = cmp.mapping.scroll_docs(-8),
	-- [Keys.alt.k] = cmp.mapping.scroll_docs(8),

	['<C-g>'] = function()
		if cmp.visible_docs() then
			cmp.close_docs()
		else
			cmp.open_docs()
		end
	end,

	-- open completion menu
	-- ['<C-Space>'] = cmp.mapping(
	-- 	if_visible(cmp.mapping.confirm { select = true }),
	-- 	{ 'i', 's', 'c' }
	-- ),

	-- ['<S-Tab>'] = cmp.config.disable,
}
