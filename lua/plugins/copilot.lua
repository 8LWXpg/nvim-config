return {
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		dependencies = {
			{ 'nvim-lua/plenary.nvim', branch = 'master' },
		},
		---@type CopilotChat.config
		opts = {
			model = 'claude-sonnet-4',
			window = {
				width = .3,
			},
			auto_insert_mode = true,
		},
	},
}
