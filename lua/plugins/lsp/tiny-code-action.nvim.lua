return {
	'rachartier/tiny-code-action.nvim',
	opts = {
		backend = 'delta',
		picker = {
			'buffer',
			opts = {
				hotkeys = true,
				keymaps = { close = { 'q', '<Esc>' } },
			},
		},
	},
	keys = {
		{
			'<F4>',
			function() require('tiny-code-action').code_action({}) end,
			'LSP Code Action',
		},
	},
}