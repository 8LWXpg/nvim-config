return {
	'romus204/tree-sitter-manager.nvim',
	main = 'tree-sitter-manager',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {
		languages = {
			typst = {
				install_info = {
					url = 'https://github.com/uben0/tree-sitter-typst',
					use_repo_queries = true,
				},
			},
		},
	},
}
