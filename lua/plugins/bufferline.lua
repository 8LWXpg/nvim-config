return {
	'akinsho/bufferline.nvim',
	version = '*',
	event = 'UIEnter',
	dependencies = 'nvim-tree/nvim-web-devicons',
	opts = {
		options = {
			offsets = {
				{
					filetype = 'codediff-explorer',
					text = 'Diff View',
				},
				{
					filetype = 'snacks_layout_box',
					text = 'Snacks Explorer',
				},
			},
			diagnostics = 'nvim_lsp',
			show_close_icon = false,
			show_buffer_close_icons = false,
			enforce_regular_tabs = true,
			right_mouse_command = 'lua Snacks.bufdelete.other()',
			middle_mouse_command = 'lua Snacks.bufdelete.delete(%d)',
		},
	},
	keys = {
		{ '<M-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', desc = 'Go to buffer 1' },
		{ '<M-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', desc = 'Go to buffer 2' },
		{ '<M-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', desc = 'Go to buffer 3' },
		{ '<M-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', desc = 'Go to buffer 4' },
		{ '<M-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', desc = 'Go to buffer 5' },
		{ '<M-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', desc = 'Go to buffer 6' },
		{ '<M-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', desc = 'Go to buffer 7' },
		{ '<M-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', desc = 'Go to buffer 8' },
		{ '<M-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', desc = 'Go to buffer 9' },
	},
}
