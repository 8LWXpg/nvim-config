return {
	'RaafatTurki/hex.nvim',
	cond = vim.o.binary,
	init = function()
		-- Autoload in binary mode (`nvim -b`)
		vim.api.nvim_create_autocmd('BufReadPost', {
			callback = function() require('hex').dump() end,
		})
	end,
	config = true,
}
