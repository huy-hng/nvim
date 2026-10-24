-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
local function test()
	local map = Map.create('n', 'a')
	-- Outline
	Map.n('<leader>o', function() require('lspsaga.outline'):render_outline() end)

	Map.n('gh', { vim.cmd.Lspsaga, 'lsp_finder' })

	-- Code action
	Map.nv('<leader>ca', { vim.cmd.Lspsaga, 'code_action' })

	-- Rename
	Map.n('gr', { vim.cmd.Lspsaga, 'rename' })

	-- Rename all occurrences of the hovered word for the selected files
	-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

	-- Peek Definition
	-- you can edit the definition file in this flaotwindow
	-- also support open/vsplit/etc operation check definition_action_keys
	-- support tagstack C-t jump back
	Map.n('gd', { vim.cmd.Lspsaga, 'peek_definition' })

	-- Go to definition
	-- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
	-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
	-- keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")

	-- Show line diagnostics
	Map.n('<leader>cd', { vim.cmd.Lspsaga, 'show_line_diagnostics' })

	-- Show cursor diagnostic
	Map.n('<leader>cd', { vim.cmd.Lspsaga, 'show_cursor_diagnostics' })

	-- Show buffer diagnostics
	-- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

	-- Show workspace diagnostics
	-- keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

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

	-- If you want to keep the hover window in the top right hand corner,
	-- you can pass the ++keep argument. If you want to jump to the hover window
	-- you should use the wincmd command "<C-w>w"
	-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

	-- Float terminal
	-- if you want pass somc cli command into terminal you can do like this
	-- open lazygit in lspsaga float terminal
	Map.n('<A-d>', { vim.cmd.Lspsaga('open_floaterm'), 'lazygit' })
	-- close floaterm
	Map.t('<A-d>', [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
	

	-- Diagnostic jump with filters such as only jumping to an error
	keymap("n", "[E", function()
	  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end)
	keymap("n", "]E", function()
	  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
	end)

	-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
	-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
end
