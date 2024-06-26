return {
	{
		'folke/which-key.nvim',
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	'folke/neodev.nvim',
	'ryanoasis/vim-devicons',
	'honza/vim-snippets',
	'scrooloose/nerdtree',
	'nvim-treesitter/nvim-treesitter',
	'mhinz/vim-startify',
	{ 'ArcaneSpecs/HexEditor.nvim', config = true },
}
