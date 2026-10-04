return {
	'mason-org/mason-lspconfig.nvim',
	version = '2.*',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'mason-org/mason.nvim',
		'neovim/nvim-lspconfig',
	},
	opts = {
		automatic_enable = {
			exclude = {
				'harper_ls',
			},
		},
	},
}
