" vimrc
" author: Kevin Lee

" comment out compatible checking, avoid vint complaint
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
" silent! while 0
" set nocompatible
" silent! endwhile

" to worry about: from bronson/dotfiles
filetype on   " work around stupid osx bug
filetype off
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'chrisbra/unicode.vim'
" Tim pope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'

"  === vim basic enhancement
" text obj
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
" syntax based text-object for function
Plug 'haya14busa/vim-textobj-function-syntax'

" search
" use standard regex instead of vim format
Plug 'othree/eregex.vim'

" Automatically clear search highlights after you move your cursor.
Plug 'haya14busa/is.vim'
" asterisk.vim provides improved * motions
Plug 'haya14busa/vim-asterisk'
" show search status
Plug 'osyo-manga/vim-anzu'
" highlight yank
Plug 'machakann/vim-highlightedyank'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Handle multi-file find and replace. turn off this - used in nvim, experience different
" plugin here.
" Plug 'mhinz/vim-grepper'
" use easegrep for refactor name
Plug 'dkprice/vim-easygrep'

" Run a diff on 2 directories.
Plug 'will133/vim-dirdiff'
" Run a diff on 2 blocks of text.
Plug 'AndrewRadev/linediff.vim'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-buffer-ops'

" Syntax highlighting language pack for vim
Plug 'sheerun/vim-polyglot'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" git commit browse
Plug 'junegunn/gv.vim'
" git branch
Plug 'sodapopcan/vim-twiggy'
Plug 'jreybert/vimagit'

" ====  IDE feature

" change buffer name both in vim and filesystem
Plug 'danro/rename.vim'

" auto generate tags file
Plug 'ludovicchabant/vim-gutentags'
" tagbar like view
Plug 'liuchengxu/vista.vim'

" Edit the quickfix/location list freely
" Plug 'itchyny/vim-qfedit'
" Plug 'jceb/vim-editqf'
" Plug 'romainl/vim-qf' -- tested in nvim
" Change code right in quickfix/location list
Plug 'stefandtw/quickfix-reflector.vim'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}
" Zoom in and out of a specific split pane (similar to tmux).
" Plug 'dhruvasagar/vim-zoom'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'

Plug 'rafi/awesome-vim-colorschemes'
" Dim paragraphs above and below the active paragraph.
Plug 'junegunn/limelight.vim'
" Distraction free writing by removing UI elements and centering everything.
Plug 'junegunn/goyo.vim'

" *********** vim different from nvim

" ALE
Plug 'dense-analysis/ale'

" Plug 'majutsushi/tagbar'

" Format
Plug 'Chiel92/vim-autoformat'
" auto pair
Plug 'jiangmiao/auto-pairs'
" easy align(=)
Plug 'junegunn/vim-easy-align'
" Run a diff on 2 directories.

" easymotion
" Plug 'easymotion/vim-easymotion'
Plug 'mbbill/undotree'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'vim-scripts/argtextobj.vim'
" sort: gs+motion/object
" Plug 'christoomey/vim-sort-motion'

" a text searching plugin
Plug 'dyng/ctrlsf.vim'

" Run test suites for various languages.
Plug 'janko/vim-test'

Plug 'rizzatti/dash.vim'

Plug 'nanotee/zoxide.vim'

call plug#end()

packadd! matchit

nnoremap ; :
" do we really need below mapping?if on will affect below remap
" nnoremap : ;

let mapleader = ','
let maplocalleader = ';'   "not sure about this, TODO
" Basic settings and variables"
" Timeout of user inactivity. Used to save swap file, and by vim-gitgutter plugin
set updatetime=300
set ignorecase smartcase
set lazyredraw
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
scriptencoding utf-8
set clipboard=unnamed " Add the unnamed register to the clipboard
set autoread  "Automatically read a file that has changed on disk
set nobackup nowritebackup noswapfile noundofile
set backupcopy=yes
set backupext=.vbak
set backupdir=~/tmp/.vim/.backup
" allways show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
"turn on hidden to allow toggle between buffer with unsaved
set hidden
set autoindent
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab "setup default tab/shift/expand
set visualbell noerrorbells " don't beep
set shortmess=atI           " disable welcome screen
set showmode showcmd ttyfast
set ruler " Show the line and column number of the cursor position
set wrap linebreak nolist "allow wrap, not wrap within work
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048
set ttimeout    " time out for key codes
set ttimeoutlen=30 " wait up to 100ms after Esc for special key
" Show @@@ in the last line if it is truncated.
set display=truncate
" Do incremental searching when it's possible to timeout.
" if has('reltime')
set incsearch
" endif
" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal
" Don't use Ex mode, use Q for formatting.
" Revert with ':unmap Q'.
noremap Q gq
" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif
if &diff
    set noreadonly
endif
set completeopt=menu,menuone,preview,noselect,noinsert

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has('gui_running')
  " Revert with ':syntax off'.
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ':unlet c_comment_strings'.
  let c_comment_strings=1
endif
set number rnu                      " show line numbers

