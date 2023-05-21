source ~/.config/nvim/defaults.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/startify.vim

lua require("plugins")
lua require("user.gitsigns_rc")
lua require("user.lsp")
lua require("user.icons")
lua require("user.treesitter_config")
