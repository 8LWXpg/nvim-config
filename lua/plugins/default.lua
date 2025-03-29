return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = 'VeryLazy',
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	},
	{ 'RaafatTurki/hex.nvim',   config = true },
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
	{ 'sindrets/diffview.nvim', cmd = 'DiffviewOpen' },
	{
		'echasnovski/mini.pairs',
		version = '*',
		config = true,
	},
}
