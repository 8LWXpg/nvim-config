-- Experimental Lua module loader
vim.loader.enable()

vim.o.showmatch = true          -- Show matching
vim.o.ignorecase = true         -- Case insensitive
vim.o.incsearch = true          -- Incremental search
vim.o.tabstop = 4               -- Number of columns occupied by a tab
vim.o.shiftwidth = 4            -- Width for astringents
vim.o.autoindent = true         -- Indent a newline the same amount as the line just typed
vim.o.mouse = 'a'               -- Enable mouse click
vim.o.clipboard = 'unnamedplus' -- Using system clipboard
vim.o.swapfile = false          -- Disable creating swap file
vim.o.wrap = false              -- no line wrap
vim.o.fileformat = 'unix'       -- Set default line ending to LF
vim.o.fileformats = 'unix,dos'
vim.o.winborder = 'rounded'
vim.o.sidescroll = 4
vim.o.splitright = true -- Create split from right

vim.opt.whichwrap:append('<>hl')
vim.opt.fillchars:append({ diff = '╱' })

vim.wo.number = true     -- add line numbers
vim.wo.relativenumber = true
vim.wo.cursorline = true -- highlight current line

-- Disable netrw completely
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Folding
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = 'expr'
-- Default to Tree-sitter folding
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method('textDocument/foldingRange') then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
		end
	end,
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '󰅙',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.HINT] = '󰌵',
			[vim.diagnostic.severity.INFO] = '󰋼',
		},
	},
})

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
		elseif vim.fn.has('win32') ~= 0 then
			vim.fn.execute('%s/\\r//g', 'silent!')
		end
	end,
	desc = 'Convert CRLF to LF on save',
})

-- Retrieve cursor style after leave
vim.api.nvim_create_autocmd('VimLeave', {
	pattern = '*',
	callback = function()
		vim.opt.guicursor = ''
		-- vim.fn.chansend(vim.v.stderr, '\x1b[0 q')
		pcall(function()
			io.stdout:write('\x1b[0 q')
			io.stdout:flush()
		end)
	end,
})

-- PowerShell settings on Windows
if vim.fn.has('win32') ~= 0 then
	vim.opt.shell = 'pwsh.exe'
	vim.o.shellcmdflag =
	"-nop -c [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';$PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;"
	vim.o.shellredir = '2>&1 | Join-String -Separator "`n" | Out-File -NoNewline %s; exit $LastExitCode'
	vim.o.shellpipe = '2>&1 | Join-String -Separator "`n" | tee.exe %s; exit $LastExitCode'
	vim.o.shellquote = ''
	vim.o.shellxquote = ''
end

-- Force OSC52 on remote
if vim.env.SSH_TTY ~= nil then
	local function vim_paste()
		local content = vim.fn.getreg '"'
		return vim.split(content, '\n')
	end

	vim.g.clipboard = {
		name = 'OSC 52',
		copy = {
			['+'] = require('vim.ui.clipboard.osc52').copy('+'),
			['*'] = require('vim.ui.clipboard.osc52').copy('*'),
		},
		paste = {
			['+'] = vim_paste,
			['*'] = vim_paste,
		},
	}
end

-- This have to set before loading lazy
require('config.lazy')
require('keymaps')
