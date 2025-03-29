return {
	{
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
				},
				diagnostics = 'nvim_lsp',
				show_close_icon = false,
				show_buffer_close_icons = false,
			},
		},
	},
	{
		'OXY2DEV/markview.nvim',
		version = '*',
		ft = { 'markdown' },
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
			'MunifTanjim/nui.nvim',
		},
		opts = {
			sources = { 'filesystem', 'git_status' },
			filesystem = {
				hijack_netrw_behavior = 'open_default',
			},
			source_selector = {
				winbar = true,
			},
		},
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		keys = {
			{
				'<leader>?',
				function()
					require('which-key').show({ global = false })
				end,
				desc = 'Buffer Local Keymaps (which-key)',
			},
		},
	},
}
