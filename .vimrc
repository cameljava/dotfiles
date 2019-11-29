" .vimrc
" Author: Kevin Lee

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'othree/eregex.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Chiel92/vim-autoformat'
Plug 'mbbill/undotree'
call plug#end()

" Basic settings and variables"{{{
" set rtp+=/usr/local/opt/fzf
set nocompatible ignorecase smartcase
syntax enable
set lazyredraw
set cursorline
set encoding=utf-8
set clipboard+=unnamed " Add the unnamed register to the clipboard
set autoread  "Automatically read a file that has changed on disk
set nobackup noswapfile     " stop backup and swap files
"turn on hidden to allow toggle between buffer with unsaved
set hidden
filetype plugin indent on
set autoindent
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab "setup default tab/shift/expand
set visualbell noerrorbells " don't beep
set shortmess=atI           " disable welcome screen
set showmode showcmd ttyfast
set ruler " Show the line and column number of the cursor position
set wildmenu " Display completion matches on your status line
set wrap linebreak nolist "allow wrap, not wrap within work
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
set nu rnu                      " show line numbers
set foldlevel=1             " default foldlevel 1 to see headings
set foldmethod=marker       " sets the fold method to {{{ }}} markers
set scrolloff=5 "keeps cursor away from top/bottom of screen
set sidescrolloff=5 "keeps cursor away from side of screen
set hlsearch incsearch      " hightlight search and incremental search
set gdefault                " global replace by default
set nowrapscan " turn off wrap scan, stop search at end/start of file
"set guioptions=a            " hide scrollbars/menu/tabs
set listchars=tab:\|\ ,trail:·,eol:¬
set nospell                 " disable spellcheck for code
set backspace=indent,eol,start "fix vi backspace
let mapleader = ","
let maplocalleader = ";"   "not sure about this, TODO
"set F8 to disable auto indenting for current file
nnoremap <F8> :setl noai nocin nosi inde=<CR>
"set f6 to toggle paste mode, when paste wont autoindent
set pastetoggle=<F6>
" Map Y to act like D and C, i.e. yank until EOL, rather than act like yy
map Y y$
" highlight last inserted text
nnoremap gV `[v`]
" End Basic settings and variables}}}

" Keyboard Shortcuts and remappings   "{{{
"changes with less keystrokes
nnoremap ; :
imap kk <ESC>
cmap kk <ESC>
imap jj <ESC>:w<CR>
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
"reload the .vimrc
nmap <silent> <leader>rv :source ~/.vimrc<CR>
"show spaces"
nmap <silent> <leader>l :set nolist!<CR>
"hide hightlight of searches"
nmap <silent> <BS> :nohlsearch<CR>
" Movements shortcuts {{{
" Buffer switching/management, might as well use those keys for something useful
map <Right> :bnext<CR>
imap <Right> <ESC>:bnext<CR>
map <Left> :bprev<CR>
imap <Left> <ESC>:bprev<CR>
" Maximize only this window"
nmap <silent> <leader>m :only<CR>
"vertical split"
nmap <silent> <leader>v :bel :vne<CR>
"horizontal split"
nmap <silent> <leader>h :bel :new<CR>
"close viewport buffer"
nmap <silent> <leader>x :hid<CR>
"format file
nmap <silent> <leader>f :Autoformat<CR>
" }}}
" Paste and visual paste improvments {{{
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
" }}}
" End Keyboard Shortcuts}}}

" Theme and Color {{{
set background=dark
" colorscheme solarized
colorscheme slate
" End Theme and Color }}}

" Quick editing  {{{
" Edit the .bashrc"
nmap <silent> <leader>eb :e ~/.bashrc<CR>
" Edit the .vimrc"
nmap <silent> <leader>ev :e ~/.vimrc<CR>
" Edit the .gitconfig"
nmap <silent> <leader>eg :e ~/.gitconfig<CR>
" Edit the .tmux.conf"
nmap <silent> <leader>et :e ~/.tmux.conf<CR>
" Edit slate configuration
"nmap <silent> <leader>el :e ~/.slate<cr>
" Open a scratch file
nmap <silent> <leader>eh :e ~/scratch.txt<CR>
" End Quick editing  }}}

" Plugins configuration"{{{
" Nerdtree "{{{
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let NERDTreeIgnore=['node_modules$[[dir]]', '\.git$[[dir]]']
"}}}
" Vim Airline {{{
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" }}}
" ale setting {{{
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'json': ['jsonlint'],
      \   'yaml': ['yamllint'],
      \   'xml': ['xmllint'],
      \}

let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['prettier', 'eslint'],
      \   'json': ['prettier', 'jq'],
      \   'yaml': ['prettier'],
      \}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none'
set omnifunc=ale#completion#OmniFunc

"  End ale setting }}}
" autoformat setting {{{

" End autoformat setting }}}
" End Plugins configuration"}}}
" get rid of E20 error
autocmd BufWrite * mark ' | silent! %s/\n\{3,}/\r\r\r/e | silent! exe "norm! ''"

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
" to get out of diff view, use :diffoff command
