local M = {}
local api = vim.api
local o = vim.opt
local statusline = require('nifoc.statusline')
local gitsigns = require('gitsigns')
local function has_linenum() return ((o.number):get() or (o.relativenumber):get()) end
local function set_linenum()
	local num = (o.number):get()
	local relnum = (o.relativenumber):get()
	if num and not relnum then
		return '%l'
	elseif relnum and not num then
		return '%r'
	else
		return '%{v:relnum?v:relnum:v:lnum}'
	end
end

M['line-number'] = { condition = has_linenum, statusline['push-right'], { provider = set_linenum } }
M.signs = { provider = '%s', hl = { bold = true } }

local function gitsigns_enabled() return (vim.b.nifoc_gitsigns_enabled == 1) end

local function get_sign(self)
	local bufnr = api.nvim_get_current_buf()
	local lnum = vim.v.lnum
	local sign
	do
		local signs = vim.fn.sign_getplaced(
			bufnr,
			{ group = 'gitsigns_vimfn_signs_', id = lnum, lnum = lnum }
		)
		if nil ~= signs then signs = (signs)[1] end
		if nil ~= signs then signs = (signs).signs end
		if nil ~= signs then signs = (signs)[1] end
		sign = signs
	end
	self.sign = sign
	self.has_sign = (sign ~= nil)
	return nil
end

local function get_sign_hl(sign)
	if sign.has_sign then
		return sign.sign.name
	else
		return 'StatusLineNC'
	end
end

local function _12_(self)
	local mouse = vim.fn.getmousepos()
	local cursor_pos = { mouse.line, 0 }
	api.nvim_win_set_cursor(mouse.winid, cursor_pos)
	local function _13_() return gitsigns.blame_line { full = true } end
	return vim.defer_fn(_13_, 100)
end

M.gitsigns = {
	condition = gitsigns_enabled,
	init = get_sign,
	provider = ' \226\150\143',
	hl = get_sign_hl,
	on_click = { name = 'heirline_statuscolumn_gitsigns', callback = _12_ },
}

local function get_linenum()
	return ((vim.b.nifoc_gitsigns_enabled ~= 1) and ((o.number):get() or (o.relativenumber):get()))
end

M['gitsigns-or-bar'] =
	{ { condition = get_linenum, provider = ' \226\150\143', hl = 'StatusLineNC' }, M.gitsigns }

local function has_diagnostics()
	return ((vim.b.nifoc_diagnostics_enabled == 1) and (#vim.diagnostic.get(0) > 0))
end

local function _16_(self)
	local bufnr = api.nvim_get_current_buf()
	local lnum = vim.v.lnum
	local signs
	do
		local signs = vim.fn.sign_getplaced(bufnr, { group = '*', lnum = lnum })
		if nil ~= signs then signs = (signs)[1] end
		if nil ~= signs then signs = (signs).signs end
		signs = signs
	end
	local diagnostic_signs
	local function _20_(_241) return vim.startswith(_241.group, 'vim.diagnostic') end
	diagnostic_signs = vim.tbl_filter(_20_, signs)
	local sign
	do
		local t_21_ = diagnostic_signs
		if nil ~= t_21_ then
			t_21_ = (t_21_)[1]
		else
		end
		sign = t_21_
	end
	self.bufnr = bufnr
	self.sign = sign
	self.has_sign = (sign ~= nil)
	return nil
end

local function get_sign_text(sign)
	if sign.has_sign then
		return (sign['sign-text'])[sign.sign.name]
	else
		return '  '
	end
end

local function get_sign_text_or_nil(sign)
	if sign.has_sign then
		return sign.sign.name
	else
		return nil
	end
end

local function _27_(self)
	local mouse = vim.fn.getmousepos()
	local line = (mouse.line - 1)
	local cursor_pos = { mouse.line, 0 }
	api.nvim_win_set_cursor(mouse.winid, cursor_pos)
	local function _28_()
		return vim.diagnostic.open_float { bufnr = self.bufnr, pos = line, scope = 'line' }
	end
	return vim.defer_fn(_28_, 100)
end

M['diagnostic-signs'] = {
	condition = has_diagnostics,
	static = {
		['sign-text'] = {
			DiagnosticSignError = '\239\129\151 ',
			DiagnosticSignWarn = '\239\129\170 ',
			DiagnosticSignInfo = '\239\129\154 ',
			DiagnosticSignHint = '\239\129\153 ',
		},
	},
	init = _16_,
	provider = get_sign_text,
	hl = get_sign_text_or_nil,
	on_click = { name = 'heirline_statuscolumn_diagnostic', callback = _27_ },
}

return M
