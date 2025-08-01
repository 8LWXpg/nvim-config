return {
	'nvim-treesitter/nvim-treesitter',
	branch = 'main',
	lazy = false,
	build = ':TSUpdate',
	config = function()
		-- Auto enable installed parser
		vim.api.nvim_create_autocmd('FileType', {
			callback = function()
				local filetype = vim.bo.filetype
				local lang = vim.treesitter.language.get_lang(filetype) or filetype
				local installed = require('nvim-treesitter').get_installed()

				if vim.tbl_contains(installed, lang) then
					vim.treesitter.start()
				end
			end,
		})
	end,
}
