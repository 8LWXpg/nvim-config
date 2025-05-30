return {
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
}
