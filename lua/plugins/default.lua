return {
	'honza/vim-snippets',
	'nvim-treesitter/nvim-treesitter',
	{ 'RaafatTurki/hex.nvim', config = true },
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.startify'.config)
		end
	},
	{ 'neoclide/coc.nvim',    branch = 'release' },
	'sindrets/diffview.nvim',
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		version = '*',
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
	}
}
