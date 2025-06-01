return {
	{
		'OXY2DEV/markview.nvim',
		version = '*',
		ft = { 'markdown', 'typst' },
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons',
		},
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				disabled_filetypes = {
					statusline = { 'neo-tree', 'DiffviewFiles' },
				},
			},
		},
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
	{ 'echasnovski/mini.surround', version = '*', config = true },
}
