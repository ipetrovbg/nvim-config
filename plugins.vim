call plug#begin()

Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
" Built-in LSP support
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig' " Enable LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'simrat39/rust-tools.nvim'
" Plug 'rust-lang/rust.vim'

Plug 'simrat39/symbols-outline.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/playground'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'https://github.com/tpope/vim-fugitive' " Git integration
Plug 'lewis6991/gitsigns.nvim' " Shows line indication on the side on which line there is a change

Plug 'nvim-tree/nvim-web-devicons'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree

" make a selection, type S and with what you want to surround.
" `cs<with the symbol that currently surrounds> then <what you want to replace it with>
" e.g. "Hello World" to be 'Hello World' you need `cs"'` 
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)

Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'jvgrootveld/telescope-zoxide'
Plug 'https://github.com/RRethy/vim-illuminate', { 'branch': 'master' }
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'Vonr/align.nvim'
Plug 'smjonas/inc-rename.nvim'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*', 'do': 'make install_jsregexp'}
Plug 'folke/todo-comments.nvim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-dotenv'
Plug 'nvim-lualine/lualine.nvim'
" Themes
Plug 'mhartington/oceanic-next'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
Plug 'navarasu/onedark.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'zbirenbaum/copilot.lua'
Plug 'folke/zen-mode.nvim'
Plug 'mbbill/undotree'
Plug 'unblevable/quick-scope'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-dispatch'
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}

call plug#end()
