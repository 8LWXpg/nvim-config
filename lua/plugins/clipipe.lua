return {
	'bkoropoff/clipipe',
	cond = os.getenv('SSH_TTY') == nil and
		(os.getenv('WSLENV') ~= nil or
			jit.os == 'Windows'),
	opts = {},
}
