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
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-abolish'
call plug#end()

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
set virtualedit=onemore

inoremap <silent> jj <ESC>

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

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-w> <ESC>$i
inoremap <C-b> <ESC>0i
noremap <C-w> <ESC>$
noremap <C-b> <ESC>0
noremap <C-n><C-h> :noh<CR>

vnoremap < <gv
vnoremap > >gv

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

noremap <C-n> :NERDTreeToggle<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()

let g:lsp_async_completion = 1
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand("~/vim-lsp.log")
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200
" https://github.com/prabirshrestha/vim-lsp/issues/431
let g:lsp_text_edit_enabled = 0

noremap <C-l><C-h> :LspHover<CR>
noremap <C-l><C-r> :LspRename<CR>

let g:strip_whitespace_on_save = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 25

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
  let g:go_def_mode = 'gopls'
  let g:go_info_mode = 'gopls'
  let g:go_code_completion_enabled = 0
  let g:go_def_mapping_enabled = 0

  if executable('gopls')
    augroup LspGo
      au!
      au User lsp_setup call lsp#register_server({
            \ 'name': 'gopls',
            \ 'cmd': {server_info->['gopls']},
            \ 'whitelist': ['go'],
            \ 'initialization_options': {
              \ 'diagnostics': v:true,
              \ 'completeUnimported': v:true,
              \ 'matcher': 'fuzzy',
              \ },
            \ 'workspace_config': {'gopls': {
              \ 'completeUnimported': v:true,
              \ 'caseSensitiveCompletion': v:true,
              \ 'usePlaceholders': v:true,
              \ 'completionDocumentation': v:true,
              \ 'watchFileChanges': v:true,
              \ 'hoverKind': 'SingleLine',
              \ }},
            \ })
      au FileType go setlocal omnifunc=lsp#complete
      au FileType go nmap <buffer> <C-]> <plug>(lsp-definition)
      au FileType go nmap <buffer> gd <plug>(lsp-definition)
    augroup END
  endif
endif

if expand("%:t") =~ ".*\.cpp"
  if executable('clangd')
    au User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd', '-background-index']},
          \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
          \ })
    let g:lsp_signs_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
    au FileType c,cc,cpp,cxx,h,hpp setlocal omnifunc=lsp#complete
  endif
endif

if expand("%:t") =~ ".*\.rb"
  set expandtab
  set tabstop=2
  set shiftwidth=2
  let g:rsenseUseOmniFunc = 1
endif

if expand("%:t") =~ "Makefile"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
endif

if expand("%:t") =~ ".*\.sh"
  set expandtab
  set tabstop=2
  set shiftwidth=2
endif

