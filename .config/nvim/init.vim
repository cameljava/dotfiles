set encoding=utf-8
scriptencoding utf-8

let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" Enable true color support
if (has('termguicolors'))
 set termguicolors
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
Plug 'chrisbra/unicode.vim'
Plug 'ryanoasis/vim-devicons'
" Tim pope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-unimpaired'
Plug 'numToStr/Comment.nvim'

" color picker
Plug 'KabbAmine/vCoolor.vim'
" show color
" Plug 'chrisbra/Colorizer'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'szw/vim-maximizer'

Plug 'pangloss/vim-javascript'

" code scratch
Plug 'metakirby5/codi.vim'
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
Plug 'thinca/vim-textobj-function-javascript'
" extended version of gf from kana
Plug 'kana/vim-gf-user'
" search
" use standard regex instead of vim format
Plug 'othree/eregex.vim'

" Automatically clear search highlights after you move your cursor.
" Plug 'haya14busa/is.vim'
" asterisk.vim provides improved * motions
" Plug 'haya14busa/vim-asterisk'
" show search status
" Plug 'osyo-manga/vim-anzu'
" highlight yank
Plug 'machakann/vim-highlightedyank'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Plug 'sbdchd/neoformat'

Plug 'dense-analysis/ale'

" Run a diff on 2 directories.
" Plug 'will133/vim-dirdiff'
" Run a diff on 2 blocks of text.
" Plug 'AndrewRadev/linediff.vim'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-buffer-ops'

" Plug 'vifm/vifm.vim'

" Syntax highlighting language pack for vim
" Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'jparise/vim-graphql'

" === Git Plugins === "
" Enable git changes to be shown in sign column
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
" Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" git commit browse
Plug 'junegunn/gv.vim'
" git branch
Plug 'sodapopcan/vim-twiggy'
Plug 'shumphrey/fugitive-gitlab.vim'

" experience neogit see if it can replace fugitive
" Plug 'TimUntersberger/neogit'

" Single tabpage interface for easily cycling through diffs for all modified
" files for any git rev.
" Plug 'sindrets/diffview.nvim'

" ====  IDE feature
Plug 'voldikss/vim-floaterm'

Plug 'kassio/neoterm'

Plug 'vim-test/vim-test'

" change buffer name both in vim and filesystem
" Plug 'danro/rename.vim'

" auto generate tags file
" Plug 'ludovicchabant/vim-gutentags'
" tagbar like view
Plug 'liuchengxu/vista.vim'

" Edit the quickfix/location list freely
" Plug 'itchyny/vim-qfedit'
" Plug 'jceb/vim-editqf'
Plug 'romainl/vim-qf'
Plug 'bfrg/vim-qf-preview'

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

" Plug 'Yggdroot/indentLine'

Plug 'rafi/awesome-vim-colorschemes'

" Dim paragraphs above and below the active paragraph.
Plug 'junegunn/limelight.vim'
" Distraction free writing by removing UI elements and centering everything.
Plug 'junegunn/goyo.vim'
" evaluate goyo alternative
Plug 'Pocco81/TrueZen.nvim'

" doc hub
" Plug 'rizzatti/dash.vim'
" experience

" markdown preview in browser, preinstall brew install markdown
" command, :MarkdownPreview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" markdown preview in terminal, terminal rander preinstall glow
" :PreviewMarkdown
" 'MichaelMure/mdr', install binary
Plug 'skanehira/preview-markdown.vim'


Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Plug 'honza/vim-snippets'
Plug 'rafamadriz/friendly-snippets'
"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'BurntSushi/ripgrep'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'

" using neovim native lsp and autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Plug 'hrsh7th/nvim-compe'
" TODO try new cmp as recommend
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For vsnip user.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
" Plug 'onsails/lspkind-nvim'
" Plug 'onsails/vimway-lsp-diag.nvim'
" Plug 'p00f/nvim-ts-rainbow'
"
Plug 'tyru/open-browser.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

call plug#end()

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

syntax on

" Editor theme
set background=dark

let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" let g:airline_theme='oceanicnext'
let g:airline_theme='nord'

try
  " colorscheme gruvbox
  " colorscheme OceanicNextLight
  " colorscheme OceanicNext
  colorscheme nord
catch
  colorscheme gruvbox
endtry


let verbose=1

