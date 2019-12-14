call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle'] }
Plug 'altercation/vim-colors-solarized'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-endwise'
Plug 'marcus/rsense'
Plug 'chase/vim-ansible-yaml'
call plug#end()

" ########################################
" base
" ########################################

set nocompatible
syntax on
syntax enable
set encoding=utf-8
set fileformats=unix,dos,mac
set autoindent
set number
set incsearch
set ignorecase
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set showcmd
set backspace=2
set wildmenu
set ruler
set clipboard=unnamed
set background=dark
colorscheme solarized

" lsp
let g:lsp_diagnostics_enabled = 0
" let g:lsp_async_completion = 1
let g:lsp_log_verbose = 0
let g:lsp_log_file = expand("~/vim-lsp.log")

" keymap
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap ' ''<ESC>i
inoremap '<Enter> ''<Left><CR><ESC><S-o>
inoremap " ""<ESC>i
inoremap "<Enter> ""<Left><CR><ESC><S-o>
inoremap <silent> jj <ESC>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
noremap <C-n> :NERDTreeToggle<CR>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-n> <Left>
inoremap <C-l> <Right>

" status line
set laststatus=2
highlight StatusLine ctermfg=DarkGray ctermbg=White
autocmd InsertEnter * highlight StatusLine ctermfg=DarkYellow ctermbg=White
autocmd Insertleave * highlight StatusLine ctermfg=DarkGray ctermbg=White

" ########################################
" Go
" ########################################

if expand("%:t") =~ ".*\.go"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
  autocmd FileType go :highlight goErr ctermfg=214
  autocmd FileType go :match goErr /\<err\>/

  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_auto_type_info = 0
  let g:go_auto_sameids = 0
  let g:go_gocode_unimported_packages = 1
  let g:go_gopls_complete_unimported = 1
  let g:go_gopls_deep_completion = 1
  let g:go_gopls_fuzzy_matching = 1
  let g:go_gopls_use_placeholders = 1
  let g:go_def_mode = 'gopls'
  let g:go_info_mode = 'gopls'

  if executable('gopls')
    augroup LspGo
      au!
      au User lsp_setup call lsp#register_server({
          \ 'name': 'gopls',
          \ 'cmd': {server_info->['gopls']},
          \ 'whitelist': ['go'],
          \ 'workspace_config': {'gopls': {
            \     'staticcheck': v:true,
            \     'completeUnimported': v:true,
            \     'caseSensitiveCompletion': v:true,
            \     'usePlaceholders': v:true,
            \     'completionDocumentation': v:true,
            \     'watchFileChanges': v:true,
            \     'hoverKind': 'SingleLine',
            \   }},
          \ })
      " au FileType go setlocal omnifunc=lsp#complete
    augroup END
  endif
endif

" ########################################
" Ruby
" ########################################

if expand("%:t") =~ ".*\.rb"
  set expandtab
  set tabstop=2
  set shiftwidth=2
  let g:rsenseUseOmniFunc = 1
endif

" ########################################
" Makefile
" ########################################

if expand("%:t") =~ "Makefile"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
endif


" ########################################
" shell
" ########################################

if expand("%:t") =~ ".*\.sh"
  set expandtab
  set tabstop=2
  set shiftwidth=2
endif

" etc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
