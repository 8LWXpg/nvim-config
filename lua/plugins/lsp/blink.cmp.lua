return {
	'saghen/blink.cmp',
	version = '1.*',
	event = { 'InsertEnter', 'CmdlineEnter' },
	dependencies = {
		{
			'nvim-mini/mini.snippets',
			version = '*',
			dependencies = 'rafamadriz/friendly-snippets',
			opts = function()
				return {
					snippets = {
						require('mini.snippets').gen_loader.from_lang({
							lang_patterns = { ps1 = { 'PowerShell.json' } },
						}),
					},
					mappings = { expand = '' },
				}
			end,
		},
	},
	---@type blink.cmp.Config
	opts = {
		snippets = { preset = 'mini_snippets' },
		completion = {
			accept = { auto_brackets = { enabled = false } },
			documentation = { auto_show = true },
			list = { selection = { preselect = true, auto_insert = false } },
			menu = { draw = { treesitter = { 'lsp' } } },
		},
		keymap = { preset = 'super-tab' },
		cmdline = {
			completion = { menu = { auto_show = true } },
			keymap = { preset = 'inherit' },
		},
		sources = {
			default = { 'snippets', 'lsp', 'path', 'buffer' },
			providers = { lsp = { min_keyword_length = 0 } },
		},
	},
}