" required in nvim-cmp config file.
set completeopt=menu,menuone,noselect

" Remap leader key to ,
let g:mapleader=','

" enable line numbers and relative line number
set number relativenumber

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

" Timeout of user inactivity. Used to save swap file, and by vim-gitgutter plugin
" You will have bad experience for cmc diagnostic messages when it's default 4000.
set updatetime=100

" always show signcolumns
set signcolumn=yes:2
" set signcolumn=yes

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" if has('mouse')
  set mouse=a
" endif

set scrolloff=50


" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" ------------------------------ graphql settings --------------------------------

" ------------------------------ vsnip settings --------------------------------
let g:vsnip_snippet_dir = expand('~/.config/nvim/ksettings/vsnip')

" ------------------------------ JsDoc settings --------------------------------
"  TODO make this path unaffected while update lehre version
let g:jsdoc_lehre_path = '/Users/kevlee/.nvm/versions/node/v14.19.3/bin/lehre'
" vim-javascript
let g:javascript_plugin_jsdoc = 1

" ------------------------------ ALE settings --------------------------------
let g:ale_fix_on_save = 1

let g:ale_disable_lsp = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" In ~/.vim/vimrc, or somewhere similar.
" let g:ale_linters = {'markdown':'markdownlint', 'javascript': ['eslint'] , 'json': ['jq', 'jsonlint'], 'yaml': ['spectral','yamllint', 'swaglint'], 'vim': ['vint'], 'sh': ['shellcheck']}
let g:ale_linters = {'markdown':'remark-lint', 'javascript': ['eslint'] , 'json': ['jq', 'jsonlint'], 'yaml': ['spectral','yamllint', 'swaglint'], 'vim': ['vint'], 'sh': ['shellcheck']}

" In ~/.vim/vimrc, or somewhere similar.
" let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'],'javascript': ['eslint','prettier'] ,'json':['jq','prettier', 'trim_whitespace'], 'yaml':['trim_whitespace','prettier', 'yamlfix'], 'html':['prettier'], 'css':['prettier'], 'sh':['shfmt'] }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'],'javascript': ['eslint'] ,'json':['prettier'], 'yaml':['trim_whitespace','prettier', 'yamlfix'], 'html':['prettier'], 'css':['prettier'], 'sh':['shfmt'], 'markdown':['remark-lint'] }

nmap <silent> <space>k <Plug>(ale_previous_wrap)
nmap <silent> <space>j <Plug>(ale_next_wrap)

" signify settings;

let g:signify_sign_change  = '~'

" vim test setting
let g:test#javascript#runner = 'mocha'
let test#strategy = 'neoterm'
" let g:neoterm_default_mod='vertical'
let g:neoterm_callbacks = {}
    function! g:neoterm_callbacks.before_new()
      if winwidth('.') > 100
        let g:neoterm_default_mod = 'botright vertical'
      else
        let g:neoterm_default_mod = 'botright'
      end
    endfunction
" Kevin test to show lsp error with different color
" highlight LspDiagnosticsDefaultError guifg=#FF0000 ctermfg=#FF0000
" hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
" sign define LspDiagnosticsErrorSign text=E texthl=LspDiagnosticsError linehl=Red numhl=Red

lua <<EOF

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ls color plugin setting TODO default seems not working %%%%%%%%%%%%%%%%%%

require('Comment').setup {
    ---Add a space b/w comment and the line
    ---@type boolean
    padding = true,

    ---Whether the cursor should stay at its position
    ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
    ---@type boolean
    sticky = true,

    ---Lines to be ignored while comment/uncomment.
    ---Could be a regex string or a function that returns a regex string.
    ---Example: Use '^$' to ignore empty lines
    ---@type string|fun():string
    ignore = nil,

    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },

    ---LHS of extra mappings
    ---@type table
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },

    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---@type table
    mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,
        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = false,
    },

    ---Pre-hook, called before commenting the line
    ---@type fun(ctx: Ctx):string
    pre_hook = nil,

    ---Post-hook, called after commenting is done
    ---@type fun(ctx: Ctx)
    post_hook = nil,
}
-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% treesitter setting %%%%%%%%%%%%%%%%%%

