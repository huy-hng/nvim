local Terminal = require('toggleterm.terminal').Terminal
local exec = require('toggleterm').exec
local winman = require('modules.window_manager')

local is_running = false

local led_strip = Terminal:new({
	cmd = 'ssh -t pi@192.168.178.200 sudo /home/pi/.local/share/virtualenvs/led_strip-XMPmSfNO/bin/python /home/pi/repositories/led_strip/main.py',
	hidden = true,
	start_in_insert = false,
	close_on_exit = true,
	count = 1,
	direction = 'vertical',
	on_create = function(term) -- function to run when the terminal is first created
		Map.t('<esc>', [[<C-\><C-n>]], 'Enter Normal Mode', { buffer = term.bufnr })
		Map.n('<esc>', 'i<C-c>', 'Exit script', { buffer = term.bufnr })
		Map.n('q', 'i<C-c>', 'Exit script', { buffer = term.bufnr })
		Map.n('<C-c>', 'i<C-c>', 'Exit script', { buffer = term.bufnr })
		is_running = true
	end,
	on_exit = function(term, job, exit_code, name) -- function to run when terminal process exits
		-- vim.notify('exited')
	end,
	on_close = function(term)
		-- vim.notify('closed')
		-- term_winid = nil
	end,
})

Map.n('<localleader>j', function()
	led_strip:toggle()
end, 'run led_strip script on rpi zero')

Map.n('<C-.>', function()
	AutosaveSession(false)

	led_strip:toggle()
	nvim.feedkeys('i<C-c>')
	nvim.defer(100, function()
		led_strip:shutdown()

		nvim.defer(200, function()
			led_strip:spawn()
		end)
	end)

	AutosaveSession(true)
end, 'run led_strip script on rpi zero')
