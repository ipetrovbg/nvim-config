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
-- opt.hlsearch = false

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
-- Blinking cursor doesn't work
-- opt.guicursor =
-- "n-v-c:block-nCursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"
opt.updatetime = 400

-- Spellcheck
opt.spelllang = "en_gb"
opt.spell = true
vim.g.qs_buftype_blacklist = { "terminal", "nofile" }
vim.g.qs_max_chars = 180
vim.g.qs_lazy_highlight = true
