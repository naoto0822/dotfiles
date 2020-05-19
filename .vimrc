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
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-abolish'
Plug 'vim-scripts/YankRing.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
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
set clipboard+=unnamed,unnamedplus
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

noremap <C-b> :NERDTreeToggle<CR>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()

""let g:lsp_async_completion = 1
"""let g:lsp_log_verbose = 1
"""let g:lsp_log_file = expand("~/vim-lsp.log")
""let g:lsp_diagnostics_enabled = 1
""let g:lsp_diagnostics_echo_cursor = 1
""let g:asyncomplete_auto_popup = 1
""let g:asyncomplete_auto_completeopt = 1
""let g:asyncomplete_popup_delay = 200
""" https://github.com/prabirshrestha/vim-lsp/issues/431
""let g:lsp_text_edit_enabled = 0

let g:go_get_update = 0
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


noremap <C-l><C-h> :LspHover<CR>
noremap <C-l><C-r> :LspRename<CR>

let g:strip_whitespace_on_save = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 25

" mattun
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')
" /mattun
"
"
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 0
let g:lsp_document_highlight_enabled = 1

let g:lsp_async_completion = 1
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_semantic_enabled = 1

if expand("%:t") =~ ".*\.go"
  set noexpandtab
  set tabstop=4
  set shiftwidth=4
  autocmd FileType go :highlight goErr ctermfg=214
  autocmd FileType go :match goErr /\<err\>/

  au FileType go setlocal omnifunc=lsp#complete
  au FileType go nmap <buffer> <C-]> <plug>(lsp-definition)
  au FileType go nmap <buffer> gd <plug>(lsp-definition)
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

if expand("%:t") =~ ".*\.rs"
  if executable('rls')
    augroup LspRust
      au!
      au User lsp_setup call lsp#register_server({
            \ 'name': 'rls',
            \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
            \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
            \ 'whitelist': ['rust'],
            \ })
      au FileType rs setlocal omnifunc=lsp#complete
      au FileType rs nmap <buffer> <C-]> <plug>(lsp-definition)
    augroup END
  endif
endif

if expand("%:t") =~ ".*\.ts"
  if executable('typescript-language-server')
    augroup LspTypeScript
      au!
      autocmd User lsp_setup call lsp#register_server({
            \ 'name': 'typescript-language-server',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
            \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
            \ 'whitelist': ['typescript'],
            \ })
      autocmd FileType typescript setlocal omnifunc=lsp#complete
    augroup END :echomsg "vim-lsp with `typescript-language-server` enabled"
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

