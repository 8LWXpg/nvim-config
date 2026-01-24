return {
	'esmuellert/codediff.nvim',
	dependencies = { 'MunifTanjim/nui.nvim' },
	version = '*',
	cmd = 'CodeDiff',
	opts = {
		explorer = {
			width = 30,
			initial_focus = 'modified',
		},
	},
}
