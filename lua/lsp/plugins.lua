return {
	"williamboman/mason-lspconfig.nvim",
	'williamboman/mason.nvim',
	'neovim/nvim-lspconfig',
	{
		'saghen/blink.cmp',
		dependencies = { 'rafamadriz/friendly-snippets' },
		version = '1.*',
		opts = {
			completion = {
				accept = { auto_brackets = { enabled = true }, },
				documentation = { auto_show = true },
				ghost_text = { enabled = true },
			},
			keymap = { preset = 'super-tab' },
			cmdline = {
				completion = {
					menu = { auto_show = true },
					ghost_text = { enabled = true },
				},
				keymap = { preset = 'inherit' },
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
	},
}