require('nvim-treesitter.configs').setup {
ensure_installed ={ "javascript", "java", "html", "json", "yaml","rust","vim","graphql","css", "dockerfile", "typescript", "python","bash","fish", "json5", "lua", "jsdoc", "regex"},
highlight = {
  enable = true,
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

-- %%%%%%%%%%%%%%%%%%%%%%% cmp setting %%%%%%%%%%%%%%%

local cmp = require'cmp'

cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'vsnip' },
      { name = 'buffer', keyword_length=4 },
    },
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
     --   vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

        -- set a name for each source
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          vsnip = "[VSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        })[entry.source.name]
        return vim_item
      end
    }
})

 -- Use buffer source for `/`.
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':'.
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- %%%%%%%%%%%%%%%%%%%  lsp language server setting %%%%%%%%%%%%%%%%%%%%%%%
require("nvim-lsp-installer").setup {}

-- %%%%%%%%%%%%%%%%%%% LSP setting %%%%%%%%%%%%%%%%%%%%%%%
-- my correct setting to turn on js and viml lsp
local nvim_lsp = require('lspconfig')

nvim_lsp.bashls.setup{}
nvim_lsp.eslint.setup{}
nvim_lsp.graphql.setup{}
nvim_lsp.dockerls.setup{}
nvim_lsp.html.setup{}
nvim_lsp.jsonls.setup{}
nvim_lsp.prismals.setup{}
nvim_lsp.sqlls.setup{}
nvim_lsp.sumneko_lua.setup{}
nvim_lsp.tsserver.setup{}
nvim_lsp.vimls.setup{}
nvim_lsp.yamlls.setup{}

vim.lsp.set_log_level("error")
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
 buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver", "vimls", "bashls", "yamlls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
      },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
end


-- %%%%%%%%%%%%%%%%%%%%%%% gitsign setting %%%%%%%%%%%%%%%

-- require('gitsigns').setup()

-- %%%%%%%%%%%%%%%%%%%%%%% diffview setting %%%%%%%%%%%%%%%
--[[ local cb = require'diffview.config'.diffview_callback

require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  file_panel = {
    width = 35,
    use_icons = true        -- Requires nvim-web-devicons
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]     = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]   = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["<leader>e"] = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"] = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),          -- Stage all entries.
      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      ["X"]             = cb("restore_entry"),      -- Restore entry to the state on the left side.
      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    }
  }
} ]]

-- %%%%%%%%%%%%%%%%%%%%%%% colorizer setting %%%%%%%%%%%%%%%

-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require'colorizer'.setup {
  'css';
  'javascript';
  'vim';
  html = {
    mode = 'foreground';
  }
}

EOF

" vimway lsp dialog

" nmap <space>dw <cmd>lua require('vimway-lsp-diag').open_all_diagnostics()<cr>
" nmap <space>d0 <cmd>lua require('vimway-lsp-diag').open_buffer_diagnostics()<cr>

" telescope mapping
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>ca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>



" let g:loaded_python_provider = 1
" let g:loaded_python3_provider = 1
let g:python3_host_prog = '$HOME/.pyenv/shims/python3'
let g:python_host_prog = '$HOME/.pyenv/shims/python2'

" === fugitive.nvim === "
let g:fugitive_gitlab_domains = ['https://gitlab.cochlear.dev']
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


" === Vim airline ==== "
" disable_rtp_load
let g:airline#extensions#disable_rtp_load = 1
" Enable extensions
let g:airline_extensions = ['nvimlsp','fzf','ale', 'tabline', 'branch', 'hunks', 'quickfix', 'unicode', 'vista', 'fugitiveline', 'wordcount', 'searchcount']

" Update section z to just have line number
" let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Custom setup that removes filetype/whitespace from default vim airline bar
" let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z', 'warning', 'error']]

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
" let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1
" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"  show git changes to current file in airline
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#searchcount#enabled = 1

" set statusline+=%{get(b:,'gitsigns_status','')}

" .............................................................................
" fzf setting
" .............................................................................
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+p.
nnoremap <silent> <C-p> :FZF -m ~/.config<CR>

"  Rg all in workdir.
" command! -bang -nargs=* Rg call fzf#vim#grep(  'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
" ripgrep

if executable('rg')

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
set grepprg=rg\ --vimgrep

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --no-ignore --follow ".(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --ignore-case --no-ignore --hidden --follow -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Rg
nnoremap <silent> <Leader>fa :Find<CR>
" Rg
nnoremap <silent> <Leader>fv :RG<CR>
" Rg current worda
nnoremap <Leader>fw :Rg <C-R><C-W><space>

