" vim plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'Shougo/neocomplete.vim'
call plug#end()

" neocomplete.vim
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Default
syntax on
syntax enable
set encoding=utf-8
set fileformats=unix,dos,mac
set autoindent
set number
set expandtab
set tabstop=2
set shiftwidth=2
set showcmd
set backspace=2
set wildmenu
set ruler

" ruby
if expand("%:t") =~ ".*\.rb"
  set expandtab
  set tabstop=2
  set shiftwidth=2
endif

" Makefile
if expand("%:t") =~ "Makefile"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
endif

" sh
if expand("%:t") =~ ".*\.sh"
  set expandtab
  set tabstop=2
  set shiftwidth=2
endif
