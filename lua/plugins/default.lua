return {
	{
		'OXY2DEV/markview.nvim',
		version = '*',
		lazy = false,
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
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		cond = function()
			return vim.fn.argc() == 0 -- Load only if no file was passed as an argument
		end,
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end,
	},
	{ 'echasnovski/mini.pairs',    version = '*', config = true },
	{ 'nmac427/guess-indent.nvim', config = true },
	{ 'echasnovski/mini.surround', version = '*', config = true },
}
