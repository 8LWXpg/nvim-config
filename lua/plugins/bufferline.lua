return {
	'akinsho/bufferline.nvim',
	version = '*',
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
		options = {
			offsets = {
				{
					filetype = 'DiffviewFiles',
					text = 'Diff View',
				},
				{
					filetype = 'snacks_layout_box',
					text = 'Snacks Picker',
				},
			},
			diagnostics = 'nvim_lsp',
			show_close_icon = false,
			show_buffer_close_icons = false,
			enforce_regular_tabs = true,
		},
	},
}
