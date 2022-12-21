-----------------------------------------------Both-------------------------------------------------
local function create_line(line, char)
	local width = vim.fn.strdisplaywidth(line)
	return Repeat(char, width)
end

local function len(str)
	return vim.fn.strdisplaywidth(str)
end

local function fill_background(lines, char)
	for i, line in ipairs(lines) do
		lines[i] = string.gsub(line, ' ', char)
	end
	return lines
end

-----------------------------------------------Sides------------------------------------------------

local function add_side(lines, char, amount)
	for i, line in ipairs(lines) do
		local side = Repeat(char, amount)
		line = side .. line .. side
		lines[i] = line
	end
	return lines
end

----------------------------------------------Borders-----------------------------------------------

local function add_lines(lines, char, amount)
	local line = create_line(lines[1], char)
	for _ = 1, amount do
		table.insert(lines, 1, line)
		table.insert(lines, #lines + 1, line)
	end
	return lines
end

------------------------------------------Final Functions-------------------------------------------
local function add_border(lines, opts)
	lines = add_side(lines, opts.border_side, opts.border_thickness)

	local top_border = create_line(lines[1], opts.border_top)
	local bot_border = create_line(lines[1], opts.border_bot)
	table.insert(lines, 1, top_border)
	table.insert(lines, #lines + 1, bot_border)
	return lines
end

local function add_padding(lines, char, padding)
	lines = add_side(lines, char, padding * 2)
	lines = add_lines(lines, char, padding)
	return lines
end

local function default_borderer(lines, borders)

	local orig_len = len(lines[1])
	-- could be an add sides function
	for i, line in ipairs(lines) do
		lines[i] = borders[8] .. line .. borders[4]
	end

	-- could be create line function
	local top_border = borders[1] .. Repeat(borders[2], orig_len) .. borders[3]
	local bot_border = borders[7] .. Repeat(borders[6], orig_len) .. borders[5]
	table.insert(lines, 1, top_border)
	table.insert(lines, #lines + 1, bot_border)
	return lines
end

-- 1223
-- 8  4
-- 8  4
-- 7665

-----------------------------------------------Main-------------------------------------------------

local function boxer(lines, opts)
	-- lines = add_border(lines, opts)

	lines = fill_background(lines, opts.bg_char)
	lines = add_padding(lines, opts.bg_char, opts.padding)
	lines = default_borderer(lines, opts.border)

	-- lines = add_padding(lines, opts.border_side, opts.border_thickness)
	return lines
end

local nvim = {
	[[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
	[[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
	[[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
	[[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
	[[██   ████ ███████  ██████    ████   ██ ██      ██]],
}

local simple_opts = {
	bg_char = '░',
	border_top = '▄',
	border_side = '█',
	border_bot = '▀',
	padding = 1,
	border_thickness = 1,
}

local opts = {
	bg_char = ' ',
	-- border = { '▄', '▄', '▄', '█', '▀', '▀', '▀', '█' },

	border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
	padding = 2,
}



local result = boxer(nvim, opts)
-- P(result)
print(' ')
for _, line in ipairs(result) do
	print(line)
end


-- outside box
-- top/bot first, then sides
-- █ ▀ █

-- █   █

-- █ ▄ █



-- inside box
-- sides first then top/bot
-- ▄ ▄ ▄

-- █   █

-- ▀ ▀ ▀
