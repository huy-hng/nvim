local status, comment = pcall(require, 'Comment.api')
if not status then
	return
end

local create_divider = function(size, divider)
	comment.toggle.linewise.current(nil, {})
	local comment_len = vim.fn.strlen(vim.fn.getline('.'))
	local cmd = 'A' .. vim.fn['repeat'](divider, size - comment_len)
	-- Schedule(Feedkeys, cmd)
	Normal(cmd)
end

function Sectionize(size, location, divider, surround)
	Normal('O')
	create_divider(size, divider)

	vim.fn.cursor { vim.fn.line('.') + 1, 1 }

	Normal('i' .. surround[1])
	Normal('A' .. surround[2])

	comment.toggle.linewise.current()

	local text_len = vim.fn.strlen(vim.fn.getline('.'))
	local text_middle = vim.fn.floor(text_len / 2.0)
	local spaces = location * size - text_middle
	spaces = spaces - 2

	vim.fn.cursor { vim.fn.line('.'), 2 }
	Normal('wi' .. vim.fn['repeat'](' ', vim.fn.float2nr(spaces)))
	Normal('o')
	create_divider(size, divider)
end

vim.api.nvim_create_user_command('SmallSection', function()
	Sectionize(40, 0.5, '-', { '-> ', ' <-' })
end, {})

vim.api.nvim_create_user_command('BigSection', function()
	Sectionize(80, 0.5, '=', { '|=> ', ' <=|' })
end, {})
