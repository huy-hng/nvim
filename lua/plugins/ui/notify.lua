local M = {
	'rcarriga/nvim-notify', -- after = 'nvim-cmp'
	event = 'VeryLazy',
}

function M.config()
	local notify = require('notify')

	local config = {
		-- {level}             (string|integer)
		-- {timeout}           (number)
		-- {max_width}         (number|function)
		-- {max_height}        (number|function)
		-- {stages}            (string|function[])
		-- {background_colour} (string)
		-- {icons}             (table)
		-- {on_open}           (function)
		-- {on_close}          (function)
		-- {render}            (function|string)
		-- {minimum_width}     (integer)
		-- {fps}               (integer)
		-- {top_down}          (boolean)
	}

	OpenNotifications = {}

	function RemoveNotification(winid)
		if not winid then
			print('latest notification removed')
			table.remove(OpenNotifications, 1)
			return
		end

		for i, w in ipairs(OpenNotifications) do
			if w == winid then
				table.remove(OpenNotifications, i)
				print(winid, 'removed')
				return
			end
		end

		print(winid, 'not found.')
	end

	function AddNotification(winid)
		print(winid, 'added')
		table.insert(OpenNotifications, winid)
	end

	notify.setup {
		level = 2,
		timeout = 4000,
		max_width = 80,
		-- max_height = 20,
		minimum_width = 20,
		stages = 'fade_in_slide_out',
		background_colour = "#1e1e2e",
		icons = {
			DEBUG = '',
			ERROR = '',
			INFO = '',
			TRACE = '✎',
			WARN = '',
		},
		on_open = function(winid) end,
		on_close = function(winid) end,
		-- on_open = function(winid) AddNotification(winid) end,
		-- on_close = function(winid) RemoveNotification(winid) end,
		render = 'minimal', -- can be a function
		fps = 60,
		top_down = true, -- notifications at top
	}
	-- notify = require('notify')

	-- vim.notify = notify

	local function inspector(arg)
		if type(arg) == 'string' then
			arg = string.gsub(arg, '\n', '')
			return arg
		end
		return vim.inspect(arg)
	end

	function Formatter(...)
		local args = { ... }
		local message
		if #args > 1 then
			args = vim.tbl_map(inspector, args)
			message = table.concat(args, ' ')
		else
			message = inspector(args[1])
		end
		return message
	end

	Notify = function(...) notify(Formatter(...), nil) end

	-- for an individual notification
	local options = {
		-- title = string
		-- icon = string
		-- timeout = number|boolean
		-- on_open = function
		-- on_close = function
		-- keep = function
		-- render = function
		-- replace = integer|notify.Record
		-- hide_from_history = boolean
		-- animate = boolean
	}

	-- Notify(OpenNotifications)
	-- RemoveNotification()
	-- Notify(OpenNotifications)

	-- vim.notify('test message', nil, {
	-- 	title = 'A',
	-- 	timeout = 1000,
	-- 	hide_from_history = true,
	-- })

	local function example()
		local plugin = 'My Awesome Plugin'

		vim.notify('This is an error message.\nSomething went wrong!', 'error', {
			title = plugin,
			on_open = function()
				vim.notify('Attempting recovery.', vim.log.levels.WARN, { title = plugin })
				local timer = vim.loop.new_timer()
				timer:start(2000, 0, function()
					vim.notify({ 'Fixing problem.', 'Please wait...' }, 'info', {
						title = plugin,
						timeout = 3000,
						on_close = function()
							vim.notify('Problem solved', nil, { title = plugin })
							vim.notify('Error code 0x0395AF', 1, { title = plugin })
						end,
					})
				end)
			end,
		})
	end
	-- example()
end

return M
