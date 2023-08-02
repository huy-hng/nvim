_G.PopupMenu = {
	mousepos = function()
		local mousepos = vim.fn.getmousepos()
		P(mousepos)
	end,
	cursorpos = function()
		local cursorpos = vim.fn.getcurpos()
		P(cursorpos)
	end,
}
-- vim.cmd('call v:lua.PopupMenu.pos()')

vim.cmd([[
aunmenu PopUp
vnoremenu PopUp.Cut                         "+x
vnoremenu PopUp.Copy                        "+y

anoremenu PopUp.Paste                       "+gP
vnoremenu PopUp.Paste                       "+P
vnoremenu PopUp.Delete                      "_x
nnoremenu PopUp.Select\ All                 ggVG
vnoremenu PopUp.Select\ All                 gg0oG$
inoremenu PopUp.Select\ All                 <C-Home><C-O>VG

nnoremenu PopUp.Menu2      <cmd>popup! Menu2<cr>
]])

local function create_menu(name, items)
	-- nvim.exec('aunmenu ' .. name)
	pcall(nvim.exec, 'aunmenu ' .. name)
	for _, item in ipairs(items) do
		local lhs = string.gsub(item[1], ' ', '\\ ')
		local cmd = string.format('anoremenu %s.%s %s', name, lhs, item[2])
		vim.cmd(cmd)
	end
end
local function call_other_menu(menu_name) --
	return '<cmd>popup! ' .. menu_name .. '<cr>'
end

-- stylua: ignore
create_menu('Gitsigns', {
	{ 'Preview Hunk', 		 '<cmd>Gitsigns preview_hunk<cr>' },
	{ 'Preview Hunk inline', '<cmd>Gitsigns preview_hunk_inline<cr>' },
})

-- stylua: ignore
create_menu('PopUp', {
	{ 'Gitsigns', 		 call_other_menu('Gitsigns')},
})
