local M = {
	'codethread/qmk.nvim',
	ft = 'dts',
	branch = 'ZMK',
}

function M.config()
	local conf = {
		name = 'LAYOUT_preonic_grid',
		layout = {
			'_ _ _ x x x x x x _ _ _ _ _ x x x x x x',
			'_ _ _ x x x x x x _ _ _ _ _ x x x x x x',
			'_ _ _ x x x x x x x x _ x x x x x x x x',
			'_ _ _ _ _ _ x x x x x _ x x x x x _ _ _',
		},
		variant = 'zmk',
		-- auto_format_pattern = '*.keymap',
		comment_preview = {
			position = 'inside',
			keymap_overrides = {
				['&kp'] = '',
				['&mt'] = '',
				['&rgb_ug'] = '',
				['&rgb'] = '',
				-- ['____'] = '______',
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
				['EXCL'] = ' ! ',
				['AT'] = ' @ ',
				['POUND'] = ' # ',
				['DLLR'] = ' $ ',
				['PRCNT'] = ' %% ',
				['CARET'] = ' ^ ',
				['AMPS'] = ' AND ',
				['STAR'] = ' * ',
				['LPAR'] = ' ( ',
				['RPAR'] = ' ) ',

				['&kp GT'] = ' > ',
				['&kp LT'] = ' < ',

				['N0'] = ' 0 ',
				['N1'] = ' 1 ',
				['N2'] = ' 2 ',
				['N3'] = ' 3 ',
				['N4'] = ' 4 ',
				['N5'] = ' 5 ',
				['N6'] = ' 6 ',
				['N7'] = ' 7 ',
				['N8'] = ' 8 ',
				['N9'] = ' 9 ',
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
				['KP_MULTIPLY'] = ' *  ',
				['KP_EQUAL'] = ' =  ',
				['KP_MINUS'] = ' -  ',
				['KP_PLUS'] = ' +  ',
				['KP_SLASH'] = ' /  ',
				['KP_DOT'] = ' .  ',
				['KP_COMMA'] = ' ,  ',

				['&'] = '',

				['LEFT_SHIFT'] = 'SHIFT',
				['LSHFT'] = 'SHIFT',
				['LCTRL'] = 'CTRL',
				['RCTRL'] = 'CTRL',
				['LMETA'] = 'META',
				['&hyper'] = 'hype',

				-- bluetooth
				['&out OUT_TOG'] = 'Toggle Output',
				BT_CLR = 'Clear BT',

				-- rgb
				['&rgb TOG'] = 'Toggle light',
				['&rgb EFF'] = 'Next Effect',
				['&rgb EFR'] = 'Prev Effect',
				['&rgb BRI'] = 'Inc Bright',
				['&rgb BRD'] = 'Dec Bright',
				['&rgb SPI'] = 'Inc Ani Speed',
				['&rgb SPD'] = 'Dec Ani Speed',
				['&rgb SAI'] = 'Inc Sat',
				['&rgb SAD'] = 'Dec Sat',
				['&rgb HUI'] = 'Inc Hue',
				['&rgb HUD'] = 'Dec Hue',
			},
		},
	}
	require('qmk').setup(conf)
end

-- M.config()

return M
