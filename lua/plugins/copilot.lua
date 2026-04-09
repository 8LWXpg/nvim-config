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
			model = 'gpt-5.3-codex',
			window = {
				width = 0.4,
			},
			auto_fold = true,
		},
		cmd = { 'CopilotChatOpen', 'CopilotChatFix' },
	},
}
