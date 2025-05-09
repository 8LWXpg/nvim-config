return {
	{
		'mason-org/mason-lspconfig.nvim',
		version = '2.*',
		opts = {
			ensure_installed = { 'lua_ls' },
		},
	},
	{
		'mason-org/mason.nvim',
		version = '2.*',
		config = true,
	},
	'neovim/nvim-lspconfig',
	{
		'saghen/blink.cmp',
		version = '1.*',
		dependencies = { 'rafamadriz/friendly-snippets' },
		opts = {
			completion = {
				accept = { auto_brackets = { enabled = false } },
				documentation = { auto_show = true },
			},
			keymap = { preset = 'super-tab' },
			cmdline = {
				completion = {
					menu = { auto_show = true },
				},
				keymap = { preset = 'inherit' },
			},
			sources = {
				providers = {
					cmdline = {
						-- ignores cmdline completions when executing shell commands
						enabled = function()
							return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
						end,
					},
				},
			},
		},
	},
}
