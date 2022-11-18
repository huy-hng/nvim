-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
local function test()
	-- Outline
	-- nmap('<leader>o', CMD('LSoutlineToggle'))
	nmap('<leader>o', function()
		require('lspsaga.outline'):render_outline()
	end)

	nmap('gh', CMD 'Lspsaga lsp_finder')

	-- Code action
	map({ 'n', 'v' }, '<leader>ca', CMD 'Lspsaga code_action')

	-- Rename
	nmap('gr', CMD 'Lspsaga rename')

	-- Peek Definition
	-- you can edit the definition file in this flaotwindow
	-- also support open/vsplit/etc operation check definition_action_keys
	-- support tagstack C-t jump back
	nmap('gd', CMD 'Lspsaga peek_definition')

	-- Show line diagnostics
	nmap('<leader>cd', CMD 'Lspsaga show_line_diagnostics')

	-- Show cursor diagnostic
	nmap('<leader>cd', CMD 'Lspsaga show_cursor_diagnostics')

	-- Diagnsotic jump can use `<c-o>` to jump back
	nmap('[e', CMD 'Lspsaga diagnostic_jump_prev')
	nmap(']e', CMD 'Lspsaga diagnostic_jump_next')

	-- Only jump to error
	local status, diagnostics = pcall(require, 'lspsaga.diagnostics')
	if status then
		nmap('[E', function()
			diagnostics.goto_prev { severity = vim.diagnostic.severity.ERROR }
		end)
		nmap(']E', function()
			diagnostics.goto_next { severity = vim.diagnostic.severity.ERROR }
		end)
	end

	-- Hover Doc
	nmap('K', CMD 'Lspsaga hover_doc')

	-- Float terminal
	nmap('<A-d>', CMD 'Lspsaga open_floaterm')
	-- if you want pass somc cli command into terminal you can do like this
	-- open lazygit in lspsaga float terminal
	nmap('<A-d>', CMD 'Lspsaga open_floaterm lazygit')
	-- close floaterm
	tmap('<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
end
-- test()
