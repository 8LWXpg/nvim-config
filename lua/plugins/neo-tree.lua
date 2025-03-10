return {
	"nvim-neo-tree/neo-tree.nvim",
	version = '*',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		filesystem = {
			hijack_netrw_behavior = "open_default",
		},
	},
}
