return {
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		event = 'VeryLazy',
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
	},
	{
		'RaafatTurki/hex.nvim',
		cmd = { 'HexToggle' },
		init = function()
			-- Auto-load in binary mode (nvim -b)
			if vim.o.binary then
				vim.api.nvim_create_autocmd('BufReadPost', {
					callback = function()
						require('hex').dump()
					end,
				})
			end
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
	{
		'echasnovski/mini.pairs',
		version = '*',
		config = true,
	},
	{ 'nmac427/guess-indent.nvim', config = true },
}
