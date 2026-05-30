local function region_marker_provider(bufnr)
	local foldmarker = vim.opt.foldmarker:get()
	local open_marker = vim.pesc(foldmarker[1])
	local close_marker = vim.pesc(foldmarker[2])

	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local ranges = {}
	local stack = {}

	for i, line in ipairs(lines) do
		if line:match(open_marker) then
			table.insert(stack, { line = i - 1, text = line:match(open_marker .. '%s*(.*)$') })
		elseif line:match(close_marker) and #stack > 0 then
			local start = table.remove(stack)
			table.insert(ranges, {
				startLine = start.line,
				endLine = i - 1,
				kind = 'region',
				-- shown when fold is closed
				label = start.text ~= '' and start.text or foldmarker[1],
			})
		end
	end

	return ranges
end

return {
	'kevinhwang91/nvim-ufo',
	dependencies = 'kevinhwang91/promise-async',
	event = { 'BufReadPost', 'BufNewFile' },
	opts = {
		provider_selector = function() return { 'lsp', region_marker_provider } end,
	},
	keys = {
		{
			'K',
			function()
				if not require('ufo').peekFoldedLinesUnderCursor() then vim.lsp.buf.hover() end
			end,
			'Peek Fold or LSP Hover',
		},
	},
}
