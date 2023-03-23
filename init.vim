source ~/.config/nvim/defaults.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/colorscheme.vim

" Lua settings
lua require("nvim-autopairs").setup {}
lua require("user.gitsigns_rc")
lua require("user.lsp")
lua require("user.icons")
lua require("user.treesitter_config")
lua require("plugins")
