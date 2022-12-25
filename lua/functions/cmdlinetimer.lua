
	-- autocmd('InsertEnter', { print, 'insert' }),
	-- autocmd('InsertLeave', { print, 'normal' }),

local prev_mess = nil
-- StopFetching = true

local counter = 0
local function show_message()
	if prev_mess ~= vim.v.statusmsg then
		prev_mess = vim.v.statusmsg
		vim.o.cmdheight = 1
		print(counter)
		counter = counter + 1
		-- Schedule(vim.cmd.echo, 'v:statusmsg')
		-- Defer(4000, function() vim.o.cmdheight = 0 end)
	end
end

local queue = {}


local function promise(id)

	local fn = queue[id]
	-- print('in promise with id and fn', id, fn)
	if fn ~= nil then fn() end
end

local function timer(time, fn)
	if StopFetching then return end
	local id = tostring(os.clock())
	for old_id, old_fn in pairs(queue) do
		-- print(old_fn, fn)
		if old_fn == fn then
			queue[old_id] = nil
		end
	end
	queue[id] = fn
	nvim.defer(time, promise, id)
	nvim.defer(time, timer, time, fn)
end

-- timer(100 , show_message)



-- Defer(500, timer, 500, shoiw_message)
-- Defer(600, timer, 500, show_message)
-- Defer(700, timer, 500, show_message)
-- Defer(800, timer, 500, show_message)

-- local function fetch_messages()
-- 	if StopFetching then return end

-- 	if prev_mess ~= vim.v.statusmsg then
-- 		prev_mess = vim.v.statusmsg
-- 		vim.o.cmdheight = 1
-- 		print(vim.v.statusmsg)
-- 		Defer(4000, function() vim.o.cmdheight = 0 end)
-- 	end
-- 	Defer(500, fetch_messages)
-- end

-- vim.wait(4000, show_message, 500)

-- fetch_messages()
