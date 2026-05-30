return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {},
	keys = {
		{
			'K',
			function()
				if not require('ufo').peekFoldedLinesUnderCursor() then vim.lsp.buf.hover() end
			end,
			'Peek Fold or LSP Hover',
		},
	},
}
