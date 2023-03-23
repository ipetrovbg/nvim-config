nnoremap <F12> :NERDTreeToggle<CR>
nnoremap <F10> :NERDTreeFind<CR><bar>zz
nnoremap <F8> :SymbolsOutline<CR>

" Telescope functions
nnoremap <silent>ff <cmd>Telescope find_files<CR>
nnoremap <silent>F <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent>D <cmd>Telescope git_status<CR>
nnoremap <leader>q <cmd>Telescope diagnostics<CR>
" Option+b
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>r <cmd>Telescope oldfiles<CR>
" Shift+Option+;
nnoremap Ú <cmd>Telescope command_history<CR>

" Option + f 
nnoremap <silent>ƒ <cmd>Telescope colorscheme<CR>
" Option+g 
nnoremap <silent>© <cmd>Telescope quickfix<CR>
" Shift+Option+l
nnoremap Ò<cmd> Telescope help_tags<CR>
" Shift+Option+f
nnoremap Ï <cmd>Telescope live_grep<CR>
" Git commands
nnoremap gr <cmd>Telescope lsp_references<CR>
nnoremap Z <cmd> Telescope zoxide list<CR> 
" nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>
" nnoremap <leader>p <cmd>Telescope harpoon marks<CR>

nnoremap ∏ :G push
nnoremap <leader>c :echo "Commit message: "<bar>let input = input("")<bar>execute ":G commit -m '" . input . "'"<CR> 

" Moving lines up and down with Option+j/k
nnoremap ∆ :m .+1<CR>==zz
nnoremap ˚ :m .-2<CR>==zz
nnoremap § vuw<CR>
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv

" Shift+Optioin+]
nnoremap ’ viw "*y<Esc>/<C-R><C-O>+
" Copy to main clipboard - Shift+Option+c
vnoremap Ç "*y
" Shift+Option+/ - Clear search selection
nnoremap ¿ <Esc>:noh<CR>

vnoremap ˚ :m '<-2<CR>gv=gv
" Option+d
nnoremap <silent>∂ yy p k<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
nnoremap <C-a> ggVG<CR>
" TODO: I should probably disable this as I want to use lua vim.buf keys. See
" handlers.lua
" nmap <silent> gr <Plug>(coc-references) 

" Switching between screens
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <Tab> <C-W><C-W>

" TODO: find a way to make this mapping
"capitalises the first letter of every word in a selection
" vnoremap <leader>c execute "'<,'> s/\<\(.\)\(\w*\)/\u\1\L\2/g"<CR> 

