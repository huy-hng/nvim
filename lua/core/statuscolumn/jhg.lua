local mod = {}
local api = vim.api
local o = vim.opt
local statusline = require('nifoc.statusline')
local gitsigns = require('gitsigns')
local function _1_() return ((o.number):get() or (o.relativenumber):get()) end
local function _2_()
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
mod['line-number'] = { condition = _1_, statusline['push-right'], { provider = _2_ } }
mod.signs = { provider = '%s', hl = { bold = true } }
local function _4_() return (vim.b.nifoc_gitsigns_enabled == 1) end
local function _5_(self)
	local bufnr = api.nvim_get_current_buf()
	local lnum = vim.v.lnum
	local sign
	do
		local t_6_ = vim.fn.sign_getplaced(
			bufnr,
			{ group = 'gitsigns_vimfn_signs_', id = lnum, lnum = lnum }
		)
		if nil ~= t_6_ then
			t_6_ = (t_6_)[1]
		else
		end
		if nil ~= t_6_ then
			t_6_ = (t_6_).signs
		else
		end
		if nil ~= t_6_ then
			t_6_ = (t_6_)[1]
		else
		end
		sign = t_6_
	end
	self.sign = sign
	self.has_sign = (sign ~= nil)
	return nil
end
local function _10_(_241)
	if _241.has_sign then
		return _241.sign.name
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
mod.gitsigns = {
	condition = _4_,
	init = _5_,
	provider = ' \226\150\143',
	hl = _10_,
	on_click = { name = 'heirline_statuscolumn_gitsigns', callback = _12_ },
}
local function _14_()
	return ((vim.b.nifoc_gitsigns_enabled ~= 1) and ((o.number):get() or (o.relativenumber):get()))
end
mod['gitsigns-or-bar'] =
	{ { condition = _14_, provider = ' \226\150\143', hl = 'StatusLineNC' }, mod.gitsigns }
local function _15_()
	return ((vim.b.nifoc_diagnostics_enabled == 1) and (#vim.diagnostic.get(0) > 0))
end
local function _16_(self)
	local bufnr = api.nvim_get_current_buf()
	local lnum = vim.v.lnum
	local signs
	do
		local t_17_ = vim.fn.sign_getplaced(bufnr, { group = '*', lnum = lnum })
		if nil ~= t_17_ then
			t_17_ = (t_17_)[1]
		else
		end
		if nil ~= t_17_ then
			t_17_ = (t_17_).signs
		else
		end
		signs = t_17_
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
local function _23_(_241)
	if _241.has_sign then
		return (_241['sign-text'])[_241.sign.name]
	else
		return '  '
	end
end
local function _25_(_241)
	if _241.has_sign then
		return _241.sign.name
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
mod['diagnostic-signs'] = {
	condition = _15_,
	static = {
		['sign-text'] = {
			DiagnosticSignError = '\239\129\151 ',
			DiagnosticSignWarn = '\239\129\170 ',
			DiagnosticSignInfo = '\239\129\154 ',
			DiagnosticSignHint = '\239\129\153 ',
		},
	},
	init = _16_,
	provider = _23_,
	hl = _25_,
	on_click = { name = 'heirline_statuscolumn_diagnostic', callback = _27_ },
}
return mod
