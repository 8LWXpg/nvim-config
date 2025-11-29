return {
	'bkoropoff/clipipe',
	cond = os.getenv('SSH_TTY') == nil and
		os.getenv('WSLENV') ~= nil and
		jit.os == 'Windows',
	opts = {},
}
