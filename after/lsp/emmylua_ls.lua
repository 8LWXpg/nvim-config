return {
	settings = {
		Lua = {
			diagnostics = {
				disable = { 'missing-fields' },
			},
			runtime = {
				version = 'LuaJIT',
				requirePattern = {
					'lua/?.lua',
					'lua/?/init.lua',
				},
				frameworkVersions = { 'luv' },
			},
			workspace = {
				library = vim.api.nvim_list_runtime_paths(),
				ignoreGlobs = { '**/*_spec.lua' },
			},
		},
	},
}
