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
set guicursor=a:blinkwait5-blinkon1-blinkoff5
set wrap!
set cursorcolumn
set cursorline


set updatetime=50
augroup HighlightUnderCursor
  au!
  au CursorHold * :exec 'match Search /' . escape('\V\<' . expand('<cword>') . '\>', '/') . '/'
augroup END

augroup ElmFormatOnSave
	au!
  au BufWritePre *.elm :Format 
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Centering while navigating
nnoremap j jzz
nnoremap k kzz
nnoremap <Down> jzz
nnoremap <Up> kzz
nnoremap } }zz
nnoremap { {zz
nnoremap % %zz 
