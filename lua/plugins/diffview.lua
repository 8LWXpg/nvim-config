return {
	'sindrets/diffview.nvim',
	cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
	opts = {
		enhanced_diff_hl = true,
		use_icons = true,
		view = {
			default = {
				layout = 'diff2_horizontal',
			},
			merge_tool = {
				layout = 'diff3_mixed',
				disable_diagnostics = true,
			},
		},
	},
}
