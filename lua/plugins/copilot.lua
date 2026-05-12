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
		cmd = { 'CopilotChat', 'CopilotChatFix' },
		dependencies = {
			{ 'nvim-lua/plenary.nvim', branch = 'master' },
		},
		---@type CopilotChat.config
		opts = {
			chat_autocomplete = false,
			model = 'gpt-5.2-codex',
			window = {
				width = 0.4,
			},
			auto_fold = true,
		},
	},
}