" no fold
set nofoldenable
set scrolloff=5 "keeps cursor away from top/bottom of screen
set sidescrolloff=5 "keeps cursor away from side of screen
set hlsearch " hightlight search search
set gdefault                " global replace by default
" set nowrapscan " turn off wrap scan, stop search at end/start of file
"set guioptions=a            " hide scrollbars/menu/tabs
set listchars=tab:\|\ ,trail:·,eol:¬
if v:version > 703 || v:version == 703 && has('patch541')
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
" abbrev for split buffer vertically
cabbrev vb vert sb

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig,*.rej "Merge resolution files"

" press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Keyboard Shortcuts and remappings   "
nnoremap <leader>w :w<CR>
" cursor not moving left when you exit from insert mode
inoremap <Esc> <Esc>`^
"changes with less keystrokes
cnoremap <silent> kk <C-c>
inoremap jj <ESC>`^:update<CR>
inoremap jh <ESC>:wq<CR>
"reload the .vimrc
nnoremap <silent> <leader>rv :source ~/.vimrc<CR>
"show spaces"
nnoremap <silent> <leader>l :set nolist!<CR>
"hide hightlight of searches" comment out as installed is
" nnoremap <silent> <BS> :nohlsearch<CR>
" Insert mode mapping
" delete text you have typed in insert mode, recoverable by u
inoremap <c-u> <c-g>u<c-u>
" delete word before cursor, recoverable by u
inoremap <c-w> <c-g>u<c-w>

" Movements shortcuts
" Buffer switching/management, might as well use those keys for something useful
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
nnoremap <leader>x :bd<CR>

" create window size by 1.5 ; decreate window size by 0.67
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

" Maximize only this window"
nnoremap <silent> <leader>m :only<CR>
"vertical split"
nnoremap <silent> <leader>v :bel :vne<CR>
"horizontal split"
nnoremap <silent> <leader>s :bel :new<CR>
"format file
nnoremap <silent> <leader>f :Autoformat<CR>

" todo findout what does below do
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
  return 'p@=RestoreRegister()\<cr>'
endfunction
vmap <silent> <expr> p <sid>Repl()


" Quick editing
" Edit the .bashrc"
nnoremap <silent> <leader>eb :e ~/.bashrc<CR>
" Edit the .vimrc"
nnoremap <silent> <leader>ev :e ~/.vimrc<CR>
" Edit the .gitconfig"
nnoremap <silent> <leader>eg :e ~/.gitconfig<CR>
" Edit the .tmux.conf"
nnoremap <silent> <leader>et :e ~/.tmux.conf<CR>
" Edit slate configuration
"nnoremap <silent> <leader>el :e ~/.slate<cr>
" Open a scratch file
nnoremap <silent> <leader>eh :e ~/scratch.txt<CR>

" Plugins configuration"
" TODO how to set grepprg
" set grepprg=rg\ $*
" fzf
" Allow passing optional flags into the Rg command.
"   Example :Rg myterm -g '*.md'
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

" Nerdtree "
noremap <leader>n :NERDTreeToggle<CR>
noremap <Leader>f :NERDTreeFind<CR>
let NERDTreeIgnore=['node_modules$[[dir]]', '\.git$[[dir]]']
" automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1
" Automatically delete the buffer of the file you just deleted with nerdtree
let NERDTreeAutoDeleteBuffer = 1
" setting to make nerdtree look prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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
let g:ale_fix_on_save = 0
let g:ale_completion_enabled = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
set omnifunc=ale#completion#OmniFunc
nnoremap <silent> [[ <Plug>(ale_previous_wrap)
nnoremap <silent> ]] <Plug>(ale_next_wrap)
noremap <Leader>lf :ALEFix<CR>


let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%][%code%]'
" turn on quickfix list
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1

" gitgutter settings
let g:gitgutter_max_signs = 500  " default value
" eregex setting, use / to find. :%S// (uppercase S) to replace
" nnoremap / :M/
" nnoremap ,/ /
" Explicit enable eregex, use PCRE style grep
let g:eregex_default_enable = 1
" force case sensitive like perl, you can change it by adding /i modifier
let g:eregex_force_case = 1

" dirdiff
let g:DirDiffExcludes = 'CVS,*.class,*.exe,.*.swp,.git'

" easy alignment

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" End Plugins configuration"}}}

" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------
" from nickjj/dotfiles

augroup vimRefresh
  autocmd!
  " Auto-resize splits when Vim gets resized.
  autocmd VimResized * wincmd =

  " Update a buffer's contents on focus if it changed outside of Vim.
  au FocusGained,BufEnter * :checktime

  " Unset paste on InsertLeave.
  autocmd InsertLeave * silent! set nopaste
augroup END

" Only do this part when Vim was compiled with the +eval feature.
if 1


  " Put these in an autocmd group, so that you can revert them with:
  " ':augroup vimStartup | au! | augroup END'
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
" Revert with: :delcommand DiffOrig.
if !exists(':DiffOrig')
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
" colorscheme molokai

colorscheme gruvbox

" Gui vim setting
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>  set guioptions-=T <Bar>  set guioptions-=m <bar>  else <Bar>  set guioptions+=T <Bar> set guioptions+=m <Bar> endif<CR>

