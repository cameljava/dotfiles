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

Plug 'vim-autoformat/vim-autoformat'
Plug 'dense-analysis/ale'

" Run a diff on 2 directories.
Plug 'will133/vim-dirdiff'
" Run a diff on 2 blocks of text.
Plug 'AndrewRadev/linediff.vim'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-buffer-ops'

" Plug 'vifm/vifm.vim'

" Syntax highlighting language pack for vim
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'

" === Git Plugins === "
" Enable git changes to be shown in sign column
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" git commit browse
Plug 'junegunn/gv.vim'
" git branch
Plug 'sodapopcan/vim-twiggy'
Plug 'shumphrey/fugitive-gitlab.vim'

" ====  IDE feature
Plug 'voldikss/vim-floaterm'

" change buffer name both in vim and filesystem
" Plug 'danro/rename.vim'

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
" Plug 'rizzatti/dash.vim'
" experience
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'honza/vim-snippets'

"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'

" using neovim native lsp and autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'

call plug#end()

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

let verbose=1

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
" set shortmess+=c
" au BufWrite * :Autoformat

" Timeout of user inactivity. Used to save swap file, and by vim-gitgutter plugin
" You will have bad experience for cmc diagnostic messages when it's default 4000.
set updatetime=100

" always show signcolumns
set signcolumn=yes:2

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

nnoremap <silent> <BS> :nohlsearch<CR>
"format file
" nnoremap <silent> <leader>f :Autoformat<CR>

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

"ALE settings:
let g:ale_disable_lsp = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = { 'javascript': ['eslint'] }

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'],    'javascript': ['eslint','prettier'] }


lua <<EOF

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% treesitter setting %%%%%%%%%%%%%%%%%%

require('nvim-treesitter.configs').setup {
ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
-- k turn off this comment not sure
-- ignore_install = { "javascript" }, -- List of parsers to ignore installing
highlight ={
  enable = true,
  disable = { },
  custom_captures = {
    -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
    ["foo.bar"] = "Identifier",
    },
  -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  -- Using this option may slow down your editor, and you may see some duplicate highlights.
  -- Instead of true it can also be a list of languages
  additional_vim_regex_highlighting = false,
  },
incremental_selection = {
enable = true,
keymaps = {
  init_selection = "gnn",
  node_incremental = "gnr",
  scope_incremental = "gnc",
  node_decremental = "gnd",
  },
},
textobjects = {
  move = {
  enable = true,
  set_jumps = true, -- whether to set jumps in the jumplist
  goto_next_start = {
    ["]m"] = "@function.outer",
    ["]]"] = "@class.outer",
    },
  goto_next_end = {
    ["]M"] = "@function.outer",
    ["]["] = "@class.outer",
    },
  goto_previous_start = {
    ["[m"] = "@function.outer",
    ["[["] = "@class.outer",
    },
  goto_previous_end = {
    ["[M"] = "@function.outer",
    ["[]"] = "@class.outer",
    },
  },
},
}

-- %%%%%%%%%%%%%%%%%%% Telescope setting %%%%%%%%%%%%%%%%%%%%%%%

require('telescope').setup{
defaults = {
  vimgrep_arguments = {
    'rg',
    '--color=never',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case'
    },
  prompt_prefix = "> ",
  selection_caret = "> ",
entry_prefix = "  ",
initial_mode = "insert",
selection_strategy = "reset",
sorting_strategy = "descending",
layout_strategy = "horizontal",
layout_config = {
  horizontal = {
    mirror = false,
    },
  vertical = {
    mirror = false,
    },
  },
file_sorter =  require'telescope.sorters'.get_fuzzy_file,
file_ignore_patterns = {},
generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
winblend = 0,
border = {},
borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
color_devicons = true,
use_less = true,
path_display = {},
set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

-- Developer configurations: Not meant for general override
buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
},
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
      }
    }
  }

-- This will load fzy_native and have it override the default file sorter
require('telescope').load_extension('fzf')

-- %%%%%%%%%%%%%%%%%%% LSP setting %%%%%%%%%%%%%%%%%%%%%%%
-- my correct setting to turn on js and viml lsp
local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup{}
nvim_lsp.vimls.setup{}
nvim_lsp.bashls.setup{}
nvim_lsp.yamlls.setup{}

vim.lsp.set_log_level("debug")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver", "vimls", "bashls", "yamlls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
      }
    }
end

-- %%%%%%%%%%%%%%%%%%%%%%% compe setting %%%%%%%%%%%%%%%

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
enabled = true;
autocomplete = true;
debug = false;
min_length = 1;
preselect = 'enable';
throttle_time = 80;
source_timeout = 200;
resolve_timeout = 800;
incomplete_delay = 400;
max_abbr_width = 100;
max_kind_width = 100;
max_menu_width = 100;
documentation = {
  border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
  winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
  max_width = 120,
  min_width = 60,
  max_height = math.floor(vim.o.lines * 0.3),
  min_height = 1,
  };

source = {
  path = true;
  buffer = true;
  calc = true;
  nvim_lsp = true;
  nvim_lua = true;
  vsnip = true;
  ultisnips = true;
  luasnip = true;
  };
}

local t = function(str)
return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
local col = vim.fn.col('.') - 1
return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
if vim.fn.pumvisible() == 1 then
  return t "<C-n>"
elseif vim.fn['vsnip#available'](1) == 1 then
  return t "<Plug>(vsnip-expand-or-jump)"
elseif check_back_space() then
  return t "<Tab>"
else
  return vim.fn['compe#complete']()
end
end
_G.s_tab_complete = function()
if vim.fn.pumvisible() == 1 then
  return t "<C-p>"
elseif vim.fn['vsnip#jumpable'](-1) == 1 then
  return t "<Plug>(vsnip-jump-prev)"
else
  -- If <S-Tab> is not working in your terminal, change it to <C-h>
  return t "<S-Tab>"
end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


-- %%%%%%%%%%%%%%%%%%%%%%% saga setting %%%%%%%%%%%%%%%
local saga = require 'lspsaga'
saga.init_lsp_saga()

EOF

" telescope mapping
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" compe mapping
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" saga mapping
" finder window stay forever, bug not fixed yet
" nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>

" jump diagnostic
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

"floating terminal
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>

" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1
let g:python3_host_prog = '$HOME/.pyenv/shims/python'
let g:python_host_prog = '$HOME/.pyenv/shims/python2'

" === fugitive.nvim === "
let g:fugitive_gitlab_domains = ['https://gitlab.cochlear.dev']
nmap <leader>n :NERDTreeToggle<CR>


" === Vim airline ==== "
" Enable extensions
let g:airline_extensions = ['ale', 'tabline', 'branch', 'hunks', 'quickfix', 'unicode', 'vista']

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

" Launch fzf with CTRL+_.
nnoremap <silent> <C-_> :FZF -m<CR>

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
hi! NERDTreeCWD guifg=#99c794

" Make background color transparent for git changes
" hi! SignifySignAdd guibg=NONE
" hi! SignifySignDelete guibg=NONE
" hi! SignifySignChange guibg=NONE

" Highlight git change signs
" hi! SignifySignAdd guifg=#99c794
" hi! SignifySignDelete guifg=#ec5f67
" hi! SignifySignChange guifg=#c594c5

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()

  "Autoformat buffer while write, setting use Autoformat
  au BufWrite * :Autoformat
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

" cursor not moving left when you exit from insert mode
inoremap <Esc> <Esc>`^
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
  " Automaticaly close nvim if NERDTree is only thing left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

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

