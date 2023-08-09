-- Move between windows
Map.n(Keys.ctrl.h, Util.wrap(vim.cmd.wincmd, 'h'))
-- Map.n(Keys.ctrl.j, Util.wrap(vim.cmd.wincmd, 'j'))
-- Map.n(Keys.ctrl.k, Util.wrap(vim.cmd.wincmd, 'k'))
Map.n(Keys.ctrl.l, Util.wrap(vim.cmd.wincmd, 'l'))

-- resize windows with arrow keys
Map.n('<C-Up>',    { nvim.schedule, Util.wrap(vim.cmd.resize, '-4') })
Map.n('<C-Down>',  { nvim.schedule, Util.wrap(vim.cmd.resize, '+4') })
Map.n('<C-Left>',  { nvim.schedule, Util.wrap(vim.cmd.wincmd, '4>') })
Map.n('<C-Right>', { nvim.schedule, Util.wrap(vim.cmd.wincmd, '4<') })

Map.n('<up>',   '4<C-y>', 'Scroll up')
Map.n('<down>', '4<C-e>', 'Scroll down')
Map.n('<left>',  '4zh', 'Scroll left')
Map.n('<right>', '4zl', 'Scroll right')

Map.n('<S-up>',    'k', 'Move cursor up')
Map.n('<S-down>',  'j', 'Move cursor down')
Map.n('<S-left>',  'h', 'Move cursor left')
Map.n('<S-right>', 'l', 'Move cursor right')



local win_prefix = Map.create('n', '<C-w>', '[Window]')

win_prefix(Keys.ctrl.h, '<C-w>R', 'Move current window to the left')
win_prefix(Keys.ctrl.l, '<C-w>r', 'Move current window to the right')

win_prefix(Keys.h, '<C-w>h', 'Go to left window')
win_prefix(Keys.j, '<C-w>j', 'Go to below window')
win_prefix(Keys.k, '<C-w>k', 'Go to above window')
win_prefix(Keys.l, '<C-w>l', 'Go to right window')

win_prefix(Keys.H, '<C-w>H', 'Move current window to the leftest')
win_prefix(Keys.J, '<C-w>J', 'Move current window to the downest')
win_prefix(Keys.K, '<C-w>K', 'Move current window to the uppest')
win_prefix(Keys.L, '<C-w>L', 'Move current window to the rightest')

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

Map.n('<leader>C', function() center_two_windows(120) end, 'Center two windows')
win_prefix('<C-c>', center_two_windows, 'In two win setup, center right win')

Augroup('WindowCenterer', {
	-- Autocmd('WinEnter', function(data) vim.notify(tostring(vim.api.nvim_get_current_win())) end),
})

-----------------------------------------------Tabs-------------------------------------------------

Map.n('<leader>wn', vim.cmd.tabnew, 'Open new Tab')
Map.n('<leader>wc', vim.cmd.tabclose, 'Close Tab')

Map.n('<leader>wo', vim.cmd.tabonly, 'Close all Tabs except current')
Map.n('<leader>wh', Util.wrap(vim.cmd.tabmove, '-'), 'Move Tab left')
Map.n('<leader>wl', Util.wrap(vim.cmd.tabmove, '+'), 'Move Tab right')

Map.n(Keys.leader.h, vim.cmd.tabprevious, 'Previous Tab')
Map.n(Keys.leader.l, vim.cmd.tabnext, 'Next Tab')

