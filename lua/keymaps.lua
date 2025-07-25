local keyset = vim.api.nvim_set_keymap

-- Ctrl-Backspace -> delete word
keyset('i', '<C-H>', '<C-w>', { noremap = true, silent = true })
-- Ctrl-Delete -> forward delete word
keyset('i', '<C-Delete>', '<C-o>dw', { noremap = true, silent = true })
-- Move selected lines down
keyset('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines up
keyset('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- Ctrl-Shift-V -> V-Block
keyset('n', '<C-S-v>', '<C-v>', { noremap = true })
