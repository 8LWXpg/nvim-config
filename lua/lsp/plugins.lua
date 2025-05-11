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
	{
		'neovim/nvim-lspconfig',
		version = '2.*',
	},
	{
		'folke/lazydev.nvim',
		ft = 'lua', -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
			},
		},
	},
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
				default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					lazydev = {
						name = 'LazyDev',
						module = 'lazydev.integrations.blink',
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
		},
	},
}
