local M = {
	'akinsho/bufferline.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	event = 'VeryLazy',
}

function M.config()
	local bufferline = require('bufferline')
	local groups = require('bufferline.groups')

	-- local highlights = require('catppuccin.groups.integrations.bufferline')

	bufferline.setup {
		highlights = require('plugins.ui.bufferline.highlights'),
		options = {
			-- mode = 'tabs',
			numbers = 'ordinal', -- | 'ordinal' | 'buffer_id' | 'both' | function({ ordinal, id, lower, raise }): string,
			-- numbers = function(opts)
			--	return string.format('%s.%s', opts.ordinal, opts.lower(opts.id))
			-- end,
			close_command = 'Bdelete! %d', -- can be a string | function, see 'Mouse actions'
			right_mouse_command = 'Bdelete! %d', -- can be a string | function, see 'Mouse actions'
			left_mouse_command = 'buffer %d', -- can be a string | function, see 'Mouse actions'
			middle_mouse_command = nil, -- can be a string | function, see 'Mouse actions'

			-- focused can be thought of as right side of current buffer
			-- separator_style = {'║', ' '}, -- [focused and unfocused]
			indicator = { -- and indicator.icon can be thought of as left side
				icon = '║', -- this should be omitted if indicator style is not 'icon'
				style = 'underline', -- icon | underline | none
			},
			-- separator_style = {'║', '│'},
			buffer_close_icon = '',
			modified_icon = '●',
			close_icon = '',
			left_trunc_marker = '',
			right_trunc_marker = '',

			--- name_formatter can be used to change the buffer's label in the bufferline.
			--- Please note some names can/will break the
			--- bufferline so use this at your discretion knowing that it has
			--- some limitations that will *NOT* be fixed.
			-- name_formatter = function(buf) -- buf contains a 'name', 'path' and 'bufnr'
			-- 	-- remove extension from markdown files for example
			-- 	if buf.name:match('%.md') then
			-- 		return vim.fn.fnamemodify(buf.name, ':t:r')
			-- 	end
			-- end,
			----------------------------------------
			--             -> Size <-
			----------------------------------------
			enforce_regular_tabs = false,
			tab_size = 1,
			max_name_length = 18,
			max_prefix_length = 15, -- prefix used when a buffer is de-duplicated

			diagnostics = false, -- | 'nvim_lsp' | 'coc',
			diagnostics_update_in_insert = false,
			-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
			--	 return '('..count..')'
			-- end,
			-- NOTE: this will be called a lot so don't do any heavy processing here
			----------------------------------------
			--            -> Filter <-
			----------------------------------------
			custom_filter = function(bufnr)
				--	 -- filter out filetypes you don't want to see
				local filetypes = { 'sql', 'vimwiki' }
				local ft = vim.bo[bufnr].filetype
				if not vim.tbl_contains(filetypes, ft) then return true end

				-- filter out by buffer name
				-- if vim.fn.bufname(buf_number) ~= '<buffer-name-I-dont-want>' then
				-- 	return true
				-- end

				-- filter out based on arbitrary rules
				-- e.g. filter out vim wiki buffer from tabline in your work repo
				-- if vim.fn.getcwd() == '<work-repo>' and vim.bo[buf_number].filetype ~= 'wiki' then
				-- 	return true
				-- end
			end,
			offsets = {
				{
					filetype = 'NvimTree',
					text = 'Nvim Tree',
					text_align = 'center',
					separator = true,
					padding = 1,
				},
			},
			color_icons = true, -- whether or not to add the filetype icon highlights
			show_buffer_icons = true, -- disable filetype icons for buffers
			show_buffer_close_icons = true,
			show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
			show_close_icon = false,
			show_tab_indicators = false,
			show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			-- can also be a table containing 2 custom separators
			-- [focused and unfocused]. eg: { '|', '|' }
			-- separator_style = 'thin', -- "slant" | "thick" | "thin" | { 'any', 'any' },
			separator_style = { '', '' },
			-- separator_style = {'||', '/\\'},
			always_show_bufferline = true,
			hover = {
				enabled = true,
				delay = 200,
				reveal = { 'close' },
			},
			sort_by = 'directory', -- 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
			--	 -- add custom logic
			--	 return buffer_a.modified > buffer_b.modified
			-- end
			groups = {
				options = {
					toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
				},
				items = {
					groups.builtin.pinned:with { icon = '' },
					groups.builtin.ungrouped,
					-- groups.builtin.ungrouped:with {
					-- 	name = 'ungrouped',
					-- 	auto_close = false,
					-- },
					-- {
					-- 	name = 'Vimwiki',
					-- 	-- icon = "", -- Optional
					-- 	-- highlight = { underline = false, sp = "blue" }, -- Optional
					-- 	-- priority = 2, -- determines where it will appear relative to other groups (Optional)
					-- 	auto_close = true, -- whether or not close this group if it doesn't contain the current buffer
					-- 	-- priority = 2, -- determines where it will appear relative to other groups (Optional)
					-- 	matcher = function(buf) return buf.filename:match('%.md') end,
					-- 	separator = { -- Optional
					-- 		style = require('bufferline.groups').separator.tab,
					-- 	},
					-- },
				},
			},
		},
	}
end

return M
