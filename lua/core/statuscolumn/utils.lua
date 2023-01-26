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

function M.get_sign(bufnr, group, lnum, id)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	local sign = vim.fn.sign_getplaced(bufnr, { group = group, id = id, lnum = lnum })
	sign = sign and sign[1]
	sign = sign and sign.signs
	return sign
end

function M.get_gitsigns(bufnr, lnum)
	local sign = M.get_sign(bufnr, 'gitsigns_vimfn_signs_', lnum)
	sign = sign and sign[1]
	return sign
end

function M.is_collapsed(lnum) return vim.fn.foldclosed(lnum) ~= -1 end

function M.is_foldline(lnum) --
	return vim.fn.foldlevel(lnum) > vim.fn.foldlevel(lnum - 1)
end

function M.wrap_hl(text, hl) --
	if type(text) == 'table' then text = table.concat(text) end
	text = text or ''
	if not hl then return text end
	return '%#' .. hl .. '#' .. text .. '%##'
end

return M
