-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
local function test()
	-- Outline
	-- nmap('<leader>o', CMD('LSoutlineToggle'))
	Nmap('<leader>o', function() require('lspsaga.outline'):render_outline() end)

	Nmap('gh', { vim.cmd.Lspsaga, 'lsp_finder' })

	-- Code action
	NVmap('<leader>ca', { vim.cmd.Lspsaga, 'code_action' })

	-- Rename
	Nmap('gr', { vim.cmd.Lspsaga, 'rename' })

	-- Peek Definition
	-- you can edit the definition file in this flaotwindow
	-- also support open/vsplit/etc operation check definition_action_keys
	-- support tagstack C-t jump back
	Nmap('gd', { vim.cmd.Lspsaga, 'peek_definition' })

	-- Show line diagnostics
	Nmap('<leader>cd', { vim.cmd.Lspsaga, 'show_line_diagnostics' })

	-- Show cursor diagnostic
	Nmap('<leader>cd', { vim.cmd.Lspsaga, 'show_cursor_diagnostics' })

	-- Diagnsotic jump can use `<c-o>` to jump back
	Nmap('[e', { vim.cmd.Lspsaga, 'diagnostic_jump_prev' })
	Nmap(']e', { vim.cmd.Lspsaga, 'diagnostic_jump_next' })

	-- Only jump to error
	local status, diagnostics = pcall(require, 'lspsaga.diagnostics')
	if status then
		Nmap('[E', { diagnostics.goto_prev, { severity = vim.diagnostic.severity.ERROR } })
		Nmap(']E', { diagnostics.goto_next, { severity = vim.diagnostic.severity.ERROR } })
	end

	-- Hover Doc
	Nmap('K', { vim.cmd.Lspsaga, 'hover_doc' })

	-- Float terminal
	-- if you want pass somc cli command into terminal you can do like this
	-- open lazygit in lspsaga float terminal
	Nmap('<A-d>', { vim.cmd.Lspsaga('open_floaterm'), 'lazygit' })
	-- close floaterm
	Tmap('<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
end

-- Nmap('<A-d>', { vim.cmd.Lspsaga, 'open_floaterm' })
Nmap('<A-d>', { vim.cmd.Lspsaga('open_floaterm'), 'lazygit' })
-- Tmap('<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
-- test()
