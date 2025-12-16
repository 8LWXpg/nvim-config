-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'
vim.diagnostic.config({ virtual_text = true })

local buffer_autoformat = function(bufnr)
	local group = 'lsp_autoformat'
	vim.api.nvim_create_augroup(group, { clear = false })
	vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

	vim.api.nvim_create_autocmd('BufWritePre', {
		buffer = bufnr,
		group = group,
		desc = 'LSP format on save',
		callback = function()
			-- note: do not enable async formatting
			vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
		end,
	})
end

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(event)
		local id = vim.tbl_get(event, 'data', 'client_id')
		local client = id and vim.lsp.get_client_by_id(id)
		if client == nil then return end

		-- Wait for dynamic capabilities
		vim.defer_fn(function()
			-- Make sure there is at least one client with formatting capabilities
			if client:supports_method('textDocument/formatting') then
				buffer_autoformat(event.buf)
			end
		end, 100)
	end,
})

vim.lsp.enable({ 'nixd', 'lua_ls' })

return {
	{
		'mason-org/mason-lspconfig.nvim',
		version = '2.*',
		event = 'BufReadPost',
		dependencies = {
			'mason-org/mason.nvim',
			'neovim/nvim-lspconfig',
		},
		opts = {},
	},
	{
		'mason-org/mason.nvim',
		version = '2.*',
		cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' },
		opts = {},
	},
	{
		'neovim/nvim-lspconfig',
		version = '2.*',
		event = 'BufReadPost',
	},
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		---@class lazydev.Config
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = '${3rd}/luv/library', words = { 'vim%.uv' } },
			},
		},
	},
	{
		'saghen/blink.cmp',
		version = '1.*',
		event = { 'InsertEnter', 'CmdlineEnter' },
		dependencies = { 'rafamadriz/friendly-snippets' },
		opts = {
			completion = {
				accept = { auto_brackets = { enabled = false } },
				documentation = { auto_show = true },
			},
			keymap = {
				preset = 'super-tab',
				['<C-space>'] = { 'show', 'hide' },
			},
			cmdline = {
				completion = {
					menu = { auto_show = true },
				},
				keymap = { preset = 'inherit' },
			},
			sources = {
				default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					lsp = {
						min_keyword_length = 0,
					},
					lazydev = {
						name = 'LazyDev',
						module = 'lazydev.integrations.blink',
						-- Make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
		},
	},
	{
		'rachartier/tiny-code-action.nvim',
		opts = {
			picker = {
				'buffer',
				opts = {
					keymaps = {
						close = { 'q', '<Esc>' },
					},
				},
			},
		},
		keys = {
			{ '<F4>', function() require('tiny-code-action').code_action({}) end, 'LSP Code Action' },
		},
	},
}
