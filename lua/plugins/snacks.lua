vim.api.nvim_create_user_command('LazyGit', function() Snacks.lazygit() end, {})

return {
	'folke/snacks.nvim',
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
					{ icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = ' ',
						key = 'g',
						desc = 'Find Text',
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{ icon = ' ', key = 'p', desc = 'Find Projects', action = ':lua Snacks.picker.projects()' },
					{
						icon = ' ',
						key = 'r',
						desc = 'Recent Files',
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = ' ',
						key = 'c',
						desc = 'Config',
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{
						icon = '󰒲 ',
						key = 'L',
						desc = 'Lazy',
						action = ':Lazy',
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
				},
			},
			sections = {
				{ section = 'header' },
				{ icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
				{ section = 'startup' },
				{ pane = 2, icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
				{ pane = 2, icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2 },
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
			formatters = {
				file = {
					min_width = 30,
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
		{
			'<C-_>',
			function() Snacks.terminal() end,
			desc = 'Open Terminal',
		},

		{
			'<leader>,',
			function() Snacks.picker.buffers() end,
			desc = 'Buffers',
		},
		{
			'<leader>/',
			function() Snacks.picker.grep() end,
			desc = 'Grep',
		},
		{
			'<leader>:',
			function() Snacks.picker.command_history() end,
			desc = 'Command History',
		},
		{
			'<leader>e',
			function() Snacks.explorer() end,
			desc = 'File Explorer',
		},

		{
			'<leader>ff',
			function() Snacks.picker.files() end,
			desc = 'Find files',
		},
		{
			'<leader>fp',
			function() Snacks.picker.projects() end,
			desc = 'Projects',
		},

		{
			'<leader>sk',
			function() Snacks.picker.keymaps() end,
			desc = 'Keymaps',
		},
		{
			'<leader>sw',
			function() Snacks.picker.grep_word() end,
			desc = 'Visual selection or word',
			mode = { 'n', 'x' },
		},
		-- LSP
		{
			'gd',
			function() Snacks.picker.lsp_definitions() end,
			desc = 'Goto Definition',
		},
		{
			'gD',
			function() Snacks.picker.lsp_declarations() end,
			desc = 'Goto Declaration',
		},
		{
			'grr',
			function() Snacks.picker.lsp_references() end,
			nowait = true,
			desc = 'References',
		},
		{
			'gI',
			function() Snacks.picker.lsp_implementations() end,
			desc = 'Goto Implementation',
		},
		{
			'gy',
			function() Snacks.picker.lsp_type_definitions() end,
			desc = 'Goto T[y]pe Definition',
		},
		{
			'<leader>ss',
			function() Snacks.picker.lsp_symbols() end,
			desc = 'LSP Symbols',
		},
		{
			'<leader>sS',
			function() Snacks.picker.lsp_workspace_symbols() end,
			desc = 'LSP Workspace Symbols',
		},
	},
}
