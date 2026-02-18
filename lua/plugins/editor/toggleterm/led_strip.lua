local Terminal = require('toggleterm.terminal').Terminal
local exec = require('toggleterm').exec
local winman = require('modules.window_manager')

local is_running = false

-- 'nix-shell --command "PIPENV_VENV_IN_PROJECT=0 pipenv run python main.py"'
local run_locally = 'nix-shell --command "uv run main.py"'
local ssh = 'ssh -t pi@192.168.178.200 "sudo /home/pi/.local/bin/uv --directory /home/pi/repositories/led_strip run main.py"'
-- local ssh = ''
-- local command = 'ssh -t pi@192.168.178.200 sudo /home/pi/.local/share/virtualenvs/led_strip-XMPmSfNO/bin/python /home/pi/repositories/led_strip/main.py',

local function create_config(cmd)
	return {
	cmd = cmd,
	hidden = true,
	start_in_insert = false,
	close_on_exit = false,
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
	-- term: Terminal, job: number, data: string[], name: string
	on_stdout = function(term, job, data, name)
		-- for _, text in ipairs(data) do
			-- vim.notify(text)
		-- end
	end
}
end

local ssh_term = Terminal:new(create_config(ssh))
local local_term = Terminal:new(create_config(run_locally))

local function run_in_foreground(term)
	AutosaveSession(false)
	vim.cmd.write()
	local curr_win = winman.get_win()

	if not term:is_open() then
		nvim.defer(200, function()
			term:open()
			nvim.defer(400, function()
				winman.set_win(curr_win)
				vim.cmd.wincmd('=')
			end)
		end)
		return
	end


	-- nvim.feedkeys('i<C-c>')
	-- nvim.defer(100, function()
	term:shutdown()
	nvim.defer(200, function()
		term:open()
		nvim.schedule(winman.set_win, curr_win)
	end)
	-- end)

	AutosaveSession(true)

end

local function run_in_background(term)
	AutosaveSession(false)

	term:toggle()
	nvim.feedkeys('i<C-c>')
	nvim.defer(100, function()
		term:shutdown()

		nvim.defer(200, function()
			term:spawn()
		end)
	end)

	AutosaveSession(true)
end

Map.n('<localleader>j', {run_in_foreground, local_term}, 'run led_strip script on rpi zero')
Map.n('<C-.>', {run_in_foreground, ssh_term}, 'run led_strip script on rpi zero')
