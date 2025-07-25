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
					focus = 'input',
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
		{ '<leader>ff', function() Snacks.picker.files() end,       desc = 'Find files' },
		{ '<leader>fs', function() Snacks.picker.lsp_symbols() end, desc = 'LSP symbols' },
		{ '<leader>/',  function() Snacks.picker.grep() end,        desc = 'Grep' },
		{ '<leader>,',  function() Snacks.picker.buffers() end,     desc = 'Buffers' },
	},
}
