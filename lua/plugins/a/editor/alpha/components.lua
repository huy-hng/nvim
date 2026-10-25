local M = {}

local utils = require('plugins.editor.alpha.utils')
local config = require('plugins.editor.alpha.config')

-- TODO: left, center and right align text
-- text({
-- 	left = 'some text',
-- 	center = {'middle', 'hl_group'}
-- 	right = { 'right text', {{"hl_group", 0, -1}}}
-- })
function M.text(txt, highlight, width, padding)
	if Util.nil_or_true(padding) then --
		txt = utils.pad_text(txt, width or config.width)
	end

	return {
		type = 'text',
		val = txt, -- "string" | { "array" } | function,
		opts = {
			position = 'center',
			hl = highlight,
			-- hl = "hl_group" | {{"hl_group", 0, -1}}
		},
	}
end

-- TODO:
function M.align_text(left, center, right, width, padding)
	if Util.nil_or_true(padding) then --
		left = utils.pad_text(left, width or config.width)
	end

	return {
		type = 'text',
		val = left, -- "string" | { "array" } | function,
		opts = {
			position = 'center',
			hl = '',
			-- hl = "hl_group" | {{"hl_group", 0, -1}}
		},
	}
end

--- @param name string
--- @param cmd string | function
--- @param right_text string
--- @param opts table?
function M.button(name, cmd, right_text, opts)
	opts = vim.tbl_extend('force', {
		position = 'center',
		shortcut = right_text,
		cursor = 0,
		width = config.width,
		align_shortcut = 'right',
		hl_shortcut = 'Keyword',
		-- hl = "hl_group" | {{"hl_group", 0, -1}}
	}, opts or {})

	local function on_press()
		if type(cmd) == 'function' then
			nvim.schedule(cmd)
			return
		end
		local key = vim.api.nvim_replace_termcodes(cmd, true, false, true)
		vim.api.nvim_feedkeys(key, 't', false)
	end

	return {
		type = 'button',
		-- the text to display
		val = name,
		on_press = on_press,
		opts = opts,
	}
end

-- TODO:

---@param left_text string
---@param right_text string
---@param lhs string
---@param rhs string | function
---@param opts table?
function M.left_right_text(left_text, right_text, lhs, rhs, opts)
	opts = vim.tbl_extend('force', {
		position = 'center',
		shortcut = right_text,
		cursor = 0,
		width = config.width,
		align_shortcut = 'right',
		hl_shortcut = 'Text',
		hl = 'Text',
		-- hl = "hl_group" | {{"hl_group", 0, -1}}
	}, opts or {})

	if rhs then
		local keybind_opts = { noremap = true, silent = true, nowait = true }
		opts.keymap = { 'n', lhs, rhs, keybind_opts }
	end

	local function on_press()
		if type(rhs) == 'function' then
			nvim.schedule(rhs)
			return
		end
		local key = vim.api.nvim_replace_termcodes(rhs, true, false, true)
		vim.api.nvim_feedkeys(key, 't', false)
	end

	return {
		type = 'button',
		val = left_text,
		on_press = on_press,
		opts = opts,
	}
end

--- @param txt string
--- @param lhs string
--- @param rhs string|function? optional
--- @param keybind_opts table? optional
--- @param button_opts table? optional
function M.keymap(txt, lhs, rhs, keybind_opts, button_opts)
	local opts = vim.tbl_extend('force', {
		position = 'center',
		shortcut = lhs,
		cursor = 0,
		width = config.width,
		align_shortcut = 'right',
		hl_shortcut = 'Keyword',
		-- hl = "hl_group" | {{"hl_group", 0, -1}}
	}, button_opts or {})

	if rhs then
		keybind_opts = keybind_opts or { noremap = true, silent = true, nowait = true }
		opts.keymap = { 'n', lhs, rhs, keybind_opts }
	end

	local function on_press()
		if type(rhs) == 'function' then
			nvim.schedule(rhs)
			return
		end
		local key = vim.api.nvim_replace_termcodes(rhs or lhs .. '<Ignore>', true, false, true)
		vim.api.nvim_feedkeys(key, 't', false)
	end

	return {
		type = 'button',
		-- the text to display
		val = txt,
		on_press = on_press,
		opts = opts,
	}
end

function M.padding(size) return { type = 'padding', val = size } end

function M.group_name(text) return M.text(text, 'Type', config.title_width) end

function M.group(vals, opts)
	if type(opts) == 'number' then --
		opts = { spacing = opts }
	end

	return {
		type = 'group',
		val = vals, -- {} | function -- table of elements
		opts = opts,
	}
end

function M.divider(text, width, hl)
	text = text or ''
	width = width or config.divider_width

	local half_divider = (width - #text) / 2

	local left_div = nvim.Repeat('-', math.floor(half_divider))
	local right_div = nvim.Repeat('-', math.ceil(half_divider))

	return {
		type = 'text',
		val = left_div .. text .. right_div,
		opts = {
			position = 'center',
			hl = hl or config.divider_hl,
		},
	}
end

return M
