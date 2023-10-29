local M = {
	'codethread/qmk.nvim',
	ft = 'dts',
}

function M.config()
	local function format(str) return string.format(' %s ', str) end
	local overrides = {
		-- [''] = format(''),
		-- ['&'] = '',
		['_oo_'] = '---',
		['____'] = '   ',

		['&kp '] = '',
		['&kp (%a)$'] = format('%1'),
		['&mo '] = ' ',
		['&tog '] = ' ',

		['&kp_(%a+) '] = '',
		['&mo_(%a+) '] = ' ',
		['&mt (.*) (.*)'] = '%1│%2',
		['&mt(%a*)_(%a+) (.*) (.*)'] = '%3│%4',
		['&lt(%a*)_(%a+) (.*) (.*)'] = '%3│%4',
		['&ht_(%a+) (.*) (.*)'] = '%2│%3',
		-- ['&lt_(%a+) (.*) (.*)'] = ' %2│%3',

		['&key_repeat'] = 'repeat',
		['&td_(%a+)'] = '%1',
		['&tap_settings'] = 'settings',
		['LA%(PIPE%)'] = format(''),

		--------------------------------------------Layers------------------------------------------

		SETTINGS_HUE = 'HUE',

		---------------------------------------------Keys-------------------------------------------
		['SPACE'] = format('␣'),
		['RET'] = format('⏎'),
		['TAB'] = format('⭾'),
		['ESC'] = format('⎋'),
		['BSPC'] = format('⌫'),
		['BACKSPACE'] = format('⌫'),
		['DEL'] = format('⌦'),

		['(%u)ALT'] = format('⎇'),
		['(%u)CTRL'] = format('⌃'),
		['(%u)SHIFT'] = format('⇧'),
		['&capsword'] = format('⇧'),
		['(%u)META'] = format('◆'),

		-------------------------------------------Symbols------------------------------------------

		['COMMA'] = format(','),
		['SEMI'] = format(';'),
		['COLON'] = format(':'),
		['DOT'] = format('.'),
		['FSLH'] = format('/'),
		['QMARK'] = format('?'),
		['MINUS'] = format('-'),
		['UNDER'] = format('_'),
		['EQUAL'] = format('='),
		['PLUS'] = format('+'),
		['LBRC'] = format('{'),
		['RBRC'] = format('}'),
		['LBKT'] = format('['),
		['RBKT'] = format(']'),
		['BSLH'] = format('\\'),
		['PIPE'] = format('|'),

		['SINGLE_QUOTE'] = format("'"),
		['SQT'] = format("'"),

		['GRAVE'] = format('`'),
		['TILDE'] = format('~'),
		['EXCL'] = format('!'),
		['AT'] = format('@'),
		['POUND'] = format('#'),
		['DLLR'] = format('$'),
		['PRCNT'] = format('%%'),
		['CARET'] = format('^'),
		['AMPS'] = format('&'),
		['STAR'] = format('*'),
		['LPAR'] = format('('),
		['RPAR'] = format(')'),

		['RA%(LS%(SINGLE_QUOTE%)%)'] = format('¨'),

		['&kp GT'] = format('>'),
		['&kp LT'] = format('<'),

		['&kp N(%d)'] = format('%1'),
		['&kp KP_N(%d)'] = format('%1'),
		['&kp KP_(.*)'] = '%1',

		-------------------------------------------Settings-----------------------------------------

		-- bluetooth
		['&bt'] = '',
		['&bootloader'] = 'boot',
		['&visual_boot'] = 'boot',
		['&bt(%d)'] = 'bt %1',
		['&out OUT_TOG'] = 'Toggle Output',
		BT_CLR = 'Clear BT',

		-- rgb
		['&rgb_ug '] = '',
		['RGB_TOG'] = 'Toggle light',
		['RGB_EFF'] = 'Next Eff',
		['RGB_EFR'] = 'Prev Eff',
		['RGB_BRI'] = 'Inc Bri',
		['RGB_BRD'] = 'Dec Bri',
		['RGB_SPI'] = 'Inc Speed',
		['RGB_SPD'] = 'Dec Speed',
		['RGB_SAI'] = 'Inc Sat',
		['RGB_SAD'] = 'Dec Sat',
		['RGB_HUI'] = 'Inc Hue',
		['RGB_HUD'] = 'Dec Hue',
	}

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
			keymap_overrides = overrides,
			symbols = {
				space = ' ',
				horz = '─',
				vert = '│',

				tl = '╭',
				tm = '┬',
				tr = '╮',

				ml = '├',
				mm = '┼',
				mr = '┤',

				bl = '╰',
				bm = '┴',
				br = '╯',
			},
		},
	}
	require('qmk').setup(conf)
end

-- M.config()

return M
