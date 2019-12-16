" .vimrc
" Author: Kevin Lee

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
set nocompatible
silent! endwhile

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
" language syntax
Plug 'sheerun/vim-polyglot'
" ALE
Plug 'dense-analysis/ale'
" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Tim pope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" use standard regex instead of vim format
Plug 'othree/eregex.vim'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git related
Plug 'airblade/vim-gitgutter'
" git command wrapper
" Plug 'tpope/vim-fugitive'
" Format
" easy align(=)
Plug 'junegunn/vim-easy-align'
" easymotion
" Plug 'easymotion/vim-easymotion'
Plug 'Chiel92/vim-autoformat'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" Plug 'vim-scripts/argtextobj.vim'
" sort: gs+motion/object
" Plug 'christoomey/vim-sort-motion'
Plug 'rafi/awesome-vim-colorschemes'
call plug#end()

packadd! matchit

nnoremap ; :
" ? do we need map this, do we use ; in normal mode
" nnoremap : ;
let mapleader = ","
let maplocalleader = ";"   "not sure about this, TODO
" Basic settings and variables"
set updatetime=100
set ignorecase smartcase
set lazyredraw
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set clipboard+=unnamed " Add the unnamed register to the clipboard
set autoread  "Automatically read a file that has changed on disk
set nobackup noswapfile     " stop backup and swap files
set backupcopy=yes
"turn on hidden to allow toggle between buffer with unsaved
set hidden
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
set ttimeout    " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key
" Show @@@ in the last line if it is truncated.
set display=truncate
" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif
" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal
" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
noremap Q gq
" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

set completeopt=menu,menuone,preview,noselect,noinsert

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif
set nu rnu                      " show line numbers
"-- FOLDING --
set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened
set scrolloff=5 "keeps cursor away from top/bottom of screen
set sidescrolloff=5 "keeps cursor away from side of screen
set hlsearch " hightlight search search
set gdefault                " global replace by default
set nowrapscan " turn off wrap scan, stop search at end/start of file
"set guioptions=a            " hide scrollbars/menu/tabs
set listchars=tab:\|\ ,trail:·,eol:¬
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif
set history=1000
set tabpagemax=50
set nospell                 " disable spellcheck for code
set backspace=indent,eol,start "fix vi backspace
noremap <F3> :Autoformat<CR>
"set F7 to disable auto indenting for current file
nnoremap <F7> :setl noai nocin nosi inde=<CR>
"set f6 to toggle paste mode, when paste wont autoindent
set pastetoggle=<F6>
" Map Y to act like D and C, i.e. yank until EOL, rather than act like yy
noremap Y y$
" highlight last inserted text
nnoremap gV `[v`]

" Keyboard Shortcuts and remappings   "
"changes with less keystrokes
inoremap kk <ESC>
cnoremap <silent> kk <C-c>
inoremap <silent> jj <ESC>:w<CR>
inoremap jh <ESC>:wq<CR>
" F9 to toggle all folds for quick checking.
nmap <expr> <F9> &foldlevel ? 'zM':'zR'
" TODO
" inoremap <F9> <C-O><F9>
" onoremap <expr> <F9> <C-C>&foldlevel ? 'zM':'zR'
" vnoremap <expr> <F9> &foldlevel ? 'zM':'zR'
"reload the .vimrc
nmap <silent> <leader>rv :source ~/.vimrc<CR>
"show spaces"
nmap <silent> <leader>l :set nolist!<CR>
"hide hightlight of searches"
nmap <silent> <BS> :nohlsearch<CR>
" Insert mode mapping
" delete text you have typed in insert mode, recoverable by u
inoremap <c-u> <c-g>u<c-u>
" delete word before cursor, recoverable by u
inoremap <c-w> <c-g>u<c-w>

" Movements shortcuts
" Buffer switching/management, might as well use those keys for something useful
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
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
" Paste and visual paste improvments
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


" Quick editing
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

" Plugins configuration"

" Nerdtree "
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['node_modules$[[dir]]', '\.git$[[dir]]']

" Vim Airline
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
" ale setting
" let g:jsx_ext_required = 0
" individual fixer and liner defined in ft folder
let g:ale_fixers = {
      \   '*': ['trim_whitespace'],
      \}
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
set omnifunc=ale#completion#OmniFunc
nmap <silent> [[ <Plug>(ale_previous_wrap)
nmap <silent> ]] <Plug>(ale_next_wrap)
noremap <Leader>lf :ALEFix<CR>


let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" turn on quickfix list
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1

" gitgutter settings
" eregex setting, use / to find. :%S// (uppercase S) to replace
nnoremap / :M/
nnoremap ,/ /

" End Plugins configuration"}}}

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
          \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
          \ |   exe "normal! g`\""
          \ | endif

  augroup END

endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif

nnoremap <F8> :TagbarToggle<CR>

" Theme and Color
set background=dark
" set background=light
set termguicolors
" colorscheme slate

" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" let g:airline_theme='oceanicnext'
" colorscheme OceanicNext

" colorscheme nord

" colorscheme onedark
" colorscheme purify

let g:rehash256 = 1
colorscheme molokai

" colorscheme gruvbox
