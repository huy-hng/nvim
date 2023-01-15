-- if _G.StatusColumn then return end

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
		line = function()
			if vim.v.wrap then return 'a' end

			-- if true then return 'v:relnum?v:relnum:v:lnum' end

			local lnum = tostring(vim.v.lnum)
			if #lnum == 1 then -- Prevent adding a tenth line from bumping the size of the column
				return ' ' .. lnum
			else
				return lnum
			end
		end,

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
			'%=%{v:lua.StatusColumn.display.line()}',
			-- '%=%{v:relnum?v:relnum:v:lnum}',
			-- '%=%r',
			-- '%=%l',
		},
		spacing = {
			' ',
		},
		folds = {
			'%#FoldColumn#', -- HL
			'%@v:lua.StatusColumn.handler.fold@',
			'%{v:lua.StatusColumn.display.fold()}',
		},
		border = {
			'%#StatusColumnBorder#', -- HL
			-- '│',
			'▏',
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

vim.wo.numberwidth = 1
vim.wo.signcolumn = 'yes:2'

local close_to_default = StatusColumn.build {
	StatusColumn.sections.folds,
	StatusColumn.sections.sign_column,
	StatusColumn.sections.line_number,
	-- StatusColumn.sections.spacing,
	-- StatusColumn.sections.border,
	StatusColumn.sections.spacing,
	-- StatusColumn.sections.padding,
}

local column = StatusColumn.build {
	StatusColumn.sections.sign_column,
	-- StatusColumn.sections.folds,
	StatusColumn.sections.line_number,
	StatusColumn.sections.spacing,
	-- StatusColumn.sections.border,
	-- StatusColumn.sections.spacing,
}
local on = true
local function toggler()
	if on then
		on = false
		-- Right aligned relative cursor line number:
		-- vim.opt.statuscolumn = '%=%{v:relnum?v:relnum:v:lnum} '
		vim.opt.statuscolumn = ''

		-- -- Line numbers in hexadecimal for non wrapped part of lines:
		-- vim.opt.statuscolumn = [[%=%{v:wrap?"":printf("%x",v:lnum)} ]]

		-- -- Human readable line numbers with thousands separator:
		-- vim.opt.statuscolumn = [[%{substitute(v:lnum,"\d\zs\ze\%(\d\d\d\)\+$",",","g")}]]

		-- -- Both relative and absolute line numbers with different
		-- -- highlighting for odd and even relative numbers:
		-- vim.opt.statuscolumn =
		-- 	[[%#NonText#%{&nu?v:lnum:""} %=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""} %#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}]]

		-- -- Relative number with bar separator and click handlers:
		-- vim.opt.statuscolumn = '%@SignCb@%s%=%T%@NumCb@%r│%T'

		StatusColumn.set_window('')
		return
	end
	on = true
	-- StatusColumn.set_window(close_to_default)
	StatusColumn.set_window(column)
end
Nmap("<c-'>", toggler)

-- vim.opt.statuscolumn = '%{v:wrap ? repeat(" ", float2nr(ceil(log10(v:lnum))))."↳":v:lnum}%=%s%C'

