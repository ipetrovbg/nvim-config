let mapleader = " " " map leader to Space
set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set splitright
set encoding=UTF-8
set ignorecase
set smartcase

" The blinking cursor is done by the alacritty config file. See ~/.alacritty.yml

set nowrap
set cursorcolumn
set cursorline
set list listchars=tab:»-,trail:·,extends:»,precedes:«

" ]s to go to the next spell mistake
" z= to see all "correct" variants
" 1z= to use vim's first suggestion
" zg add word under the cursor to the dictionary
" zw undo and remove a word from dictionary
" colour
set spelllang=en_gb
set spell

" set so=999
" set so=0

" augroup VCenterCursor
"   au!
"   au BufEnter,WinEnter,WinNew,VimResized *,*.*
"         \ let &scrolloff=winheight(win_getid())/2
" augroup END

augroup ElmFormatOnSave
  au!
	" formats elm files on save
  au BufWritePre *.elm :Format 
	" formats json files on save
  au BufWritePre *.json :%!jq . 
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" This setting will highlight the cues that you can search for only when you press f, F, t, or T.
" It doesn't work with f, F for some reason. One reason might be that I
" already have a mapping for ff and F that searches for word in the file or
" searches files in the project.
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=150
