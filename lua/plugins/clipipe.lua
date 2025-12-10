return {
	'bkoropoff/clipipe',
	enabled = vim.env.SSH_TTY == nil and
		(vim.fn.has('wsl') or vim.fn.has('win32')),
	opts = {},
}
