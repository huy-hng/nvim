local M = {}
local v = vim.v

M.indexed = {}
M.defined_signs = {}

function M.cache_defined_signs()
	local defined = vim.fn.sign_getdefined()
	for _, def in ipairs(defined) do
		if def.text then def.text = string.gsub(def.text, ' ', '') end
		M.defined_signs[def.name] = def
	end
end
M.cache_defined_signs()

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

function M.wrap_hl(text, hl) --
	if type(text) == 'table' then
		text = table.concat(text)
	end
	return '%#' .. hl .. '#' .. text .. '%##'
end

return M
