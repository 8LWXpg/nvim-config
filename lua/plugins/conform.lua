return {
	'stevearc/conform.nvim',
	-- Update this field after adding another formatter
	ft = { 'bib' },
	opts = {
		formatters_by_ft = {
			bib = { 'bibtex_tidy' },
		},
		formatters = {
			bibtex_tidy = {
				command = 'bibtex-tidy',
				-- Add your preferred arguments here
				args = {
					'$FILENAME',
					'--omit=abstract',
					'--curly',
					'--numeric',
					'--space=2',
					'--blank-lines',
					'--no-sort',
					'--duplicates',
					'--strip-enclosing-braces',
					'--sort-fields',
					'--trailing-commas',
					'--remove-empty-fields',
				},
				stdin = false,
			},
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = 'fallback',
		},
	},
}
