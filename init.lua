vim.o.showmatch = true               -- show matching
vim.o.ignorecase = true              -- case insensitive
vim.o.hlsearch = true                -- highlight search
vim.o.incsearch = true               -- incremental search
vim.o.tabstop = 4                    -- number of columns occupied by a tab
vim.o.softtabstop = 4                -- see multiple spaces as tabstops so <BS> does the right thing
vim.o.shiftwidth = 4                 -- width for autoindents
vim.o.autoindent = true              -- indent a new line the same amount as the line just typed
vim.wo.number = true                 -- add line numbers
vim.cmd('filetype plugin indent on') -- allow auto-indenting depending on file type
vim.cmd('syntax on')                 -- syntax highlighting
vim.o.mouse = 'a'                    -- enable mouse click
vim.o.clipboard = 'unnamedplus'      -- using system clipboard
vim.cmd('filetype plugin on')
vim.wo.cursorline = true             -- highlight current cursorline
vim.o.ttyfast = true                 -- Speed up scrolling in Vim
vim.o.swapfile = false               -- disable creating swap file

if vim.loop.os_uname().sysname == 'Windows_NT' then
	vim.opt.shell = "pwsh.exe"
	vim.o.shellcmdflag =
	"-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		virtual_text = false,
		signs = true,
		update_in_insert = false,
		underline = true,
	}
)

vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })
vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? coc#_select_confirm() : "\\<TAB>"',
	{ expr = true, noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<TAB>', [[coc#rpc#request('doKeymap', ['snippets-expand-jump',''])]], {silent = true, expr = true})

require('config')
