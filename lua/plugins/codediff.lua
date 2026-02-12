return {
	'esmuellert/codediff.nvim',
	dependencies = { 'MunifTanjim/nui.nvim' },
	version = '*',
	cmd = 'CodeDiff',
	opts = {
		diff = {
			ignore_trim_whitespace = true,
		},
		explorer = {
			width = 30,
			initial_focus = 'modified',
		},
	},
}
