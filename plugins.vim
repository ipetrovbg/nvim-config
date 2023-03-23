call plug#begin()

Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
" Built-in LSP support
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig' " Enable LSP

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'simrat39/rust-tools.nvim'

Plug 'simrat39/symbols-outline.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'https://github.com/tpope/vim-fugitive' " Git integration
Plug 'lewis6991/gitsigns.nvim'

" Tree icons TODO: doesn't work either
Plug 'nvim-tree/nvim-web-devicons'

Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 's1n7ax/nvim-terminal'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhartington/oceanic-next'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'jvgrootveld/telescope-zoxide'

call plug#end()
