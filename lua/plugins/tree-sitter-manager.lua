return {
	'romus204/tree-sitter-manager.nvim',
	branch = 'develop',
	-- dev = true,
	event = { 'BufReadPost', 'BufNewFile' },
	build = ':TSUpdate!',
	opts = {},
}
