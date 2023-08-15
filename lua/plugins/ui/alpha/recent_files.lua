local comp = require('plugins.ui.alpha.components')
local file = require('bufman.filename')

local if_nil = vim.F.if_nil
local fnamemodify = vim.fn.fnamemodify
local filereadable = vim.fn.filereadable

local default_header = {
	type = 'text',
	val = {
		[[                                  __                ]],
		[[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
		[[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		[[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		[[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		[[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	},
	opts = {
		hl = 'Type',
		shrink_margin = false,
		-- wrap = "overflow";
	},
}

local function get_file_icon(filename)
	local fb_hl = {}
	local ico, hl = unpack(file.get_icon(filename))
	local hl_option_type = type(true)
	if hl_option_type == 'boolean' then
		if hl then table.insert(fb_hl, { hl, 0, 1 }) end
	end
	if hl_option_type == 'string' then table.insert(fb_hl, { true, 0, 1 }) end
	local icon = ico or ''
	return icon .. '  ', fb_hl
end

local function file_button(filename, lhs, short_filename, autocd)
	short_filename = short_filename or filename

	local icon, fb_hl = get_file_icon(filename)

	local cd_cmd = (autocd and ' | cd %:p:h' or '')

	local opts = {
		position = 'center',
		shortcut = '[' .. lhs .. '] ',
		hl_shortcut = {
			{ 'Operator', 0, 1 },
			{ 'Number', 1, #lhs + 1 },
			{ 'Operator', #lhs + 1, #lhs + 2 },
		},
		wrap = 'overflow',
		shrink_margin = false,
	}
	local file_button_el = comp.keymap(
		icon .. short_filename,
		lhs,
		Util.wrap(nvim.exec, 'e' .. filename .. cd_cmd),
		nil,
		opts
	)
	-- local file_button_el =
	-- 	button(lhs, icon .. short_filename, '<cmd>e ' .. filename .. cd_cmd .. ' <CR>')

	local fn_start = short_filename:match('.*[/\\]')
	if fn_start ~= nil then table.insert(fb_hl, { 'Comment', #icon - 2, #fn_start + #icon - 2 }) end
	file_button_el.opts.hl = fb_hl
	return file_button_el
end

local default_mru_ignore = { 'gitcommit' }

local mru_opts = {
	ignore = function(path, ext)
		return (string.find(path, 'COMMIT_EDITMSG')) or (vim.tbl_contains(default_mru_ignore, ext))
	end,
	autocd = false,
}

--- @param start number
--- @param cwd string? optional
--- @param items_number number? optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
	opts = opts or mru_opts
	items_number = if_nil(items_number, 10)
	local oldfiles = {}
	for _, v in pairs(vim.v.oldfiles) do
		if #oldfiles == items_number then break end
		local cwd_cond
		if not cwd then
			cwd_cond = true
		else
			cwd_cond = vim.startswith(v, cwd)
		end
		local ignore = (opts.ignore and opts.ignore(v, file.get_extension(v))) or false
		if (filereadable(v) == 1) and cwd_cond and not ignore then oldfiles[#oldfiles + 1] = v end
	end

	local tbl = {}
	for i, fn in ipairs(oldfiles) do
		local short_fn
		if cwd then
			short_fn = fnamemodify(fn, ':.')
		else
			short_fn = fnamemodify(fn, ':~')
		end
		local file_button_el = file_button(fn, tostring(i + start - 1), short_fn, opts.autocd)
		tbl[i] = file_button_el
	end
	return {
		type = 'group',
		val = tbl,
		opts = {},
	}
end

local function mru_title() return 'MRU' end


return {
	comp.group {
		comp.padding(1),
		comp.divider('Recent Files'),
		comp.padding(1),
		comp.group(function() return { mru(0, vim.fn.getcwd()) } end, { shrink_margin = false }),
	},
	-- comp.group {
	-- 	comp.padding(1),
	-- 	comp.divider('Recent Files'),
	-- 	comp.padding(1),
	-- 	-- comp.group(function() return { mru(10) } end, { shrink_margin = false }),
	-- },
}
