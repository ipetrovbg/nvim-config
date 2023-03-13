set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set splitright
:set encoding=UTF-8

call plug#begin()

" Built-in LSP support
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig' " Enable LSP
Plug 'williamboman/nvim-lsp-installer'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" TODO: Find why these two wouldn't work :(
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

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

lua require("nvim-autopairs").setup {}
nnoremap <F12> :NERDTreeToggle<CR>
nnoremap <F10> :NERDTreeFind<CR>
nnoremap <silent>ff <cmd>Telescope find_files<cr>
nnoremap <silent>F <cmd>Telescope live_grep<cr>
nnoremap <silent>D <cmd>Telescope git_status<cr>
nnoremap <silent>π <cmd>Telescope buffers<CR>

" Git commands
" <Alt+D> populate command line with :G commit -m ""
" nnoremap Î :G commit -m  "<LEFT>"
" <Alt+P> populate command line with :G push
nnoremap ∏ :G push
nnoremap <leader>c :echo "Commit message: "<bar>let input = input("")<bar>execute ":G commit -m '" . input . "'"<CR> 

" nnoremap <silent>gd <cmd>Telescope lsp_definitions<CR>

" Moving lines up and down
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
nnoremap <silent>∂ yy p k<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

nmap <silent> gr <Plug>(coc-references) 

" Switching between screens
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Space> <C-w>w

" TODO: find a way to make this mapping
"capitalises the first letter of every word in a selection
" vnoremap <leader>c execute "'<,'> s/\<\(.\)\(\w*\)/\u\1\L\2/g"<CR> 

" Theme
:colorscheme gruvbox

" Lua settings
lua require("user.gitsigns_rc")
lua require("user.lsp")
lua require("user.icons")
