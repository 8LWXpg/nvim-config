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
	},
	{
		'sindrets/diffview.nvim',
		cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
		opts = {
			enhanced_diff_hl = true,
			use_icons = true,
			view = {
				default = { layout = 'diff2_horizontal' },
				merge_tool = {
					disable_diagnostics = true,
				},
			},
		},
	},
	{
		'OXY2DEV/markview.nvim',
		version = '*',
		ft = { 'markdown', 'typst' },
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
		lazy = false,
		---@module "neo-tree"
		---@type neotree.Config?
		opts = {
			sources = { 'filesystem', 'git_status' },
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
				group_empty_dirs = true,
				hijack_netrw_behavior = 'open_default',
				window = {
					width = 35,
				},
			},
			source_selector = {
				winbar = true,
			},
			default_component_configs = {
				modified = {
					symbol = '',
				},
			},
		},
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {
			preset = 'modern',
		},
		keys = {
			{
				'<leader>?',
				function()
					require('which-key').show({ global = true })
				end,
				desc = 'Buffer Local Keymaps (which-key)',
			},
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				disabled_filetypes = {
					statusline = { 'neo-tree', 'DiffviewFiles' },
				},
			},
		},
	},
}
