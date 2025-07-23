return {
	{
		'OXY2DEV/markview.nvim',
		version = '*',
		ft = { 'markdown', 'typst' },
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
			'saghen/blink.cmp',
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
	{ 'echasnovski/mini.pairs',    version = '*', config = true },
	{ 'nmac427/guess-indent.nvim', config = true },
	{ 'echasnovski/mini.surround', version = '*', config = true },
}
