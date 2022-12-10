
local start_or_pause_session = CMD('Obsession')
local stop_and_delete_session = CMD('Obsession!')

-- set to disable saving the session on BufEnter,
-- improving performance at the expense of safety 
vim.g.obsession_no_bufenter = false
