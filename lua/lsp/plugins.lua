return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'saghen/blink.cmp',
		},
		opts = {
			servers = {
				lua_ls = {},
				nil_ls = {
					settings = {
						['nil'] = {
							formatting = {
								command = { 'nixfmt' },
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
	{ 'williamboman/mason.nvim', config = true },
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
				keymap = {
					['<Tab>'] = { 'show', 'accept' },
				},
			},
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
	},
}
