return {
	'folke/neodev.nvim',
	'honza/vim-snippets',
	'nvim-treesitter/nvim-treesitter',
	{ 'RaafatTurki/hex.nvim',  config = true },
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('alpha').setup(require 'alpha.themes.startify'.config)
		end
	},
	{ 'neoclide/coc.nvim',     build = "npm ci" },
	{ 'numToStr/Comment.nvim', config = true },
}
