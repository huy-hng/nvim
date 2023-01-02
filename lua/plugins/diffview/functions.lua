---@diagnostic disable: undefined-field

local M = {}
local function get_panel()
	local lib = require('diffview.lib')
	local view = lib.get_current_view()
	if view == nil then
		print('diffview view null')
		return
	end
	return view
end

local function get_dirs(view)
	local dirs = {}
	local function recurse(child)
		if child.name == 'directory' then --
			table.insert(dirs, child.context)
			-- print(child.name, child.lstart, child.lend)
			-- PrintKeys(child.context)
			-- print(child.context.name, child.context.collapsed)
		end
		-- print(#child.components)
		if #child.components > 0 then
			for _, v in ipairs(child.components) do
				recurse(v)
			end
		end
		-- return child
	end

	recurse(view.panel.components.comp)
	return dirs
end

function M.collapse_all()
	local view = get_panel()

	local dirs = get_dirs(view)
	for _, item in ipairs(dirs) do
		view.panel:set_item_fold(item, false)
	end
end

function M.uncollapse_all()
	local view = get_panel()

	local dirs = get_dirs(view)
	for _, item in ipairs(dirs) do
		view.panel:set_item_fold(item, true)
	end
end

function M.close_fold()
	local view = get_panel()
	if not view then return end

	if view.panel:is_open() then
		local cursor = vim.api.nvim_win_get_cursor(0)
		local line = cursor[1]

		local comp = view.panel.components.comp:get_comp_on_line(line)

		if comp and (comp.name == 'file' or comp.name == 'directory') then --
			while comp.name ~= 'directory' do
				print(comp.name, comp.lstart, comp.lend)
				comp = comp.parent
			end
			-- PrintKeys(comp)
			-- print(' ')

			-- local parent = comp.parent
			-- print(parent.name, parent.lstart, parent.lend)
			-- print(comp.context.name)
			-- print(' ')

			-- PrintKeys(comp.parent)
		end

		local item = view.panel:get_item_at_cursor()
		if not item or type(item.collapsed) ~= 'boolean' then return end
		view.panel:set_item_fold(item, false)
	end
end

function M.open_fold()
	local view = get_panel()
	if not view then return end

	if view.panel:is_open() then
		local item = view.panel:get_item_at_cursor()
		if not item then return end
		if type(item.collapsed) == 'boolean' then
			view.panel:set_item_fold(item, true)
		else
			view:set_file(item, false)
		end
	end
end

return M
