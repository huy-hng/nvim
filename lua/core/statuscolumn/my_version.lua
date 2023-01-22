local a = vim.api
local f = vim.fn
local o = vim.o
local O = vim.opt
local S = vim.schedule
local signs = {}

local builtin = require('core.statuscolumn.click')
local c = vim.cmd
local d = vim.diagnostic
local l = vim.lsp
local v = vim.v
local foldmarker
local M = {}

local cfg = {
	separator = '', -- separator between line number and buffer text ("│" or extra " " padding)

	thousands = false, -- or line number thousands separator string ("." / ",")
	relculright = true, -- whether to right-align the cursor line number with 'relativenumber' set
	-- Custom line number string options for ScLn() segment
	lnumfunc = nil, -- custom function called by ScLn(), should return a string
	reeval = false, -- whether or not the string returned by lnumfunc should be reevaluated

	setopt = true, -- whether to set the 'statuscolumn', providing builtin click actions
}

-- Return line number in configured format.
function M.lnumfunc(number, relativenumber, thousands, relculright)
	if v.wrap or (not relativenumber and not number) then return '' end
	local lnum = v.lnum

	if relativenumber then lnum = v.relnum > 0 and v.relnum or (number and lnum or 0) end

	-- if thousands and lnum > 999 then
	-- 	lnum = string
	-- 		.reverse(lnum)
	-- 		:gsub('%d%d%d', '%1' .. thousands)
	-- 		:reverse()
	-- 		:gsub('^%' .. thousands, '')
	-- end

	-- if not relculright then
	-- 	if relativenumber then
	-- 		lnum = (v.relnum > 0 and '%=' or '') .. lnum .. (v.relnum > 0 and '' or '%=')
	-- 	else
	-- 		lnum = '%=' .. lnum
	-- 	end
	-- end

	return lnum .. ''
end



_G.StatusColumn = {
	handler = {
		fold = function()
			local lnum = vim.fn.getmousepos().line

			-- Only lines with a mark should be clickable
			if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then return end

			local state
			if vim.fn.foldclosed(lnum) == -1 then
				state = 'close'
			else
				state = 'open'
			end

			vim.cmd.execute("'" .. lnum .. 'fold' .. state .. "'")
		end,
	},

	display = {
		line = Util.wrap(M.lnumfunc, o.number, o.relativenumber, cfg.thousands, cfg.relculright),

		fold = function()
			if vim.v.wrap then return '' end

			local lnum = vim.v.lnum
			local icon = ' '

			-- Line isn't in folding range
			if vim.fn.foldlevel(lnum) <= 0 then return icon end

			-- Not the first line of folding range
			if vim.fn.foldlevel(lnum) <= vim.fn.foldlevel(lnum - 1) then return icon end

			if vim.fn.foldclosed(lnum) == -1 then
				icon = ''
			else
				icon = ''
			end

			return icon
		end,
	},

	sections = {
		sign_column = {
			'%s',
		},
		line_number = {
			-- '%=%{v:lua.StatusColumn.display.line()}',
			'%=%{%v:lua.StatusColumn.display.line()%}',
			-- '%=%r',
			-- '%=%l',
		},
		spacing = {
			' ',
		},
		folds = {
			'%#FoldColumn#',
			'%@v:lua.StatusColumn.handler.fold@',
			'%{v:lua.StatusColumn.display.fold()}',
			'%##',
		},
		border = {
			'%#StatusColumnBorder#', -- HL
			'│',
			-- '▏',
			-- [[▐]],
			-- '▕',
		},
		padding = {
			'%#StatusColumnBuffer#', -- HL
			' ',
		},
	},

	build = function(tbl)
		local statuscolumn = {}

		for _, value in ipairs(tbl) do
			if type(value) == 'string' then
				table.insert(statuscolumn, value)
			elseif type(value) == 'table' then
				table.insert(statuscolumn, StatusColumn.build(value))
			end
		end

		return table.concat(statuscolumn)
	end,

	set_window = function(value)
		vim.defer_fn(
			function()
				vim.api.nvim_win_set_option(vim.api.nvim_get_current_win(), 'statuscolumn', value)
			end,
			1
		)
	end,
}

local function remove_statuscolumn()
	vim.wo.numberwidth = 1
	vim.wo.number = false
	vim.wo.signcolumn = 'no'
	vim.wo.foldcolumn = '0'
end

local function show_statuscolumn()
	vim.wo.numberwidth = 1
	vim.wo.number = true
	vim.wo.signcolumn = 'yes'
	vim.wo.foldcolumn = '1'
end

-- remove_statuscolumn()
-- show_statuscolumn()

local function default()
	show_statuscolumn()
	local default = StatusColumn.build {
		StatusColumn.sections.folds,
		StatusColumn.sections.sign_column,
		StatusColumn.sections.line_number,
	}
	StatusColumn.set_window(default)
end

local column = StatusColumn.build {

	-- StatusColumn.sections.padding,

	StatusColumn.sections.line_number,
	StatusColumn.sections.folds,
	-- StatusColumn.sections.spacing,
	StatusColumn.sections.sign_column,
	-- StatusColumn.sections.spacing,
	-- StatusColumn.sections.border,
}

local on = true
local function toggler()
	if on then
		vim.wo.foldcolumn = '1'
		on = false
		vim.wo.statuscolumn = ''
		vim.notify('statuscolumn off')

		return
	end
	vim.wo.foldcolumn = '0'
	P(vim.fn.sign_getplaced())
	vim.notify('statuscolumn on')
	on = true
	StatusColumn.set_window(column)
end

-- StatusColumn.set_window(column)
Nmap("<c-'>", toggler)
vim.wo.numberwidth = 1
vim.wo.signcolumn = 'yes'
vim.wo.number = true

-- vim.wo.statuscolumn = column
-- vim.opt.statuscolumn = '%{v:wrap ? repeat(" ", float2nr(ceil(log10(v:lnum))))."↳":v:lnum}%=%s%C'

local function extra_examples()
	-- Line numbers in hexadecimal for non wrapped part of lines:
	vim.opt.statuscolumn = [[%=%{v:wrap?"":printf("%x",v:lnum)} ]]

	-- Human readable line numbers with thousands separator:
	vim.opt.statuscolumn = [[%{substitute(v:lnum,"\d\zs\ze\%(\d\d\d\)\+$",",","g")}]]

	-- Both relative and absolute line numbers with different
	-- highlighting for odd and even relative numbers:
	vim.opt.statuscolumn =
		[[%#NonText#%{&nu?v:lnum:""} %=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""} %#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}]]

	-- Relative number with bar separator and click handlers:
	vim.opt.statuscolumn = '%@SignCb@%s%=%T%@NumCb@%r│%T'

	-- Right aligned relative cursor line number:
	vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '
end
