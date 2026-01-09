return {
	'sschleemilch/slimline.nvim',
	event = 'UIEnter',
	opts = {
		configs = {
			path = {
				hl = {
					primary = 'Define',
				},
			},
			git = {
				hl = {
					primary = 'Function',
				},
			},
			filetype_lsp = {
				hl = {
					primary = 'String',
				},
			},
		},
		disabled_filetypes = {
			'snacks_layout_box',
			'copilot-chat',
			'codediff-explorer',
		},
	},
}
