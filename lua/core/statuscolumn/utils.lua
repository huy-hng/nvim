local M = {}

M.indexed = {}
M.defined_signs = {}

--- Store defined signs without whitespace.
function M.update_sign_defined()
	for _, sign in ipairs(vim.fn.sign_getdefined()) do
		if sign.text then --
			sign.text = sign.text:gsub('%s', '')
		end
		M.defined_signs[sign.name] = sign
	end
end

function M.update_signs()
	local bufnr = vim.api.nvim_get_current_buf()
	local signs = vim.fn.sign_getplaced(bufnr, { group = '*' })
	for _, sign in ipairs(signs[1].signs) do
		M.indexed[sign.lnum] = M.indexed[sign.lnum] or {}
		table.insert(M.indexed[sign.lnum], sign)
	end
end

function M.get_signs_in_line(bufnr, group, lnum, id)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local sign = vim.fn.sign_getplaced(bufnr, { group = group, id = id, lnum = lnum })
	sign = sign and sign[1]
	sign = sign and sign.signs
	return sign
end

function M.remove_sign_group(signs, group)
	local filtered = {}
	if not signs or #signs == 0 then return filtered end
	for _, sign in ipairs(signs) do
		if sign.group ~= group then
			local defined = M.defined_signs[sign.name]
			if defined then --
				table.insert(filtered, { text = defined.text, hl = defined.texthl })
			end
		end
	end
	return filtered
end

-- DEPRECATED:
function M.get_gitsigns(bufnr, lnum)
	local sign = M.get_signs_in_line(bufnr, 'gitsigns_vimfn_signs_', lnum)
	return sign and sign[1]
end

function M.get_gitsign_hl(bufnr, lnum)
	local ns = vim.api.nvim_get_namespaces()['gitsigns_extmark_signs_']
	if not lnum or not ns then return end

	local mark = vim.api.nvim_buf_get_extmarks(
		bufnr or 0,
		ns,
		{ lnum-1, 0 },
		{ lnum-1, -1 },
		{ details = true }
	)

	return mark[1] and mark[1][4].sign_hl_group
end

function M.is_collapsed(lnum) return vim.fn.foldclosed(lnum) ~= -1 end

function M.is_foldline(lnum) --
	return vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1)
end

function M.is_collapsed_fold(lnum) --
	return M.is_foldline(lnum) and M.is_collapsed(lnum)
end

function M.get_fold_range(lnum) --
	local start_line = vim.fn.foldclosed(lnum)
	local end_line = vim.fn.foldclosedend(lnum)
	return start_line, end_line
end

function M.wrap_hl(text, hl) --
	if type(text) == 'table' then text = table.concat(text) end
	text = text or ''
	if not hl then return text end
	return '%#' .. hl .. '#' .. text .. '%##'
end

local function wrap_text(prefix, text, suffix)
	return prefix .. 'v:lua.Statuscolumn.components.' .. text .. suffix
end

function M.create_display_text(text) return wrap_text('%{%', text, '()%}') end
function M.create_on_click_text(text) return wrap_text('%@', text, '.on_click@') end

return M
