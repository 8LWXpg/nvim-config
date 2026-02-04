vim.api.nvim_create_user_command('Explorer', function()
	Snacks.explorer()
end, {})
vim.api.nvim_create_user_command('LazyGit', function()
	Snacks.lazygit()
end, {})

return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	dependencies = 'nvim-mini/mini.icons',
	---@type snacks.Config
	opts = {
		dashboard = {
			enabled = true,
			sections = {
				{ section = 'header' },
				{ icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
				{ icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
				{ icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
				{ section = 'startup' },
			},
		},
		explorer = {
			enabled = true,
			replace_netrw = true,
		},
		indent = { enabled = true },
		input = {
			enabled = true,
			icon = ' ',
		},
		picker = {
			enabled = true,
			sources = {
				explorer = {
					watch = false,
				},
			},
		},
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{ '<C-_>',      function() Snacks.terminal() end,                     desc = 'Open Terminal' },

		{ '<leader>,',  function() Snacks.picker.buffers() end,               desc = 'Buffers' },
		{ '<leader>/',  function() Snacks.picker.grep() end,                  desc = 'Grep' },

		{ '<leader>ff', function() Snacks.picker.files() end,                 desc = 'Find files' },
		{ '<leader>sk', function() Snacks.picker.keymaps() end,               desc = 'Keymaps' },
		-- LSP
		{ 'gd',         function() Snacks.picker.lsp_definitions() end,       desc = 'Goto Definition' },
		{ 'gD',         function() Snacks.picker.lsp_declarations() end,      desc = 'Goto Declaration' },
		{ 'grr',        function() Snacks.picker.lsp_references() end,        nowait = true,                  desc = 'References' },
		{ 'gI',         function() Snacks.picker.lsp_implementations() end,   desc = 'Goto Implementation' },
		{ 'gy',         function() Snacks.picker.lsp_type_definitions() end,  desc = 'Goto T[y]pe Definition' },
		{ '<leader>ss', function() Snacks.picker.lsp_symbols() end,           desc = 'LSP Symbols' },
		{ '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },
	},
}
