scriptencoding utf-8
" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
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
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-entire'
" syntax based text-object for function
Plug 'haya14busa/vim-textobj-function-syntax'
Plug 'wellle/targets.vim'
" extended version of gf from kana
Plug 'kana/vim-gf-user'
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

" Handle multi-file find and replace.
Plug 'mhinz/vim-grepper'

" Improved motion in Vim , comment out easymotion as never use it
" Plug 'easymotion/vim-easymotion'

" Run a diff on 2 directories.
Plug 'will133/vim-dirdiff'
" Run a diff on 2 blocks of text.
Plug 'AndrewRadev/linediff.vim'

" File explorer
" turn off nerdtree, to try out coc explore
" Plug 'scrooloose/nerdtree'
" Plug 'PhilRunninger/nerdtree-buffer-ops'

Plug 'vifm/vifm.vim'

" Syntax highlighting language pack for vim
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" git commit browse
Plug 'junegunn/gv.vim'
" git branch
Plug 'sodapopcan/vim-twiggy'
" Plug 'jreybert/vimagit'
Plug 'shumphrey/fugitive-gitlab.vim'

" ====  IDE feature
" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" change buffer name both in vim and filesystem
Plug 'danro/rename.vim'

" auto generate tags file
Plug 'ludovicchabant/vim-gutentags'
" tagbar like view
Plug 'liuchengxu/vista.vim'

" Edit the quickfix/location list freely
" Plug 'itchyny/vim-qfedit'
" Plug 'jceb/vim-editqf'
Plug 'romainl/vim-qf'
Plug 'bfrg/vim-qf-preview'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

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

" doc hub
Plug 'rizzatti/dash.vim'
" experience
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'honza/vim-snippets'
" search
" tbd
" Plug 'neovim/nvim-lspconfig'
" Initialize plugin system
call plug#end()

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

" Remap leader key to ,
let g:mapleader=','

" enable line numbers and relative line number
set nu rnu

" show last command
set showcmd

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" === TAB/Space settings === "
" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" do not wrap long lines by default
" set nowrap

" highlight current cursor line
set cursorline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" two line for command line
set cmdheight=2

" === Completion Settings === "
" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
" from coc, Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Timeout of user inactivity. Used to save swap file, and by vim-gitgutter plugin
" You will have bad experience for cmc diagnostic messages when it's default 4000.
set updatetime=300

" always show signcolumns
set signcolumn=yes


" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "
" let g:loaded_python_provider = 0
" let g:loaded_python3_provider = 1
let g:python3_host_prog = '$HOME/.pyenv/shims/python'
let g:python_host_prog = '$HOME/.pyenv/shims/python2'

" === fugitive.nvim === "
let g:fugitive_gitlab_domains = ['https://gitlab.cochlear.dev']

