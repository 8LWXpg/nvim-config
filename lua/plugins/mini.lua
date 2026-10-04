vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		vim.schedule(function()
			if vim.api.nvim_buf_is_valid(args.buf) and vim.bo[args.buf].buftype == '' then
				require('guess-indent').set_from_buffer(args.buf, true, true)
			end
		end)
	end,
})

return {
	{
		'nmac427/guess-indent.nvim',
		opts = { auto_cmd = false },
	},
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
	{
		'nvim-mini/mini.diff',
		version = '*',
		event = { 'BufReadPost', 'BufNewFile' },
		opts = {},
	},
}
