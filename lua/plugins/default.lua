-- Some small utility plugins
return {
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
		opts = {},
		keymaps = {
			{ 'K', function()
				if not require('ufo').peekFoldedLinesUnderCursor() then
					vim.lsp.buf.hover()
				end
			end, 'Peek Fold or LSP Hover' },
		},
	},
	{
		'RaafatTurki/hex.nvim',
		cmd = { 'HexToggle' },
		cond = vim.o.binary,
		init = function()
			-- Auto-load in binary mode (nvim -b)
			vim.api.nvim_create_autocmd('BufReadPost', {
				callback = function()
					require('hex').dump()
				end,
			})
		end,
		config = true,
	},
	{ 'nmac427/guess-indent.nvim', config = true },
	{ 'nvim-mini/mini.pairs',      version = '*', config = true },
	{ 'nvim-mini/mini.surround',   version = '*', config = true },
}
