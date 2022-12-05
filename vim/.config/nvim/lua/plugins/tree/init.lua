local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

local options = require('plugins.tree.options')
local mappings = require('plugins.tree.mappings')
options.view.mappings.list = mappings

nvim_tree.setup(options)

function NvimTreeFloat(enable)
	-- toggle
	if enable == nil then enable = not options.view.float.enable end

	if enable or enable == nil then
		options.view.float.enable = true
		options.view.mappings.list[1].action = 'edit_no_picker'
	else
		options.view.float.enable = false
		options.view.mappings.list[1].action = 'edit'
	end
	nvim_tree.setup(options)
end

local functions = require('plugins.tree.functions')
nmap('<C-e>', functions.focus_tree, 'Toggle Nvim Tree')
nmap('<A-E>', NvimTreeFloat, 'Toggle Nvim Tree')
-- nmap('<leader>e', functions.focus_tree, 'Toggle Nvim Tree')