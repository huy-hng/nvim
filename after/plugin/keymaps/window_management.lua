local win_prefix = MapCreator('n', '<C-w>', '[Window]')

win_prefix('<C-h>', '<C-w>R', 'Move current window to the left')
win_prefix('<C-l>', '<C-w>r', 'Move current window to the right')

local function has_vertical_wins()
	local wins = vim.api.nvim_tabpage_list_wins(0)

	for _, win in ipairs(wins) do
		local pos = vim.api.nvim_win_get_position(win)
		if pos[1] > 1 then return true end
	end
end

---@param direction number 1 for right, -1 for left
local function move_wins(direction)
	local delay = 100
	return function()
		local cur_dir
		local win_dir
		if direction > 0 then
			win_dir = 'r'
			cur_dir = 'h'
		else
			win_dir = 'R'
			cur_dir = 'l'
		end

		if not has_vertical_wins() then --
			Schedule(vim.cmd.wincmd, win_dir)
		end

		Defer(delay, pcall, Util.wrap(vim.cmd.wincmd, cur_dir))
	end
end

-- Nmap('<C-h>', move_wins(1))
-- Nmap('<C-l>', move_wins(-1))

-- local wins = vim.api.nvim_list_wins()
local function get_location(wins, winid) end

local function center()
	local wins = vim.api.nvim_tabpage_list_wins(0)

	for _, win in ipairs(wins) do
		local pos = vim.api.nvim_win_get_position(win)
		if pos[1] > 1 then return end
		P(pos)
	end

	local num_wins = #wins
	local curwin = vim.api.nvim_get_current_win()
	local location = get_location(wins, curwin)
	P(curwin, wins)
end

local function center_two_windows()
	local wins = vim.api.nvim_tabpage_list_wins(0)

	if #wins == 2 then
		-- local ui = vim.api.nvim_list_uis()[1]
		-- local width = ui.width -- can also be queried with :echo &columns
		local columns = Exec('echo &columns')

		local winid = vim.api.nvim_get_current_win()
		local windows = vim.fn.getwininfo(winid)

		local twothirds = math.floor(columns / 3) * 2

		vim.api.nvim_win_set_width(0, twothirds)
	end
end

MapSpaceCapital('n', 'C', center_two_windows)

win_prefix('<C-c>', center_two_windows, 'In two win setup, center right win')


Augroup('WindowCenterer', {
	-- Autocmd('WinEnter', function(data) vim.notify(tostring(vim.api.nvim_get_current_win())) end),
})
