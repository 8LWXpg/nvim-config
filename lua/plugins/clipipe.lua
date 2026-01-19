return {
	'bkoropoff/clipipe',
	enabled = vim.env.SSH_TTY == nil and
		(vim.fn.has('wsl') ~= 0 or vim.fn.has('win32') ~= 0),
	event = 'UIEnter',
	opts = {},
}
