local NS = { noremap = true, silent = true }
-- Aligning text
vim.keymap.set('x', 'aa', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
vim.keymap.set('x', 'as', function() require'align'.align_to_char(2, true, true)       end, NS)
