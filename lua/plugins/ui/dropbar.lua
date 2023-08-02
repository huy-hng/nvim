local M = {
	'Bekaboo/dropbar.nvim',
	event = 'VeryLazy',
}

function M.config()
	require('dropbar').setup {
		general = {
			---@type boolean|fun(buf: integer, win: integer): boolean
			enable = false,
			-- enable = function(buf, win)
			-- 	return not vim.api.nvim_win_get_config(win).zindex
			-- 		and vim.bo[buf].buftype == ''
			-- 		and vim.api.nvim_buf_get_name(buf) ~= ''
			-- 		and not vim.wo[win].diff
			-- end,
			update_interval = 5,
		},
		icons = {
			enable = true,
			ui = {
				bar = {
					separator = '  ',
					extends = '…',
				},
				menu = {
					separator = ' ',
					indicator = ' ',
				},
			},
		},
		bar = {
			sources = function(buf, _)
				local sources = require('dropbar.sources')
				local utils = require('dropbar.utils')
				if vim.bo[buf].ft == 'noice' then return end
				if vim.bo[buf].ft == 'markdown' then
					return {
						sources.path,
						utils.source.fallback {
							sources.treesitter,
							sources.markdown,
							sources.lsp,
						},
					}
				end
				return {
					sources.path,
					utils.source.fallback {
						sources.lsp,
						sources.treesitter,
					},
				}
			end,
			padding = { left = 0, right = 0 },
			truncate = false,
		},
	}
end

return M
