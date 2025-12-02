return {
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim', 'require' },
			},
			format = {
				defaultConfig = {
					indent_style = 'tab',
					quote_style = 'single',
					end_of_line = 'lf',
					trailing_table_separator = 'smart',
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		}
	}
}
