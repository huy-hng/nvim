local M = {
	'kevinhwang91/rnvimr', -- ranger
	event = 'VeryLazy',
	-- keys = '<A-e>',
}

local g = vim.g

local float2nr = vim.fn.float2nr
local round = vim.fn.round
local o = vim.o

local function relative(rel, abs) return float2nr(round(abs * rel)) end
local function columns(rel) return relative(rel, o.columns) end
local function lines(rel) return relative(rel, o.lines) end

local function adjust_opts(opts, defaults)
	opts = vim.tbl_extend('force', defaults, opts or {})

	if opts.width <= 1.0 then opts.width = columns(opts.width) end
	if opts.height <= 1.0 then opts.height = lines(opts.height) end

	return opts
end

local views = {}
local function editor(opts)
	opts = adjust_opts(opts, {
		width = 0.5,
		height = 0.8,
		col = 0.5,
		row = 0.5,
	})

	local lines = o.lines - opts.height
	local columns = o.columns - opts.width
	opts.col = math.max(0, round(columns * opts.col))
	opts.row = math.max(0, round(lines * opts.row))

	opts.relative = 'editor'
	opts.anchor = 'NW'

	if opts.ratio then
		table.insert(views, {
			minwidth = opts.width,
			maxwidth = opts.width,
			ratio = opts.ratio,
		})
		opts.ratio = nil
	end

	return opts
end

local function window(opts)
	opts = adjust_opts(opts, {
		width = 0.1,
		height = 0.999,
		col = 0,
		row = 0,
	})
	opts.relative = 'win'
	opts.anchor = 'SE'

	return opts
end

local function cursor(opts)
	opts = adjust_opts(opts, {
		width = 30,
		height = 20,
		col = 0.5,
		row = 0.5,
	})
	opts.col = math.max(0, round(opts.width * opts.col))
	opts.row = math.max(0, round(opts.height * opts.row))

	opts.relative = 'cursor'
	opts.anchor = 'SE'

	return opts
end

local function open_background(width)
	local buf = vim.api.nvim_create_buf(false, true)
	-- vim.api.nvim_open_win(buf, false, {
	-- 	style ='minimal',
	-- })

	vim.cmd.vsplit() -- create split (which moves cursor)
	vim.cmd.wincmd('H') -- move split to the left
	vim.api.nvim_set_current_buf(buf)
	vim.api.nvim_win_set_width(0, width)
	vim.cmd.wincmd('p') -- move cursor back
end

local function open_docked_sidebar()
	g.rnvimr_enable_picker = 0
	vim.cmd.RnvimrToggle()
	vim.cmd.RnvimrResize(2)
	open_background(40)
end

local function close_dock()
	-- TODO: close background window

	g.rnvimr_enable_picker = 1
	vim.cmd.RnvimrToggle()
end

local function config()
	-- Make Ranger replace Netrw and be the file explorer
	g.rnvimr_enable_ex = 0

	-- Make Ranger to be hidden after picking a file
	g.rnvimr_enable_picker = 1

	-- Replace `$EDITOR` candidate with this command to open the selected file
	-- g.rnvimr_edit_cmd = 'drop'

	-- Disable a border for floating window
	g.rnvimr_draw_border = 0

	-- Hide the files included in gitignore
	g.rnvimr_hide_gitignore = 0

	-- Change the border's color
	g.rnvimr_border_attr = { fg = 1, bg = -1 }

	-- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
	-- g.rnvimr_enable_bw = 1

	-- Add a shadow window, value is equal to 100 will disable shadow
	g.rnvimr_shadow_winblend = 100

	-- Draw border with both
	-- g.rnvimr_ranger_cmd = { 'ranger', '--cmd=set draw_borders both' }

	-- highlight link RnvimrNormal CursorLine

	g.rnvimr_action = {
		['<C-t>'] = 'NvimEdit tabedit',
		['<C-_>'] = 'NvimEdit split',
		['<C-|>'] = 'NvimEdit vsplit',
		gw = 'JumpNvimCwd',
		yw = 'EmitRangerCwd',
	}
end

function M.config()
	config()
	Map.n(Keys.ctrl.file_explorer, vim.cmd.RnvimrToggle, 'Open Ranger', { langmap = false })
	-- Map.n(Map.ctrl(native.file_explorer), vim.cmd.RnvimrToggle, 'Open Ranger')

	g.rnvimr_presets = {
		-- offset middle
		editor { width = 0.75, height = 0.8, col = 0.75 },
		-- middle
		editor { width = 0.5, height = 0.8, col = 0.5 },

		-- sidebar
		editor { width = 35, height = 1.0, col = 0 },
		-- bottom
		editor { width = 1.0, height = 0.33, row = 1.0 },
		-- fullscreen
		editor { width = 1.0, height = 1.0 },

		-- previewer
		editor { width = 175, height = 0.8, col = 0.8, ratio = { 1, 4 } },
		-- levels
		editor { width = 171, height = 0.8, col = 0.7, ratio = { 1, 1, 1, 3, 6 } },

		-- win
		window { width = 35 },
		-- cursor
		cursor { width = 0.1, height = 0.3, col = 0.75, row = 0.67 },
	}

	--stylua: ignore
	g.rnvimr_ranger_views = table.add(views, {
		{                 maxwidth =  35, ratio = {        1 } },
		{ minwidth =  36, maxwidth =  60, ratio = {    3,  2 } }, --    36:24
		{ minwidth =  51, maxwidth =  70, ratio = { 4, 7,  3 } }, -- 20:35:15
		{ minwidth =  71, maxwidth =  90, ratio = { 4, 7,  7 } }, -- 20:35:35
		{ minwidth =  91, maxwidth = 120, ratio = { 4, 7, 11 } }, -- 20:35:55
		{ minwidth = 121,                 ratio = { 1, 2,  4 } },
	})

	Augroup('Ranger', {
		Autocmd('FileType', 'rnvimr', function(data)
			local nmap = Map.create('n', '', '[ Ranger ]', { buffer = data.buf })
			local tmap = Map.create('t', '', '[ Ranger ]', { buffer = data.buf })

			-- tmap('<esc>', vim.cmd.RnvimrToggle, 'Close Ranger')

			tmap(Keys.ctrl.file_explorer, vim.cmd.RnvimrToggle, 'Close Ranger')

			tmap('<C-Up>', { nvim.schedule, Util.wrap(vim.cmd.resize, '-4') }, 'Resize window')
			tmap('<C-Down>', { nvim.schedule, Util.wrap(vim.cmd.resize, '+4') }, 'Resize window')
			tmap('<C-Left>', { nvim.schedule, Util.wrap(vim.cmd.wincmd, '4>') }, 'Resize window')
			tmap('<C-Right>', { nvim.schedule, Util.wrap(vim.cmd.wincmd, '4<') }, 'Resize window')

			tmap(Keys.alt.file_explorer, function()
				vim.cmd.RnvimrResize('0,7,8')
				vim.cmd.RnvimrToggle()
				vim.cmd.RnvimrToggle()
			end, 'Resize Ranger')
		end),
	})
end

-- M.config()
-- vim.cmd.source('~/.local/share/nvim/lazy/rnvimr/autoload/rnvimr/layout.vim')

return M
