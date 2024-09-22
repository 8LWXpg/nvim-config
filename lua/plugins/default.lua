return {
	{
		'folke/which-key.nvim',
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	'folke/neodev.nvim',
	'honza/vim-snippets',
	'nvim-treesitter/nvim-treesitter',
	{ 'ArcaneSpecs/HexEditor.nvim', config = true },
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('alpha').setup(require 'alpha.themes.startify'.config)
		end
	},
	{ 'neoclide/coc.nvim',          build = "npm ci" },
	{ 'numToStr/Comment.nvim',      config = true },
}
