-- Ctrl-Space -> trigger completion
vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', { expr = true, silent = true })
-- Ctrl-Backspace -> delete word
vim.api.nvim_set_keymap('i', '<C-H>', '<C-w>', { noremap = true, silent = true })
-- Ctrl-Delete -> forward delete word
vim.api.nvim_set_keymap('i', '<C-Delete>', '<C-o>dw', { noremap = true, silent = true })
-- Tab -> Accept completion
vim.api.nvim_set_keymap('i', '<TAB>', [[coc#pum#visible() ? coc#_select_confirm() : "\<TAB>"]],
	{ expr = true, noremap = true })
-- Move selected lines down
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
-- Move selected lines up
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
