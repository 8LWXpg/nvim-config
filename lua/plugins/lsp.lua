vim.opt.signcolumn = 'number'
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
			if client:supports_method('textDocument/formatting') then buffer_autoformat(event.buf) end
		end, 100)
	end,
})

-- From [snacks.nvim/docs/notifier.md](https://github.com/folke/snacks.nvim/blob/main/docs/notifier.md#-examples)
---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
local progress = vim.defaulttable()
vim.api.nvim_create_autocmd('LspProgress', {
	---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
	---@diagnostic disable-next-line: assign-type-mismatch
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
		if not client or type(value) ~= 'table' then return end
		local p = progress[client.id]

		for i = 1, #p + 1 do
			if i == #p + 1 or p[i].token == ev.data.params.token then
				p[i] = {
					token = ev.data.params.token,
					msg = ('[%3d%%] %s%s'):format(
						value.kind == 'end' and 100 or value.percentage or 100,
						value.title or '',
						value.message and (' **%s**'):format(value.message) or ''
					),
					done = value.kind == 'end',
				}
				break
			end
		end

		local msg = {} ---@type string[]
		progress[client.id] = vim.tbl_filter(function(v) return table.insert(msg, v.msg) or not v.done end, p)

		local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
		vim.notify(table.concat(msg, '\n'), 'info', {
			id = 'lsp_progress',
			title = client.name,
			opts = function(notif)
				notif.icon = #progress[client.id] == 0 and ' ' or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
			end,
		})
	end,
})

vim.lsp.enable({ 'nixd', 'gopls' })

return {
	{
		'mason-org/mason-lspconfig.nvim',
		version = '2.*',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'mason-org/mason.nvim',
			{
				'neovim/nvim-lspconfig',
				version = '2.*',
				event = { 'BufReadPre', 'BufNewFile' },
			},
		},
		opts = {},
	},
	{
		'mason-org/mason.nvim',
		version = '2.*',
		cmd = { 'Mason', 'MasonInstall', 'MasonUpdate', 'MasonUninstall' },
		opts = {},
	},
	{
		'neovim/nvim-lspconfig',
		version = '2.*',
	},
	{
		'saghen/blink.cmp',
		version = '1.*',
		event = { 'InsertEnter', 'CmdlineEnter' },
		dependencies = {
			'nvim-mini/mini.snippets',
			version = '*',
			dependencies = 'rafamadriz/friendly-snippets',
			opts = function()
				return {
					snippets = { require('mini.snippets').gen_loader.from_lang() },
					mappings = { expand = '' },
				}
			end,
		},
		---@type blink.cmp.Config
		opts = {
			snippets = { preset = 'mini_snippets' },
			completion = {
				accept = { auto_brackets = { enabled = false } },
				documentation = { auto_show = true },
				list = { selection = { preselect = true, auto_insert = false } },
				menu = { draw = { treesitter = { 'lsp' } } },
			},
			keymap = { preset = 'super-tab' },
			cmdline = {
				completion = { menu = { auto_show = true } },
				keymap = { preset = 'inherit' },
			},
			sources = {
				default = { 'snippets', 'lsp', 'path', 'buffer' },
				providers = { lsp = { min_keyword_length = 0 } },
			},
		},
	},
	{
		'rachartier/tiny-code-action.nvim',
		opts = {
			backend = 'delta',
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
			{
				'<F4>',
				function() require('tiny-code-action').code_action({}) end,
				'LSP Code Action',
			},
		},
	},
}
