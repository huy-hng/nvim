-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
local function test()
	-- Outline
	-- nmap('<leader>o', CMD('LSoutlineToggle'))
	Map.n('<leader>o', function() require('lspsaga.outline'):render_outline() end)

	Map.n('gh', { vim.cmd.Lspsaga, 'lsp_finder' })

	-- Code action
	Map.nv('<leader>ca', { vim.cmd.Lspsaga, 'code_action' })

	-- Rename
	Map.n('gr', { vim.cmd.Lspsaga, 'rename' })

	-- Peek Definition
	-- you can edit the definition file in this flaotwindow
	-- also support open/vsplit/etc operation check definition_action_keys
	-- support tagstack C-t jump back
	Map.n('gd', { vim.cmd.Lspsaga, 'peek_definition' })

	-- Show line diagnostics
	Map.n('<leader>cd', { vim.cmd.Lspsaga, 'show_line_diagnostics' })

	-- Show cursor diagnostic
	Map.n('<leader>cd', { vim.cmd.Lspsaga, 'show_cursor_diagnostics' })

	-- Diagnsotic jump can use `<c-o>` to jump back
	Map.n('[e', { vim.cmd.Lspsaga, 'diagnostic_jump_prev' })
	Map.n(']e', { vim.cmd.Lspsaga, 'diagnostic_jump_next' })

	-- Only jump to error
	local status, diagnostics = pcall(require, 'lspsaga.diagnostics')
	if status then
		Map.n('[E', { diagnostics.goto_prev, { severity = vim.diagnostic.severity.ERROR } })
		Map.n(']E', { diagnostics.goto_next, { severity = vim.diagnostic.severity.ERROR } })
	end

	-- Hover Doc
	Map.n('K', { vim.cmd.Lspsaga, 'hover_doc' })

	-- Float terminal
	-- if you want pass somc cli command into terminal you can do like this
	-- open lazygit in lspsaga float terminal
	Map.n('<A-d>', { vim.cmd.Lspsaga('open_floaterm'), 'lazygit' })
	-- close floaterm
	Map.t('<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
end

-- Nmap('<A-d>', { vim.cmd.Lspsaga, 'open_floaterm' })
Map.n('<A-d>', { vim.cmd.Lspsaga('open_floaterm'), 'lazygit' })
-- Tmap('<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
-- test()
