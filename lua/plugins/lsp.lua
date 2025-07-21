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
		if client == nil then
			return
		end

		local bufmap = function(mode, lhs, rhs)
			vim.keymap.set(mode, lhs, rhs, { buffer = true })
		end

		bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
		bufmap('n', 'gc', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
		bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
		bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
		bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
		bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
		bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
		bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
		bufmap('n', '<F4>', '<cmd>lua require("tiny-code-action").code_action()<cr>')
		bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
		bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
		bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

		-- Make sure there is at least one client with formatting capabilities
		if client.supports_method('textDocument/formatting') then
			buffer_autoformat(event.buf)
		end
	end,
})

vim.lsp.enable({ 'nil_ls', 'lua_ls' })

return {
	{
		'mason-org/mason-lspconfig.nvim',
		version = '2.*',
		opts = {},
	},
	{
		'mason-org/mason.nvim',
		version = '2.*',
		config = true,
	},
	{
		'neovim/nvim-lspconfig',
		version = '2.*',
	},
	{
		'folke/lazydev.nvim',
		ft = 'lua', -- only load on lua files
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
		dependencies = { 'rafamadriz/friendly-snippets' },
		opts = {
			completion = {
				accept = { auto_brackets = { enabled = false } },
				documentation = { auto_show = true },
			},
			keymap = { preset = 'super-tab' },
			cmdline = {
				completion = {
					menu = { auto_show = true },
				},
				keymap = { preset = 'inherit' },
			},
			sources = {
				default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
				per_filetype = {
					markdown = { 'markview' },
				},
				providers = {
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
		'folke/trouble.nvim',
		opts = {}, -- For default options, refer to the configuration section for custom setup.
		cmd = 'Trouble',
	},
	{
		'rachartier/tiny-code-action.nvim',
		event = 'LspAttach',
		opts = {
			picker = {
				'buffer',
			},
		},
	},
}
