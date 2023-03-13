require('gitsigns').setup {
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
		  opts = opts or {}
		  opts.buffer = bufnr
		  vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map('n', ']c', function()
		  if vim.wo.diff then return ']c' end
		  vim.schedule(function() gs.next_hunk() end)
		  return '<Ignore>'
		end, {expr=true})

		map('n', '[c', function()
		  if vim.wo.diff then return '[c' end
		  vim.schedule(function() gs.prev_hunk() end)
		  return '<Ignore>'
		end, {expr=true})

		map('n', '<leader>hb', function() gs.blame_line{full=true} end)
		map('n', '', gs.diffthis)

	end
}

