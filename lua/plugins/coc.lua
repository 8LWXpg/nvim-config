return {
	'neoclide/coc.nvim',
	run = function()
	-- Run `npm ci` after updating `coc.nvim`
		local install_path = vim.fn.stdpath('data') .. '/lazy/coc.nvim'
		vim.fn.system({'npm', 'ci'}, {cwd = install_path})
	end,
}

