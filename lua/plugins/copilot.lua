vim.api.nvim_create_autocmd('BufEnter', {
	pattern = 'copilot-*',
	callback = function()
		vim.opt_local.relativenumber = false
		vim.opt_local.number = false
	end,
})

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
				width = .4,
			},
			auto_fold = true,
			auto_insert_mode = true,
		},
	},
}
