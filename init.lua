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
	callback = function()
		local regtype = vim.v.event.regtype
		if regtype == 'v' or regtype == 'V' or regtype == '\x16' then
			vim.cmd([[
        execute 'normal! `[v`]g/\%x0d/d'
      ]])
		end
	end,
})

vim.api.nvim_create_user_command('WQA', function()
	local modified = false
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_option(buf, 'modified') then
			modified = true
			break
		end
	end

	if modified then
		vim.cmd('w')
	end
	vim.cmd('qa')
end, { force = true })

vim.cmd('cnoreabbrev wqa WQA')

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

require('keymaps')
require('config')
