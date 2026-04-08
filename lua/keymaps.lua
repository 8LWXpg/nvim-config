local keyset = vim.keymap.set

keyset('i', '<C-H>', '<C-w>', { desc = 'Delete word' })
keyset('i', '<C-Delete>', '<C-o>dw', { desc = 'Forward delete word' })
keyset('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
keyset('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
keyset('n', '<C-S-v>', '<C-v>', { desc = 'V-Block' })
keyset('n', '<F2>', vim.lsp.buf.rename, { desc = 'LSP Rename' })
keyset('n', 'gl', vim.diagnostic.open_float, { desc = 'Show Diagnostics' })

-- Incremental selection treesitter/lsp
keyset({ 'n', 'x', 'o' }, '<A-o>', function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require('vim.treesitter._select').select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = 'Select parent treesitter node or outer incremental lsp selections' })

keyset({ 'n', 'x', 'o' }, '<A-u>', function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require('vim.treesitter._select').select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = 'Select child treesitter node or inner incremental lsp selections' })
