local M = {}

-- enum vs alias
-- enum has no completion when doing
-- if myenum == '...'
-- but alias does
-- 
-- they both however provide completion when use as a type for a function param
-- i personally like alias more for completion and readability

---@alias win_type
---| '' normal window
---| 'autocmd' autocommand window. Temporary window used to execute autocommands.
---| 'command' command window
---| 'loclist' location list
---| 'popup' floating window
---| 'preview' preview window
---| 'quickfix' quickfix list
---| 'unknown' winid not found

---@alias buftype
---| '' normal buffer
---| 'acwrite'
---| 'help'	
---| 'nofile'
---| 'nowrite'
---| 'quickfix'
---| 'terminal'
---| 'prompt'

M.win_types = {
	-- ['(empty)'] = '(empty)', -- normal window
	autocmd = 'autocmd',
	command = 'command',
	loclist = 'loclist',
	popup = 'popup',
	preview = 'preview',
	quickfix = 'quickfix',
	unknown = 'unknown',
}

---@alias autocmd_events
---| 'BufAdd'
---| 'BufDelete'
---| 'BufEnter'
---| 'BufFilePost'
---| 'BufFilePre'
---| 'BufHidden'
---| 'BufLeave'
---| 'BufModifiedSet'
---| 'BufNew'
---| 'BufNewFile'
---| 'BufRead'
---| 'BufReadPost'
---| 'BufReadCmd'
---| 'BufReadPre'
---| 'BufUnload'
---| 'BufWinEnter'
---| 'BufWinLeave'
---| 'BufWipeout'
---| 'BufWriteor'
---| 'BufWritePre'
---| 'BufWriteCmd'
---| 'BufWritePost'
---| 'ChanInfo'
---| 'ChanOpen'
---| 'CmdUndefined'
---| 'CmdlineChanged'
---| 'CmdlineEnter'
---| 'CmdlineLeave'
---| 'CmdwinEnter'
---| 'CmdwinLeave'
---| 'ColorScheme'
---| 'ColorSchemePre'
---| 'CompleteChanged'
---| 'CompleteDonePre'
---| 'CompleteDone'
---| 'CursorHold'
---| 'CursorHoldI'
---| 'CursorMoved'
---| 'CursorMovedI'
---| 'DiffUpdated'
---| 'DirChanged'
---| 'DirChangedPre'
---| 'ExitPre'
---| 'FileAppendCmd'
---| 'FileAppendPost'
---| 'FileAppendPre'
---| 'FileChangedRO'
---| 'FileChangedShell'
---| 'FileChangedShellPost'
---| 'FileReadCmd'
---| 'FileReadPost'
---| 'FileReadPre'
---| 'FileType'
---| 'FileWriteCmd'
---| 'FileWritePost'
---| 'FileWritePre'
---| 'FilterReadPost'
---| 'FilterReadPre'
---| 'FilterWritePost'
---| 'FilterWritePre'
---| 'FocusGained'
---| 'FocusLost'
---| 'FuncUndefined'
---| 'UIEnter'
---| 'UILeave'
---| 'InsertChange'
---| 'InsertCharPre'
---| 'InsertEnter'
---| 'InsertLeavePre'
---| 'InsertLeave'
---| 'MenuPopup'
---| 'ModeChanged'
---| 'OptionSet'
---| 'QuickFixCmdPre'
---| 'QuickFixCmdPost'
---| 'QuitPre'
---| 'RemoteReply'
---| 'SearchWrapped'
---| 'RecordingEnter'
---| 'RecordingLeave'
---| 'SessionLoadPost'
---| 'ShellCmdPost'
---| 'Signal'
---| 'ShellFilterPost'
---| 'SourcePre'
---| 'SourcePost'
---| 'SourceCmd'
---| 'SpellFileMissing'
---| 'StdinReadPost'
---| 'StdinReadPre'
---| 'SwapExists'
---| 'Syntax'
---| 'TabEnter'
---| 'TabLeave'
---| 'TabNew'
---| 'TabNewEntered'
---| 'TabClosed'
---| 'TermOpen'
---| 'TermEnter'
---| 'TermLeave'
---| 'TermClose'
---| 'TermResponse'
---| 'TextChanged'
---| 'TextChangedI'
---| 'TextChangedP'
---| 'TextYankPost'
---| 'User'
---| 'UserGettingBored'
---| 'VimEnter'
---| 'VimLeave'
---| 'VimLeavePre'
---| 'VimResized'
---| 'VimResume'
---| 'VimSuspend'
---| 'WinClosed'
---| 'WinEnter'
---| 'WinLeave'
---| 'WinNew'
---| 'WinScrolled'
M.events = {
	BufAdd = 'BufAdd',
	BufDelete = 'BufDelete',
	BufEnter = 'BufEnter',
	BufFilePost = 'BufFilePost',
	BufFilePre = 'BufFilePre',
	BufHidden = 'BufHidden',
	BufLeave = 'BufLeave',
	BufModifiedSet = 'BufModifiedSet',
	BufNew = 'BufNew',
	BufNewFile = 'BufNewFile',
	BufRead = 'BufRead',
	BufReadPost = 'BufReadPost',
	BufReadCmd = 'BufReadCmd',
	BufReadPre = 'BufReadPre',
	BufUnload = 'BufUnload',
	BufWinEnter = 'BufWinEnter',
	BufWinLeave = 'BufWinLeave',
	BufWipeout = 'BufWipeout',
	BufWriteor = 'BufWriteor',
	BufWritePre = 'BufWritePre',
	BufWriteCmd = 'BufWriteCmd',
	BufWritePost = 'BufWritePost',
	ChanInfo = 'ChanInfo',
	ChanOpen = 'ChanOpen',
	CmdUndefined = 'CmdUndefined',
	CmdlineChanged = 'CmdlineChanged',
	CmdlineEnter = 'CmdlineEnter',
	CmdlineLeave = 'CmdlineLeave',
	CmdwinEnter = 'CmdwinEnter',
	CmdwinLeave = 'CmdwinLeave',
	ColorScheme = 'ColorScheme',
	ColorSchemePre = 'ColorSchemePre',
	CompleteChanged = 'CompleteChanged',
	CompleteDonePre = 'CompleteDonePre',
	CompleteDone = 'CompleteDone',
	CursorHold = 'CursorHold',
	CursorHoldI = 'CursorHoldI',
	CursorMoved = 'CursorMoved',
	CursorMovedI = 'CursorMovedI',
	DiffUpdated = 'DiffUpdated',
	DirChanged = 'DirChanged',
	DirChangedPre = 'DirChangedPre',
	ExitPre = 'ExitPre',
	FileAppendCmd = 'FileAppendCmd',
	FileAppendPost = 'FileAppendPost',
	FileAppendPre = 'FileAppendPre',
	FileChangedRO = 'FileChangedRO',
	FileChangedShell = 'FileChangedShell',
	FileChangedShellPost = 'FileChangedShellPost',
	FileReadCmd = 'FileReadCmd',
	FileReadPost = 'FileReadPost',
	FileReadPre = 'FileReadPre',
	FileType = 'FileType',
	FileWriteCmd = 'FileWriteCmd',
	FileWritePost = 'FileWritePost',
	FileWritePre = 'FileWritePre',
	FilterReadPost = 'FilterReadPost',
	FilterReadPre = 'FilterReadPre',
	FilterWritePost = 'FilterWritePost',
	FilterWritePre = 'FilterWritePre',
	FocusGained = 'FocusGained',
	FocusLost = 'FocusLost',
	FuncUndefined = 'FuncUndefined',
	UIEnter = 'UIEnter',
	UILeave = 'UILeave',
	InsertChange = 'InsertChange',
	InsertCharPre = 'InsertCharPre',
	InsertEnter = 'InsertEnter',
	InsertLeavePre = 'InsertLeavePre',
	InsertLeave = 'InsertLeave',
	MenuPopup = 'MenuPopup',
	ModeChanged = 'ModeChanged',
	OptionSet = 'OptionSet',
	QuickFixCmdPre = 'QuickFixCmdPre',
	QuickFixCmdPost = 'QuickFixCmdPost',
	QuitPre = 'QuitPre',
	RemoteReply = 'RemoteReply',
	SearchWrapped = 'SearchWrapped',
	RecordingEnter = 'RecordingEnter',
	RecordingLeave = 'RecordingLeave',
	SessionLoadPost = 'SessionLoadPost',
	ShellCmdPost = 'ShellCmdPost',
	Signal = 'Signal',
	ShellFilterPost = 'ShellFilterPost',
	SourcePre = 'SourcePre',
	SourcePost = 'SourcePost',
	SourceCmd = 'SourceCmd',
	SpellFileMissing = 'SpellFileMissing',
	StdinReadPost = 'StdinReadPost',
	StdinReadPre = 'StdinReadPre',
	SwapExists = 'SwapExists',
	Syntax = 'Syntax',
	TabEnter = 'TabEnter',
	TabLeave = 'TabLeave',
	TabNew = 'TabNew',
	TabNewEntered = 'TabNewEntered',
	TabClosed = 'TabClosed',
	TermOpen = 'TermOpen',
	TermEnter = 'TermEnter',
	TermLeave = 'TermLeave',
	TermClose = 'TermClose',
	TermResponse = 'TermResponse',
	TextChanged = 'TextChanged',
	TextChangedI = 'TextChangedI',
	TextChangedP = 'TextChangedP',
	TextYankPost = 'TextYankPost',
	User = 'User',
	UserGettingBored = 'UserGettingBored',
	VimEnter = 'VimEnter',
	VimLeave = 'VimLeave',
	VimLeavePre = 'VimLeavePre',
	VimResized = 'VimResized',
	VimResume = 'VimResume',
	VimSuspend = 'VimSuspend',
	WinClosed = 'WinClosed',
	WinEnter = 'WinEnter',
	WinLeave = 'WinLeave',
	WinNew = 'WinNew',
	WinScrolled = 'WinScrolled',
}


return M
