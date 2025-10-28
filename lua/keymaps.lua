local keyset = vim.keymap.set

keyset('i', '<C-H>', '<C-w>', { desc = 'Delete word' })
keyset('i', '<C-Delete>', '<C-o>dw', { desc = 'Forward delete word' })
keyset('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
keyset('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })
keyset('n', '<C-S-v>', '<C-v>', { desc = 'V-Block' })
keyset('n', '<F2>', vim.lsp.buf.rename, { desc = 'LSP Rename' })
keyset('n', 'gl', vim.diagnostic.open_float, { desc = 'Show Diagnostics' })
