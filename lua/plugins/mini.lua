-- Some small utility plugins
return {
	{ 'nmac427/guess-indent.nvim', event = 'BufReadPost', opts = {} },
	{
		'nvim-mini/mini.pairs',
		version = '*',
		event = 'InsertEnter',
		opts = {},
	},
	{
		'nvim-mini/mini.surround',
		version = '*',
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {},
	},
	{
		'nvim-mini/mini.jump2d',
		version = '*',
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {
			view = { dim = true },
		},
	},
}
