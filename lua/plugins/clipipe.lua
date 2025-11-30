return {
	'bkoropoff/clipipe',
	cond = vim.env.SSH_TTY == nil and
		(vim.fn.has('wsl') or vim.fn.has('win32')),
	opts = {},
}
