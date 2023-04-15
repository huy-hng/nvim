local M = {
	'codethread/qmk.nvim',
	ft = 'dts',
	branch = 'ZMK',
}

function M.config()
	local conf = {
		name = 'LAYOUT_preonic_grid',
		layout = {
			'x x x x x x _ _ _ _ _ x x x x x x',
			'x x x x x x _ _ _ _ _ x x x x x x',
			'x x x x x x x x _ x x x x x x x x',
			'_ _ _ x x x x x _ x x x x x _ _ _',
		},
		variant = 'zmk',
		-- auto_format_pattern = '*.keymap',
		comment_preview = {
			position = 'inside',
			keymap_overrides = {
				['&kp'] = '',
				['&mt'] = '',
				['&bt'] = '',
				['&rgb_ug'] = '',
				['&trans'] = '_____',
				['___'] = '_____',
				['&none'] = ' xxx ',

				['&nav_toggle'] = 'navipad',
				['&colon_swap'] = ': ;',
				['&dash_swap'] = '_ -',
				['&bspc_del'] = 'bspc/del',
				['RET'] = 'enter',
				['LALT'] = 'ALT',

				['COMMA'] = ' , ',
				['DOT'] = ' . ',
				['FSLH'] = ' / ',
				['MINUS'] = ' - ',
				['UNDER'] = ' _ ',
				['EQUAL'] = ' = ',
				['PLUS'] = ' + ',
				['LBRC'] = ' { ',
				['RBRC'] = ' } ',
				['LBKT'] = ' [ ',
				['RBKT'] = ' ] ',
				['BSLH'] = ' \\ ',
				['PIPE'] = ' | ',

				['SINGLE_QUOTE'] = '\' "',

				['GRAVE'] = ' ` ',
				['TILDE'] = ' ~ ',
				['EXCL']  = ' ! ',
				['AT']    = ' @ ',
				['POUND'] = ' # ',
				['DLLR']  = ' $ ',
				['PRCNT'] = ' %% ',
				['CARET'] = ' ^ ',
				['AMPS']  = ' amps& ',
				['STAR']  = ' * ',
				['LPAR']  = ' ( ',
				['RPAR']  = ' ) ',

				['&kp GT']  = ' > ',
				['&kp LT']  = ' < ',

				['KP_N0'] = ' 0 ',
				['KP_N1'] = ' 1 ',
				['KP_N2'] = ' 2 ',
				['KP_N3'] = ' 3 ',
				['KP_N4'] = ' 4 ',
				['KP_N5'] = ' 5 ',
				['KP_N6'] = ' 6 ',
				['KP_N7'] = ' 7 ',
				['KP_N8'] = ' 8 ',
				['KP_N9'] = ' 9 ',
				['KP_MULTIPLY'] = ' * ',
				['KP_EQUAL'] = ' = ',
				['KP_MINUS'] = ' - ',
				['KP_PLUS'] = ' + ',
				['KP_SLASH'] = ' / ',
				['KP_DOT'] = ' . ',
				['KP_COMMA'] = ' , ',

				['&'] = '',

				['LEFT_SHIFT'] = 'SHIFT',
				['LSHFT'] = 'SHIFT',
				['LCTRL'] = 'CTRL',
				['RCTRL'] = 'CTRL',
				['LMETA'] = 'META',
				['&hyper'] = 'hype',
			},
		},
	}
	require('qmk').setup(conf)
end

-- M.config()

return M
