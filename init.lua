vim.o.showmatch = true          -- show matching
vim.o.ignorecase = true         -- case insensitive
vim.o.hlsearch = true           -- highlight search
vim.o.incsearch = true          -- incremental search
vim.o.tabstop = 4               -- number of columns occupied by a tab
-- vim.o.softtabstop = 4           -- see multiple spaces as tabstops so <BS> does the right thing
vim.o.shiftwidth = 4            -- width for autoindents
vim.o.autoindent = true         -- indent a new line the same amount as the line just typed
vim.o.mouse = 'a'               -- enable mouse click
vim.o.clipboard = 'unnamedplus' -- using system clipboard
vim.o.ttyfast = true            -- Speed up scrolling in Vim
vim.o.swapfile = false          -- disable creating swap file
vim.o.foldmethod = 'syntax'     -- folding based on syntax
vim.o.foldlevel = 99            -- open all fold

vim.wo.number = true            -- add line numbers
vim.wo.relativenumber = true
vim.wo.cursorline = true        -- highlight current cursorline

vim.opt.fileformat = 'unix'     -- Set default line ending to LF
vim.opt.fileformats = 'unix,dos'
vim.opt.whichwrap:append('<>hl')
vim.opt.autoread = true
vim.opt.wrap = false -- no line wrap
vim.opt.fillchars:append { diff = '╱' }

-- Disable netrw completely
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Show a message when the file is changed on disk and reloaded
vim.api.nvim_create_autocmd('FileChangedShellPost', {
	pattern = '*',
	callback = function()
		vim.cmd('echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None')
	end,
})

-- Convert CRLF to LF on save
vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*',
	callback = function()
		if vim.bo.fileformat == 'dos' then
			vim.bo.fileformat = 'unix'
		elseif jit.os == 'Windows' then
			vim.fn.execute('%s/\\r//g', 'silent!')
		end
	end,
	desc = 'Convert CRLF to LF on save',
})

-- retrive cursor style after leave
vim.api.nvim_create_autocmd('VimLeave', {
	pattern = '*',
	callback = function()
		vim.opt.guicursor = ''
		vim.fn.chansend(vim.v.stderr, '\x1b[ q')
	end,
})

-- pwsh settings on Windows
if jit.os == 'Windows' then
	vim.opt.shell = 'pwsh.exe'
	vim.o.shellcmdflag =
	"-nop -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
	vim.o.shellredir = '2>&1 | Join-String -Separator "`n" | Out-File -NoNewline %s; exit $LastExitCode'
	vim.o.shellpipe = '2>&1 | Join-String -Separator "`n" | tee.exe %s; exit $LastExitCode'
	vim.o.shellquote = ''
	vim.o.shellxquote = ''
end

-- Force OSC52 on remote
if (os.getenv('SSH_TTY') ~= nil) then
	vim.g.clipboard = {
		name = 'OSC 52',
		copy = {
			['+'] = require('vim.ui.clipboard.osc52').copy('+'),
			['*'] = require('vim.ui.clipboard.osc52').copy('*'),
		},
		paste = {
			['+'] = vim.fn['provider#clipboard#paste'],
			['*'] = vim.fn['provider#clipboard#paste'],
		},
	}
end

-- this have to set before loading lazy
require('config.lazy')
require('keymaps')
require('lsp.settigns')
