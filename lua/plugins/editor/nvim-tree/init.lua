local M = {
	'nvim-tree/nvim-tree.lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = 'VeryLazy',
	-- keys = { '<C-S-e>', '<C-p>' },
}

function M.config()
	local nvim_tree = require('nvim-tree')

	local options = require('plugins.editor.nvim-tree.options')
	local on_attach = require('plugins.editor.nvim-tree.on_attach')
	options.on_attach = on_attach

	nvim_tree.setup(options)

	local events = require('nvim-tree.events')

	-- with relative path
	-- events.on_file_created(function(file) vim.cmd.edit(file.fname) end)
	-- with absolute path
	-- events.on_file_created(function(file) vim.cmd.edit(vim.fn.fnamemodify(file.fname, ':p')) end)

	function NvimTreeFloat(enable)
		-- toggle
		if enable == nil then enable = not options.view.float.enable end

		if enable or enable == nil then
			options.view.float.enable = true
			options.update_focused_file.enable = false
			options.view.mappings.list[1].action = 'edit_no_picker'
		else
			options.view.float.enable = false
			options.update_focused_file.enable = true
			options.view.mappings.list[1].action = 'edit'
		end
		nvim_tree.setup(options)
	end

	local functions = require('plugins.editor.nvim-tree.functions')
	local native = require('config.native_keymaps')
	Map.n(Map.alt(native.file_explorer), functions.focus_tree, 'Open Nvim tree')
	-- Map.n('<C-d>', functions.focus_tree, 'Open Nvim tree')
	-- print(options.update_focused_file.enable)
	-- nmap('<leader>e', functions.focus_tree, 'Toggle Nvim Tree')
end
-- M.config()

return M