" === Coc.nvim === "
let g:coc_global_extensions = ['coc-snippets', 'coc-markdownlint', 'coc-sh', 'coc-vimlsp', 'coc-rust-analyzer', 'coc-highlight', 'coc-yank', 'coc-eslint', 'coc-yaml', 'coc-prettier', 'coc-tsserver', 'coc-json', 'coc-git', 'coc-dictionary', 'coc-word', 'coc-tag', 'coc-swagger', 'coc-calc', 'coc-explorer']

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Use K to show documentation in preview window
nmap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" use <cr> to confirm completion, `<c-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" use <tab> for trigger completion with characters ahead and navigate
" NOPlug 'honza/vim-snippets'TE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming 
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mycocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>f  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status` TODO believe airline is auto done
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nmap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nmap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nmap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nmap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nmap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nmap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nmap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nmap <silent> <space>p  :<C-u>CocListResume<CR>


"coc snippets setting:
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" replace shortcut using coc explore
nmap <leader>n :CocCommand explorer<CR>


" === Vim airline ==== "
" Enable extensions
let g:airline_extensions = ['tabline', 'branch', 'hunks', 'coc', 'quickfix', 'unicode', 'vista', 'grepper']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1
" Define custom airline symbols
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif

"  show git changes to current file in airline
let g:airline#extensions#hunks#enabled=1


" .............................................................................
" fzf setting
" .............................................................................
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit',
\ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

" Empty value to disable preview window altogether
" let g:fzf_preview_window = ''
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" .............................................................................
" mhinz/vim-grepper
" .............................................................................

let g:grepper={}
let g:grepper.tools=['rg', 'git']

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

nnoremap <leader>g :Grepper<cr>
let g:grepper.prompt_mapping_tool = '<leader>g'

" After searching for text, press this mapping to do a project wide find and
" replace. It's similar to <leader>r except this one applies to all matches
" across all files instead of just the current file.
nnoremap <Leader>R
\ :let @s='\<'.expand('<cword>').'\>'<CR>
\ :Grepper -cword -noprompt<CR>
\ :cfdo %s/<C-r>s//g \| update
\<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" The same as above except it works with a visual selection.
xmap <Leader>R
  \ "sy
  \ gvgs
  \ :cfdo %s/<C-r>s//g \| update
   \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" === vim-jsdoc shortcuts ==="

" Generate jsdoc for function under cursor
nnoremap <leader>z :JsDoc<CR>

" ctag gutentags config
" set tmp folder for ctags used
" g:gutentags_cache_dir = '$HOME/.config/nvim/.tmp'

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
set termguicolors

" Editor theme
set background=dark
try
colorscheme OceanicNext
catch
colorscheme slate
endtry

" Vim airline theme
"let g:airline_theme='space'

" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details
function! MyHighlights() abort
" Hightlight trailing whitespace
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)
endfunction

augroup MyColors
autocmd!
autocmd ColorScheme * call MyHighlights()
augroup END

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set floating window to be slightly transparent
set winbl=10

" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b

" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

" Customize NERDTree directory
" hi! NERDTreeCWD guifg=#99c794

" Make background color transparent for git changes
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE

" Highlight git change signs
hi! SignifySignAdd guifg=#99c794
hi! SignifySignDelete guifg=#ec5f67
hi! SignifySignChange guifg=#c594c5

" Call method on window enter
augroup WindowManagement
autocmd!
autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
if &previewwindow
  setlocal winhighlight=Normal:MarkdownError
endif
endfunction

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
nnoremap ; :
nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprevious<cr>
nnoremap <leader>x :bd<cr>

" quick map for escape and save
nnoremap <leader>w :w<CR>
inoremap kk <ESC>`^
cnoremap <silent> kk <C-c>
inoremap jj <ESC>`^:update<CR>
inoremap jh <ESC>:wq<CR>

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" move up/down virtual selected lines
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" create window size by 1.5 ; decreate window size by 0.67
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" use arrow key to resize window
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Maximize only this window"
nnoremap <silent> <leader>m :only<CR>
"vertical split"
nnoremap <silent> <leader>v :bel :vne<CR>
"horizontal split"
nnoremap <silent> <leader>s :bel :new<CR>
"format file
nnoremap <silent> <leader>f :Autoformat<CR>

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l

"   <Space> - PageDown
"   -       - PageUp
" noremap <Space> <PageDown>
" TODO below seems not working
"noremap - <PageUp>

" Quick editing

" Edit the .bashrc"
nnoremap <leader>eb :e ~/.bashrc<CR>
" Edit the .vimrc"
nnoremap  <leader>ev :e ~/.config/nvim/init.vim<CR>
" Edit the .gitconfig"
nnoremap  <leader>eg :e ~/.gitconfig<CR>
" Edit the .tmux.conf"
nnoremap  <leader>et :e ~/.tmux.conf<CR>
" Edit slate configuration
"nmap <silent> <leader>el :e ~/.slate<cr>
" Open a scratch file
nnoremap  <leader>eh :e ~/scratch.txt<CR>
"reload the .vimrc
nnoremap <leader>rv :so ~/.config/nvim/init.vim<CR>
"show spaces"
set listchars=tab:\|\ ,trail:·,eol:¬
" Insert mode mapping
" delete text you have typed in insert mode, recoverable by u
" inoremap <c-u> <c-g>u<c-u>
" delete word before cursor, recoverable by u
" inoremap <c-w> <c-g>u<c-w>

" === Search shorcuts === "
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

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" To search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Automaticaly close nvim if NERDTree is only thing left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

set nobackup nowritebackup noswapfile noundofile
" set backupcopy=yes
" set backupext=.vbak
" set backupdir=~/tmp/.vim/.backup 

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" TODO read https://vi.stackexchange.com/questions/2003/how-do-i-debug-my-vimrc-file
" silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
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

