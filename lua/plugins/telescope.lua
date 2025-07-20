return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		defaults = {
			-- until PR merged: https://github.com/nvim-telescope/telescope.nvim/issues/3436
			border = false,
		},
	},
	cmd = { 'Telescope' },
	keys = {
		{ '<leader>ff', '<cmd>Telescope find_files<cr>',                                                   desc = 'Find files' },
		{ '<leader>fs', '<cmd>Telescope lsp_document_symbols symbol_width=55 ignore_symbols=variable<cr>', desc = 'Document symbols' },
		{ '<leader>fg', '<cmd>Telescope live_grep<cr>',                                                    desc = 'Live grep' },
		{ '<leader>fb', '<cmd>Telescope buffers<cr>',                                                      desc = 'Find buffers' },
		{ '<leader>fh', '<cmd>Telescope help_tags<cr>',                                                    desc = 'Help tags' },
	},
}
