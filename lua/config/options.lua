local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 2
opt.autoindent = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "80"
opt.cursorline = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = false
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamed,unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
opt.updatetime = 400

-- Spellcheck
opt.spelllang = "en_gb"
opt.spell = true
vim.g.qs_buftype_blacklist = { "terminal", "nofile" }
vim.g.qs_max_chars = 180
vim.g.qs_lazy_highlight = true
