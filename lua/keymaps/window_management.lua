-- Move between windows
Nmap('<C-h>', Util.wrap(vim.cmd.wincmd, 'h'))
Nmap('<C-j>', Util.wrap(vim.cmd.wincmd, 'j'))
Nmap('<C-k>', Util.wrap(vim.cmd.wincmd, 'k'))
Nmap('<C-l>', Util.wrap(vim.cmd.wincmd, 'l'))

-- resize windows with arrow keys
Nmap('<C-Up>',    { nvim.schedule, Util.wrap(vim.cmd.resize, '-4') })
Nmap('<C-Down>',  { nvim.schedule, Util.wrap(vim.cmd.resize, '+4') })
Nmap('<C-Left>',  { nvim.schedule, Util.wrap(vim.cmd.wincmd, '4>') })
Nmap('<C-Right>', { nvim.schedule, Util.wrap(vim.cmd.wincmd, '4<') })

Nmap('<up>',   '4<C-y>', 'Scroll up')
Nmap('<down>', '4<C-e>', 'Scroll down')
Nmap('<left>',  '4zh', 'Scroll left')
Nmap('<right>', '4zl', 'Scroll right')

Nmap('<S-up>',    'k', 'Move cursor up')
Nmap('<S-down>',  'j', 'Move cursor down')
Nmap('<S-left>',  'h', 'Move cursor left')
Nmap('<S-right>', 'l', 'Move cursor right')



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
			nvim.schedule(vim.cmd.wincmd, win_dir)
		end

		nvim.defer(delay, pcall, Util.wrap(vim.cmd.wincmd, cur_dir))
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

local function center_two_windows(size)
	local wins = vim.api.nvim_tabpage_list_wins(0)

	if #wins > 1 then
		-- local ui = vim.api.nvim_list_uis()[1]
		-- local width = ui.width -- can also be queried with :echo &columns
		local columns = vim.o.columns

		size = size or math.floor(columns / 3) * 2

		vim.api.nvim_win_set_width(0, size)
	end
end

-- MapSpaceCapital('n', 'C', center_two_windows)
MapSpaceCapital('n', 'C', function() center_two_windows(120) end)

win_prefix('<C-c>', center_two_windows, 'In two win setup, center right win')

Augroup('WindowCenterer', {
	-- Autocmd('WinEnter', function(data) vim.notify(tostring(vim.api.nvim_get_current_win())) end),
})

-----------------------------------------------Tabs-------------------------------------------------

Nmap('<leader>tn', vim.cmd.tabnew, 'Open new Tab')
Nmap('<leader>tc', vim.cmd.tabclose, 'Close Tab')

Nmap('<leader>to', vim.cmd.tabonly, 'Close all Tabs except current')
Nmap('<leader>th', Util.wrap(vim.cmd.tabmove, '-'), 'Move Tab left')
Nmap('<leader>tl', Util.wrap(vim.cmd.tabmove, '+'), 'Move Tab right')

Nmap('<leader>h', vim.cmd.tabprevious, 'Previous Tab')
Nmap('<leader>l', vim.cmd.tabnext, 'Next Tab')

