
" Makefile
if expand("%:t") =~ "Makefile"
  set noexpandtab
endif

" sh
if expand("%:t") =~ ".*\.sh"
  set expandtab
  set tabstop=2
  set shiftwidth=2
endif