endif

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
" let g:gutentags_cache_dir = '$HOME/.config/nvim/.tmp'

" --------------------- vim test -----------------
nnoremap <C-t> :TestFile<cr>

" --------------------- vim open-browser setting -----------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" -------------------- markdown and preview setting -------------------
"
let g:preview_markdown_parser = 'glow'

" --------------------- vim neoterm setting -----------------
" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
" let g:neoterm_size = 100
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
" free default ,tt mapping
let g:neoterm_automap_keys = '<>xxxxxx'
nnoremap <c-y> :Ttoggle<CR>
inoremap <c-y> <Esc>:Ttoggle<CR>
tnoremap <c-y> <c-\><c-n>:Ttoggle<CR>
nnoremap <leader>x :TREPLSendLine<CR>
vnoremap <leader>x :TREPLSendSelection<CR>
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif

" --------------------- vim neoterm setting -----------------
"  default opening ranger mapping is <leader>f, below disable default key
"  mapping
let g:ranger_map_keys = 0

" ============================================================================ "
" ===                UI                                    === "
" ============================================================================ "



" let g:colorizer_auto_filetype='css,html'

" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details
" function! MyHighlights() abort
  " Hightlight trailing whitespace
  " highlight Trail ctermbg=red guibg=red
  " call matchadd('Trail', '\s\+$', 100)
" endfunction

" augroup MyColors
  " autocmd!
  " autocmd ColorScheme * call MyHighlights()
" augroup END

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow
set splitright

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set floating window to be slightly transparent
set winbl=10


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
" hi! SignifySignChange guifg=yellow

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
nnoremap : ;

vnoremap ; :
vnoremap : ;

nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <s-tab> :bprevious<cr>
" nnoremap <leader>x :bd<cr>

nnoremap <silent> <BS> :nohlsearch<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <c-v> "_d"0P

" leader p to paste last copied
nnoremap <leader>p "0p

" Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

" cursor not moving left when you exit from insert mode
inoremap <Esc> <Esc>`^
" quick map for escape and save
" update leader w to update. only wirte if buffer changed
nnoremap <leader>w :update<CR>
inoremap kk <ESC>`^
cnoremap <silent> kk <C-c>
inoremap jj <ESC>`^:update<CR>
inoremap jh <ESC>:xa<CR>

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
nnoremap Y y$

" this only work for j,k , maybe try scrolloff
" nnoremap k kzz
" nnoremap j jzz

" move up/down virtual selected lines
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" use arrow key to resize window
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" Maximize only this window"
nnoremap <silent><leader>m :MaximizerToggle<CR>
vnoremap <silent><leader>m :MaximizerToggle<CR>gv
" inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

"vertical split"
nnoremap <silent> <leader>v :vs<CR>
"horizontal split"
nnoremap <silent> <leader>s :sp<CR>

" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv

" use same <leader> hjkl navigate within vim modes
tnoremap <leader>h <C-\><C-N><C-w>h
tnoremap <leader>j <C-\><C-N><C-w>j
tnoremap <leader>k <C-\><C-N><C-w>k
tnoremap <leader>l <C-\><C-N><C-w>l
inoremap <leader>h <C-\><C-N><C-w>h
inoremap <leader>j <C-\><C-N><C-w>j
inoremap <leader>k <C-\><C-N><C-w>k
inoremap <leader>l <C-\><C-N><C-w>l
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

" To search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" keymap for JsDoc
nnoremap <silent> <C-l> <Plug>(jsdoc)
" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

augroup graphqlHighlight
  au BufNewFile,BufRead *.prisma setfiletype graphql
augroup END

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
" if exists('g:loaded_webdevicons')
  " call webdevicons#refresh()
" endif
" TODO read https://vi.stackexchange.com/questions/2003/how-do-i-debug-my-vimrc-file
" silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
augroup vimRefresh
  autocmd!
  " Auto-resize splits when Vim gets resized.
  autocmd VimResized * wincmd =

  " Update a buffer's contents on focus if it changed outside of Vim.
  au FocusGained,BufEnter * silent! :checktime

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

" make terminal cursor visible
hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE
