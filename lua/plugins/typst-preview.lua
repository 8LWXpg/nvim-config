return {
	-- 'chomosuke/typst-preview.nvim',
	-- Partial rendering fork
	'll-nick/typst-preview.nvim',
	branch = 'partial-rendering-default',
	ft = 'typst',
	opts = {
		dependencies_bin = { tinymist = 'tinymist.cmd' },
		get_main_file = function() return vim.fn.getcwd() .. '/main.typ' end,
	},
}
