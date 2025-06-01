-- vim.api.nvim_create_autocmd('FileType', {
-- 	pattern = { '<filetype>' },
-- 	callback = function()
-- 		vim.treesitter.start()
-- 		vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- 	end,
-- })

return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ':TSUpdate',
	opts = {
	},
}
