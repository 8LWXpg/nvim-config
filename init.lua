vim.o.showmatch = true          -- show matching
vim.o.ignorecase = true         -- case insensitive
vim.o.hlsearch = true           -- highlight search
vim.o.incsearch = true          -- incremental search
vim.o.tabstop = 4               -- number of columns occupied by a tab
vim.o.softtabstop = 4           -- see multiple spaces as tabstops so <BS> does the right thing
vim.o.shiftwidth = 4            -- width for autoindents
vim.o.autoindent = true         -- indent a new line the same amount as the line just typed
vim.o.mouse = 'a'               -- enable mouse click
vim.o.clipboard = 'unnamedplus' -- using system clipboard
vim.o.ttyfast = true            -- Speed up scrolling in Vim
vim.o.swapfile = false          -- disable creating swap file

vim.wo.number = true            -- add line numbers
vim.wo.relativenumber = true
vim.wo.cursorline = true        -- highlight current cursorline

vim.opt.fileformat = "unix"     -- Set default line ending to LF
vim.opt.fileformats = "unix,dos"

vim.opt.whichwrap:append("<>hl")

-- Convert CRLF to LF on paste
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("ConvertCRLFtoLF", { clear = true }),
	callback = function()
		if vim.v.event.operator == "p" or vim.v.event.operator == "P" then
			vim.api.nvim_command([[silent! '[,']s/\r\n/\n/g]])
		end
	end,
})

-- retrive cursor style after leave
vim.api.nvim_create_autocmd("VimLeave", {
	pattern = "*",
	callback = function()
		vim.opt.guicursor = ""
		vim.fn.chansend(vim.v.stderr, "\x1b[ q")
	end,
})

-- pwsh settings on Windows
if vim.loop.os_uname().sysname == 'Windows_NT' then
	vim.opt.shell = "pwsh.exe"
	vim.o.shellcmdflag =
	"-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
	vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
	vim.o.shellpipe = '2>&1 | %%{ "$_" } | tee.exe %s; exit $LastExitCode'
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
end

-- this have to set before loading lazy
vim.g.mapleader = " "
require('config')
require('keymaps')
