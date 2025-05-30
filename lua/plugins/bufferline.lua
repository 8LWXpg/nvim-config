return {
	'akinsho/bufferline.nvim',
	version = '*',
	event = 'VeryLazy',
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
		options = {
			offsets = {
				{
					filetype = 'neo-tree',
					text = 'Neo Tree',
				},
				{
					filetype = 'DiffviewFiles',
					text = 'Diff View',
				},
			},
			diagnostics = 'nvim_lsp',
			show_close_icon = false,
			show_buffer_close_icons = false,
			enforce_regular_tabs = true,
		},
	},
}
