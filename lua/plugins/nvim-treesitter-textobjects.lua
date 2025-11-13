return {
	'nvim-treesitter/nvim-treesitter-textobjects',
	branch = 'main',
	dependencies = 'nvim-treesitter/nvim-treesitter',
	keys = {
		{
			'af',
			function()
				require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
			end,
			mode = { 'x', 'o' },
			desc = 'around function',
		},
		{
			'if',
			function()
				require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
			end,
			mode = { 'x', 'o' },
			desc = 'inner function',
		},
		{
			'ac',
			function()
				require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
			end,
			mode = { 'x', 'o' },
			desc = 'around class',
		},
		{
			'ic',
			function()
				require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
			end,
			mode = { 'x', 'o' },
			desc = 'inner class',
		},
		{
			'as',
			function()
				require('nvim-treesitter-textobjects.select').select_textobject('@local.scope', 'locals')
			end,
			mode = { 'x', 'o' },
			desc = 'around scope',
		},
		{
			']m',
			function()
				require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Next function start',
		},
		{
			'[m',
			function()
				require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Previous function start',
		},
		{
			']M',
			function()
				require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Next function end',
		},
		{
			'[M',
			function()
				require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Previous function end',
		},
		{
			']]',
			function()
				require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Next class start',
		},
		{
			'[[',
			function()
				require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Previous class start',
		},
		{
			'][',
			function()
				require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Next class end',
		},
		{
			'[]',
			function()
				require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
			end,
			mode = { 'n', 'x', 'o' },
			desc = 'Previous class end',
		},
	},
}
