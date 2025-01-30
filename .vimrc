call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'tpope/vim-endwise'
Plug 'chase/vim-ansible-yaml'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mattn/vim-goimports'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle'] }
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'github/copilot.vim'
Plug 'tomasiser/vim-code-dark'
call plug#end()

"---------------------------------------------------------------------------
" Key Map:"{{{
"
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
colorscheme codedark
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
noremap <C-l><C-h> :LspHover<CR>
noremap <C-l><C-r> :LspRename<CR>
vnoremap < <gv
vnoremap > >gv
"}}}
"---------------------------------------------------------------------------
" Status Bar:"{{{
"
let g:airline#extensions#tabline#enabled = 1
"}}}
"---------------------------------------------------------------------------
" File Tree:"{{{
"
noremap <C-b> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
"}}}
"---------------------------------------------------------------------------
" Code Commenter:"{{{
"
filetype plugin on
let g:NERDDefaultAlign='left'
vmap ++ <Plug>NERDCommenterToggle
nmap ++ <Plug>NERDCommenterToggle
"}}}
"---------------------------------------------------------------------------
" Search:"{{{
"
fun! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GFiles
  endif
endfun
nnoremap <C-p> :call FzfOmniFiles()<CR>

command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%:hidden', '?'),
\ <bang>0)
nnoremap <C-g> :Rg<CR>

nnoremap fr vawy:Rg <C-R>"<CR>
xnoremap fr y:Rg <C-R>"<CR>
"}}}
"---------------------------------------------------------------------------
" If Backspace Action:"{{{
"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
"}}}
"---------------------------------------------------------------------------
" ntpeters/vim-better-whitespace:"{{{
"
let g:strip_whitespace_on_save = 1
"}}}
"---------------------------------------------------------------------------
" nathanaelkane/vim-indent-guides:"{{{
"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 25
"}}}
"---------------------------------------------------------------------------
" LSP:"{{{
"
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

" let g:lsp_async_completion = 1
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand("~/vim-lsp.log")
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_auto_completeopt = 1
" let g:asyncomplete_popup_delay = 200
" https://github.com/prabirshrestha/vim-lsp/issues/431
" let g:lsp_text_edit_enabled = 0

if expand("%:t") =~ ".*\.go"
  "set noexpandtab
  "set tabstop=4
  "set shiftwidth=4
  au FileType go setlocal sw=4 ts=4 sts=4 noet
  autocmd FileType go :highlight goErr ctermfg=214
  autocmd FileType go :match goErr /\<err\>/

  " Syntax Highlight
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_auto_type_info = 0
  let g:go_auto_sameids = 0

  "let g:go_def_mode = 'gopls'
  "let g:go_info_mode = 'gopls'
  "let g:go_code_completion_enabled = 1
  "let g:go_jump_to_error = 0
  "let g:go_fmt_autosave = 0
  "let g:go_imports_autosave = 0
  "let g:go_mod_fmt_autosave = 0
  "let g:go_doc_keywordprg_enabled = 0
  "let g:go_def_mapping_enabled = 0
  "let g:go_get_update = 0
  "let g:go_gopls_enabled = 0
  let g:go_textobj_enabled = 0
  let g:go_def_mapping_enabled = 0
  let g:go_gopls_enabled = 0
  let g:go_code_completion_enabled = 0

  let g:goimports = 1

  au FileType go setlocal omnifunc=lsp#complete
  au FileType go nmap <buffer> <C-]> <plug>(lsp-definition)
  au FileType go nmap <buffer> gd <plug>(lsp-definition)

  let g:lsp_settings = {
      \  'gopls': {
      \    'initialization_options': {
      \      'gofumpt': v:true,
      \      'staticcheck': v:true,
      \    },
      \  }
      \}
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
      au FileType rs nmap <buffer> gd <plug>(lsp-definition)
    augroup END
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

if expand("%:t") =~ ".*\.nas"
  set ft=nasm
endif
"}}}
