return {
	'honza/vim-snippets',
	{
		'nvim-treesitter/nvim-treesitter',
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
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
	{ 'sindrets/diffview.nvim', cmd = "DiffviewOpen" },
	{
		"OXY2DEV/markview.nvim",
		version = '*',
		ft = { "markdown" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		'echasnovski/mini.pairs',
		version = '*',
		config = true,
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = true,
	},
}
