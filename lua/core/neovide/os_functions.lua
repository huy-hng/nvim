---@diagnostic disable: param-type-mismatch

local g = vim.g

local M = {}

M.get_hostname = function()
	local handle = io.popen('hostname')
	local result
	if handle then
		result = handle:read('*a')
		result = result:gsub('[%p%c%s]', '')
		handle:close()
	end
	return result
end

M.toggle_blur_on_kde = function(blur)
	-- print()
	if blur == nil then blur = not g.neovide_blur end

	g.neovide_blur = blur

	blur = blur and 'c' or 'a'
	local pid_cmd = 'xdotool search --class neovide'
	local blur_cmd =
		'xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32%s -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id '
	-- 'xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32a -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id '
	blur_cmd = string.format(blur_cmd, blur)

	local handle = io.popen(pid_cmd)
	if handle ~= nil then
		local pids = handle:read('*a')
		for _, pid in ipairs(vim.fn.split(pids, '\n')) do
			io.popen(blur_cmd .. pid)
		end
		handle:close()
	end
end

M.animate_transparency_change = function(neovide_transparency, winblend, pumblend, speed)
	neovide_transparency = neovide_transparency or g.neovide_default_transparency
	local duration = speed or 500

	vim.go.pumblend = pumblend

	for _, winnr in ipairs(vim.api.nvim_list_wins()) do
		vim.api.nvim_win_set_option(winnr, 'winblend', winblend)
	end

	-- vim.cmd.windo('set winblend=' .. winblend)
	-- vim.cmd.windo('set pumblend=' .. pumblend)

	local step_size = 0.01
	local diff = math.abs(neovide_transparency - g.neovide_transparency)
	local steps = math.ceil(diff / step_size)

	local step_duration = duration / steps

	if g.neovide_transparency - neovide_transparency < 0 then step_size = step_size * -1 end

	local pos = vim.fn.getcurpos()
	local line = pos[2]
	local col = pos[3]
	local update_direction = -1
	if line == 1 then update_direction = 1 end

	for i = 1, steps do
		vim.defer_fn(function()
			if i == steps then
				g.neovide_transparency = neovide_transparency
				vim.schedule(function()
					vim.fn.cursor { line, col }
					vim.api.nvim_exec('mode', false)
				end)
				return
			end
			g.neovide_transparency = g.neovide_transparency - step_size

			if i % 2 == 0 then
				vim.fn.cursor { line, col }
			elseif i % math.ceil(steps / 2) == 0 then
				-- vim.schedule(function()
				-- 	vim.api.nvim_exec('mode', false)
				-- end)
			else
				vim.fn.cursor { line + update_direction, col }
			end
		end, step_duration * i)
	end
end

return M
