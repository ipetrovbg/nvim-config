local mapkey = require("util.keymapper").mapkey
local opts = { noremap = true, silent = true }

mapkey("<leader>pr", "echo expand('%:p')", "n", opts) -- Show Full File Path
mapkey("<Leader>pp", ":lua require'telescope.builtin'.spell_suggest{}<CR>", "n", opts)

vim.keymap.set("n", "<C-,>", "yy p k<CR>", opts)
vim.keymap.set("n", "<M-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<M-k>", ":m .-2<CR>==", opts)
vim.keymap.set("n", "aa", "ggVG<CR>", opts)
vim.keymap.set("v", "<", "<<CR>==gv", opts)
vim.keymap.set("v", ">", "><CR>==gv", opts)
vim.keymap.set("n", "<S-d>", "<C-d><CR>zz", opts)
vim.keymap.set("n", "<S-u>", "<C-u><CR>zz", opts)
vim.keymap.set("n", "<leader>rn", ":IncRename<CR>", opts)
vim.keymap.set("n", "<leader>k", ":Gvdiffsplit<CR>", opts)
vim.keymap.set({ "n", "v" }, "ga", "<Plug>(EasyAlign)", opts)
vim.keymap.set("n", "<leader>g", ":G blame<CR>", opts)

-- Harpoon
vim.keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", opts)
vim.keymap.set("n", "<leader>hr", ":lua require('harpoon.mark').toggle_file()<CR>", opts)

-- DB
vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", opts)
