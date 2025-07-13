return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		options = {
			disabled_filetypes = {
				statusline = { 'neo-tree', 'DiffviewFiles' },
			},
		},
		sections = {
			lualine_c = {
				{
					'filename',
					path = 1, -- 0 = just filename, 1 = relative, 2 = absolute
					shorting_target = 0,
				},
			},
		},

	},
}
