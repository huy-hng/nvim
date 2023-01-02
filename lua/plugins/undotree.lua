-- Window layout
-- style 1
-- +----------+------------------------+
-- |          |                        |
-- |          |                        |
-- | undotree |                        |
-- |          |                        |
-- |          |                        |
-- +----------+                        |
-- |          |                        |
-- |   diff   |                        |
-- |          |                        |
-- +----------+------------------------+
-- Style 2
-- +----------+------------------------+
-- |          |                        |
-- |          |                        |
-- | undotree |                        |
-- |          |                        |
-- |          |                        |
-- +----------+------------------------+
-- |                                   |
-- |   diff                            |
-- |                                   |
-- +-----------------------------------+
-- Style 3
-- +------------------------+----------+
-- |                        |          |
-- |                        |          |
-- |                        | undotree |
-- |                        |          |
-- |                        |          |
-- |                        +----------+
-- |                        |          |
-- |                        |   diff   |
-- |                        |          |
-- +------------------------+----------+
-- Style 4
-- +-----------------------++----------+
-- |                        |          |
-- |                        |          |
-- |                        | undotree |
-- |                        |          |
-- |                        |          |
-- +------------------------+----------+
-- |                                   |
-- |                            diff   |
-- |                                   |
-- +-----------------------------------+

local M = {
	'mbbill/undotree',
	event = 'BufReadPre',
}

function M.config()
	local g = vim.g

	g.undotree_WindowLayout = 1

	-- e.g. using 'd' instead of 'days' to save some space.
	g.undotree_ShortIndicators = 1

	-- undotree window width
	if g.undotree_ShortIndicators == 1 then
		g.undotree_SplitWidth = 30
	else
		g.undotree_SplitWidth = 40
	end

	-- diff window height
	g.undotree_DiffpanelHeight = 15

	-- auto open diff window
	g.undotree_DiffAutoOpen = 0

	-- if set, let undotree window get focus after being opened, otherwise
	-- focus will stay in current window.
	g.undotree_SetFocusWhenToggle = 0

	g.undotree_TreeNodeShape = '*'
	g.undotree_TreeVertShape = '|'
	g.undotree_TreeSplitShape = '/'
	g.undotree_TreeReturnShape = '\\'

	g.undotree_TreeNodeShape = '│' -- *◉
	g.undotree_TreeVertShape = '├' -- |│
	g.undotree_TreeSplitShape = '─┘' --╱ /
	g.undotree_TreeReturnShape = '─┐' --╲ \

	g.undotree_TreeNodeShape = '╳'
	g.undotree_TreeVertShape = '▏'
	g.undotree_TreeSplitShape = '╱'
	g.undotree_TreeReturnShape = '╲'

	g.undotree_TreeNodeShape = '▐'
	g.undotree_TreeVertShape = '▌'
	g.undotree_TreeSplitShape = '▞'
	g.undotree_TreeReturnShape = '▚'

	g.undotree_TreeNodeShape = '┃'
	g.undotree_TreeVertShape = '│'
	g.undotree_TreeSplitShape = ''
	g.undotree_TreeReturnShape = ''

	g.undotree_TreeNodeShape = '▕'
	g.undotree_TreeVertShape = '⋮'
	g.undotree_TreeSplitShape = '⋰'
	g.undotree_TreeReturnShape = '⋱'

	g.undotree_DiffCommand = 'diff'

	-- relative timestamp
	g.undotree_RelativeTimestamp = 1

	-- Highlight changed text
	g.undotree_HighlightChangedText = 1

	-- Highlight changed text using signs in the gutter
	g.undotree_HighlightChangedWithSign = 1

	-- Highlight linked syntax type.
	-- You may chose your favorite through ":hi" command
	g.undotree_HighlightSyntaxAdd = 'DiffAdd'
	g.undotree_HighlightSyntaxChange = 'DiffChange'
	g.undotree_HighlightSyntaxDel = 'DiffDelete'

	-- Show help line
	g.undotree_HelpLine = 1

	-- Show cursorline
	g.undotree_CursorLine = 1

	--=================================================
	-- User commands.
	-- command! -n=0 -bar UndotreeToggle   :call undotree#UndotreeToggle()
	-- command! -n=0 -bar UndotreeHide     :call undotree#UndotreeHide()
	-- command! -n=0 -bar UndotreeShow     :call undotree#UndotreeShow()
	-- command! -n=0 -bar UndotreeFocus    :call undotree#UndotreeFocus()

	-- open, focus, if focused close
	local function current_buffer()
		local current_ft = vim.bo.filetype
		-- current buffer is undotree
		if current_ft == 'undotree' then
			vim.cmd.UndotreeHide()
			return
		end

		local buffers = vim.api.nvim_list_bufs()
		for _, buf in ipairs(buffers) do
			if vim.bo[buf].filetype == 'undotree' then
				-- undotree opened but not focused
				vim.cmd.UndotreeFocus()
				return
			end
		end

		-- undotree not opened
		vim.cmd.UndotreeShow()
		vim.cmd.UndotreeFocus()
	end

	Nmap('<F5>', current_buffer)
end

return M
