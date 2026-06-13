return {
	'chomosuke/typst-preview.nvim',
	ft = 'typst',
	opts = {
		dependencies_bin = { tinymist = 'tinymist.cmd' },
		get_main_file = function() return vim.fn.getcwd() .. '/main.typ' end,
	},
}
