return {
	'williamboman/mason-lspconfig.nvim',
	'williamboman/mason.nvim',
	'neovim/nvim-lspconfig',
	{
		'saghen/blink.cmp',
		version = '1.*',
		event = 'InsertEnter',
		dependencies = { 'rafamadriz/friendly-snippets' },
		opts = {
			completion = {
				accept = { auto_brackets = { enabled = true } },
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
		'folke/noice.nvim',
		event = 'VeryLazy',
	},
}
