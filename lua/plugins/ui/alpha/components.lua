local M = {}

local utils = require('plugins.ui.alpha.utils')
local headers = require('plugins.ui.alpha.customization.headers')
local options = require('plugins.ui.alpha.options')

-- TODO: left, center and right align text
-- text({
-- 	left = 'some text',
-- 	center = {'middle', 'hl_group'}
-- 	right = { 'right text', {{"hl_group", 0, -1}}}
-- })
function M.text(txt, highlight, width)
	txt = utils.pad_text(txt, width or options.width)

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

function M.header() return M.text(utils.get_random_element(headers), 'Type') end

local fortune = require('alpha.fortune')
local ascii_art = require('plugins.ui.alpha.customization.ascii_art')

function M.footer()
	local footer_text = utils.get_random_element(ascii_art)

	for _, v in ipairs(fortune()) do
		table.insert(footer_text, v)
	end
	return M.text(footer_text, 'Comment')
end


function M.button2(txt, lhs, rhs, keybind_opts, button_opts)
end

--- @param txt string
--- @param lhs string
--- @param rhs string|function? optional
--- @param keybind_opts table? optional
--- @param button_opts table? optional
function M.button(txt, lhs, rhs, keybind_opts, button_opts)
	local opts = vim.tbl_extend('force', {
		position = 'center',
		shortcut = lhs,
		cursor = 0,
		width = options.width,
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

function M.group_name(text) return M.text(text, 'Type', options.title_width) end

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
	width = width or options.divider_width

	local half_divider = (width - #text) / 2

	local left_div = Repeat('-', math.floor(half_divider))
	local right_div = Repeat('-', math.ceil(half_divider))

	return {
		type = 'text',
		val = left_div .. text .. right_div,
		opts = {
			position = 'center',
			hl = hl or options.divider_hl,
		},
	}
end

return M
