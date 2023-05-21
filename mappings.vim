nnoremap <F12> :NERDTreeToggle<CR>
nnoremap <F10> :NERDTreeFind<CR><bar>zz
nnoremap <F8>  :SymbolsOutline<CR>
nnoremap <F5> :UndotreeToggle<CR>

" Telescope functions
nnoremap <silent>ff <cmd>Telescope find_files<CR>
nnoremap <silent>F  <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent>D  <cmd>Telescope git_status<CR>
nnoremap <leader>q  <cmd>Telescope diagnostics<CR>
" Option+b
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>r <cmd>Telescope oldfiles<CR>
" Shift+Option+;
nnoremap Ú <cmd>Telescope command_history<CR>

" Option + f 
nnoremap <silent>ƒ <cmd>Telescope colorscheme<CR>
" Option+g 
nnoremap <leader>f <cmd>Telescope quickfix<CR>
" Shift+Option+l
nnoremap Ò<cmd> Telescope help_tags<CR>
" Shift+Option+f
nnoremap Ï <cmd>Telescope live_grep<CR>
nnoremap gr <cmd>Telescope lsp_references<CR>
nnoremap <leader>l <cmd>Telescope resume<CR>
nnoremap <leader>J <cmd>Telescope zoxide list<CR> 
nnoremap <leader>hp :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hr :lua require("harpoon.mark").toggle_file()<CR>
nnoremap <leader>hh <cmd>Telescope harpoon marks<CR>
nnoremap <leader>h :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>ht :lua require("harpoon.tmux").gotoTerminal("{left-of}")<CR>
" Find TODOs
nnoremap <leader>t :TodoTelescope keywords=TODO,FIX<CR>
" Spell checker
nnoremap <Leader>pp :lua require'telescope.builtin'.spell_suggest{}<CR>

" Git commands
nnoremap <leader>k :Gvdiffsplit<CR>
nnoremap <leader>g :G blame<CR>
nnoremap ∏ :G push
nnoremap <leader>c :echo "Commit message: "<bar>let input = input("")<bar>execute ":G commit -m '" . input . "'"<CR> 
nnoremap <leader>gk :G difftool

nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
nnoremap § vuw<CR>

" -- CENTERED CURSOR --
"  See defaults.vim for more options
nnoremap j jzz
nnoremap k kzz
nnoremap <Down> jzz
nnoremap <Up> kzz
nnoremap } }zz
nnoremap { {zz

" dosn't work for some reason
nnoremap % %zz<CR> 
nnoremap <S-g> Gzz<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Moving lines up and down with Option+j/k
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv

nnoremap ’ viw "*y<Esc>/<C-R><C-O>+
" Copy to main clipboard - Shift+Option+c
vnoremap Ç "*y
" Shift+Option+/ - Clear search selection
nnoremap <silent>¿ <Esc>:noh<CR>

vnoremap ˚ :m '<-2<CR>gv=gv
" Option+d
nnoremap <silent>∂ yy p k<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
nnoremap <C-a> ggVG<CR>
" handlers.lua
" nmap <silent> gr <Plug>(coc-references) 

"   -- WINDOWS --
" Switching between screens
nnoremap <Tab> <C-W><C-W> 

"   -- RESIZE WINDOWS --
nnoremap <silent> <C-L> :vertical resize -2<CR>
nnoremap <silent> <C-H> :vertical resize +2<CR>

"		 -- VISUAL --
vnoremap < <<CR>==gv
vnoremap > ><CR>==gv

" Capitalises The First Letter Of Every Word In A Selection
vnoremap <leader>u :s/\<\(.\)\(\w*\)/\u\1\L\2/g<CR>:noh<CR> 

" Multi-cursor support
let g:VM_maps                       = {}
let g:VM_maps["Select Cursor Down"] = '<C-j>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<C-k>'        " start selecting up
let g:VM_maps["Mouse Cursor"]       = '<C-LeftMouse>'

" Rename support
nnoremap <leader>rn :IncRename<CR>
vnoremap <silent>p "_dP<CR>
nnoremap <leader>db :DBUIToggle<CR>
" Should change that as it conflicts with some default actions
" nnoremap <silent><Enter> :Goyo<CR>



nnoremap <leader>z :ZenMode<CR>


" Save and quit
nnoremap <silent>Q :wa<CR>:qa<CR>
nnoremap <leader>H :Startify<CR>
nnoremap <leader>mi :MinimapToggle<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pr :echo expand('%:p')<CR>
