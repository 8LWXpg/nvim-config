return {
	'OXY2DEV/markview.nvim',
	-- version = '*',
	ft = { 'markdown', 'typst' },
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		'saghen/blink.cmp',
	},
	opts = {
		preview = {
			icon_provider = 'devicons',
		},
	},
}
