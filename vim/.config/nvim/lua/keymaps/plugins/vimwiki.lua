local status, wk = pcall(require, 'which-key')
if not status then return end

local cmd = require 'core.wrappers'.cmd

wk.register({
	['<leader>v'] = {
		name = '+Vimwiki',
		w = 'Wiki Index',
		i = 'Diary Index',
		s = 'Select Wiki Index',
		d = { cmd('VimwikiMakeDiaryNote'), 'Daily Log Note' },
		y = { cmd('VimwikiMakeYesterdayDiaryNote'), 'Yesterday Log Note' },
		l = { cmd('VimwikiDiaryGenerateLinks'), 'Update Daily Log Note' },
		m = { cmd('VimwikiMakeTomorrowDiaryNote'), 'Tomorrow Log Note' },
		t = { cmd('VimwikiTabMakeDiaryNote'), 'Daily Log Tab' },
	}
})
