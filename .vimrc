" vim plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'Shougo/neocomplcache'
call plug#end()

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
