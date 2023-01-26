local M = {}

local utils = require('core.statuscolumn.utils')

function M.set_focus(winid, linenr)
	print(winid, linenr)
	vim.api.nvim_set_current_win(winid)
	if linenr then vim.api.nvim_win_set_cursor(0, { linenr, 0 }) end
end

--- Store click args and fn.getmousepos() in table.
--- Set current window and mouse position to clicked line.
function M.get_click_args(minwid, clicks, button, mods)
	local args = {
		minwid = minwid,
		clicks = clicks,
		button = button,
		mods = mods,
		mousepos = vim.fn.getmousepos(),
	}
	return args
end

function M.fold(...)
	local args = M.get_click_args(...)
	-- M.set_focus(args.mousepos.winid, args.mousepos.line)
	M.set_focus(args.mousepos.winid)

	local lnum = vim.fn.getmousepos().line

	if not utils.is_foldline(lnum) then return end

	local action = utils.is_collapsed(lnum) and 'foldopen' or 'foldclose'
	nvim.exec(lnum .. action)
end

--- Execute sign column click callback.
function M.get_sign_action(minwid, clicks, button, mods)
	local args = M.get_click_args(minwid, clicks, button, mods)
	local row = args.mousepos.screenrow
	local col = args.mousepos.screencol

	local sign = vim.fn.screenstring(row, col)

	-- If clicked on empty space in the sign column, try one cell to the left
	if sign == ' ' then sign = vim.fn.screenstring(row, col - 1) end

	if not utils.defined_signs[sign] then utils.update_sign_defined() end
	for name, text in pairs(utils.defined_signs) do
		-- if text == sign and cfg[name] then
		-- 	S(function() cfg[name](args) end)
		-- 	break
		-- end
	end
end

-- local cur = vim.fn.getcurpos()
-- local str = vim.fn.screenstring(cur[1], cur[2])
-- P(str)
return M
