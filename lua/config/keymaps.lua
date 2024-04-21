local mapkey = require("util.keymapper").mapkey
local opts = { noremap = true, silent = true }

mapkey("<leader>pr", "echo expand('%:p')", "n", opts) -- Show Full File Path
mapkey("<Leader>pp", ":lua require'telescope.builtin'.spell_suggest{}<CR>", "n", opts)

vim.keymap.set("n", "<C-,>", "yy p k<CR>", opts)
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

-- Obsidian
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", opts)
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", opts)
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", opts)
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", opts)
vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>", opts)
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", opts)

-- Markdown
vim.keymap.set("n", "<leader>md", ":MarkdownPreview<CR>", opts)

-- Show the weather
vim.keymap.set("n", "<leader>wt", ":!curl 'wttr.in?format=3'<CR>", opts)

-- Intelrs
-- vim.keymap.set("n", "<leader>i", ":tabnew | enew | r ! intelrs<CR>", opts)
vim.keymap.set("n", "<leader>i", ":FloatermNew --width=0.5 intelrs<CR>", opts)
-- vim.keymap.set("n", "<leader>i", function()
--   require("./config/intels").show()
-- end, opts)

vim.keymap.set("n", "<leader>dd", ":bdelete!<CR>", opts)

-- LazyGit
vim.keymap.set("n", "<leader>gg", ":FloatermNew --width=1.0 --height=1.0 lazygit<CR>", opts)
