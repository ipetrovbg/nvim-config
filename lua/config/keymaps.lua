local mapkey = require("util.keymapper").mapkey
local merge = require("util.keymapper").table_merge
local opts = { noremap = true, silent = true }

mapkey("<leader>pr", "echo expand('%:p')", "n", merge(opts, { desc = "Show Full File Path" })) -- Show Full File Path
mapkey("<Leader>pp", ":lua require'telescope.builtin'.spell_suggest{}<CR>", "n",
  merge(opts, { desc = "Spelling Suggestion" }))

vim.keymap.set("n", "<C-,>", "yy p k<CR>", merge(opts, { desc = "Duplicate lines" }))
vim.keymap.set("n", "aa", "ggVG<CR>", merge(opts, { desc = "Select all" }))
vim.keymap.set("v", "<", "<<CR>==gv", opts)
vim.keymap.set("v", ">", "><CR>==gv", opts)
vim.keymap.set("n", "<S-d>", "<C-d><CR>zz", merge(opts, { desc = "Scroll Down" }))
vim.keymap.set("n", "<S-u>", "<C-u><CR>zz", merge(opts, { desc = "Scroll Up" }))
vim.keymap.set("n", "<leader>rn", ":IncRename<CR>", merge(opts, { desc = "Rename" }))
vim.keymap.set("n", "<leader>k", ":Gvdiffsplit<CR>", merge(opts, { desc = "Git Diff Split" }))
vim.keymap.set({ "n", "v" }, "ga", "<Plug>(EasyAlign)", merge(opts, { desc = "Align" }))
vim.keymap.set("n", "<leader>g", ":G blame<CR>", merge(opts, { desc = "Open Git blame" }))
-- Loom
vim.keymap.set("n", "<leader>ll", ":LoomPicker<CR>", merge(opts, { desc = "Loom Picker" }))
vim.keymap.set("n", "<leader>lr", ":Telescope loom references<CR>", merge(opts, { desc = "Loom References" }))
vim.keymap.set("n", "<leader>lp", ":LoomPreview<CR>", merge(opts, { desc = "Loom Prevew" }))
vim.keymap.set("n", "<leader>lo", ":Telescope loom orphaned<CR>", merge(opts, { desc = "Orphaned Looms" }))

-- Not Harpoon
vim.keymap.set("n", "<leader>ha", function()
  vim.cmd("argadd %")
  vim.cmd("argdedup")
end, merge(opts, { desc = "Add to filelist" }))

vim.keymap.set("n", "<leader>hr", function()
  vim.cmd.args()
end, merge(opts, { desc = "Show filelist" }))

vim.keymap.set("n", "<C-j>", function()
  vim.cmd("silent! 1argument")
end, merge(opts, { desc = "First file in filelist" }))

vim.keymap.set("n", "<C-l>", function()
  vim.cmd("silent! 2argument")
end, merge(opts, { desc = "Second file in filelist" }))

-- gh browse
vim.keymap.set("n", "<leader>gb", ":GhBrowse<CR>", merge(opts, { desc = "Open in GitHub" }))

-- DB
vim.keymap.set("n", "<leader>db", ":DBUIToggle<CR>", merge(opts, { desc = "Open Database UI" }))

-- Obsidian
vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", merge(opts, { desc = "Obsidian Today" }))
vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", merge(opts, { desc = "Obsidian New Note" }))
vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>", merge(opts, { desc = "Obsidian Search" }))
vim.keymap.set("n", "<leader>ob", ":ObsidianBacklinks<CR>", merge(opts, { desc = "Obsidian Back Links" }))
vim.keymap.set("n", "<leader>ol", ":ObsidianLinks<CR>", merge(opts, { desc = "Obsidian Links" }))
vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", merge(opts, { desc = "Obsidian Open" }))
vim.keymap.set("n", "<leader>of", ":ObsidianQuickSwitch<CR>", merge(opts, { desc = "Obsidian Quick Switch" }))

-- Markdown
-- vim.keymap.set("n", "<leader>md", ":MarkdownPreview<CR>", merge(opts, { desc = "Markdown Preview" }))

-- Show the weather
vim.keymap.set("n", "<leader>wt", ":!curl 'wttr.in/Sofia?format=3'<CR>", merge(opts, { desc = "Show Weather" }))

-- Intelrs
vim.keymap.set("n", "<leader>i", function()
  require("./config/intels").show()
end, merge(opts, { desc = "Collect Intels" }))

-- Jira
vim.keymap.set("n", "<leader>j", function()
  require("./config/jira").show()
end, merge(opts, { desc = "Jira Issues" }))

vim.keymap.set("n", "<leader>dd", ":bdelete!<CR>", opts)

-- LazyGit
vim.keymap.set("n", "<leader>gg", ":FloatermNew --width=1.0 --height=1.0 lazygit<CR>", opts)

-- GitHub PRs
vim.keymap.set("n", "<leader>gh", ":Ghpr<CR>", opts)

-- Multi-cursor
vim.keymap.set("n", "<leader>vp", "<Plug>(VM-Add-Cursor-At-Pos)", opts)
vim.keymap.set("n", "<leader>vt", "<Plug>(VM-Toggle-Mappings)", opts)

vim.keymap.set("i", "jj", "<Esc><CR>", opts)

-- s/\%V\(\k\+\)\(\s*[,|:]\s*\)\(\k\+\)/\3\2\1/
vim.keymap.set("v", "<leader>ww", ":<C-u>'<,'>s/\\%V\\(\\k\\+\\)\\(\\s*[ ,|:]\\s*\\)\\(\\k\\+\\)/\\3\\2\\1/<CR>:noh<CR>",
  { noremap = true, silent = true })
