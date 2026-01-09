-- Some small utility plugins
return {
	{
		'kevinhwang91/nvim-ufo',
		dependencies = 'kevinhwang91/promise-async',
		event = { 'BufReadPost', 'BufNewFile' },
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
		cond = vim.o.binary,
		init = function()
			-- Auto-load in binary mode (nvim -b)
			vim.api.nvim_create_autocmd('BufReadPost', { callback = function() require('hex').dump() end })
		end,
		config = true,
	},
	{ 'nmac427/guess-indent.nvim', event = 'BufReadPost', opts = {} },
	{ 'nvim-mini/mini.pairs',      event = 'InsertEnter', version = '*', opts = {} },
	{
		'nvim-mini/mini.surround',
		event = { 'BufReadPost', 'BufNewFile' },
		version = '*',
		opts = {},
	},
}
