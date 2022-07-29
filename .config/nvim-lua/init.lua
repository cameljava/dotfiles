local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

local cmd = vim.cmd
local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

g.mapleader = ","

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
	use 'tpope/vim-commentary'
  use 'mhartington/formatter.nvim'
	use 'neovim/nvim-lspconfig'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'theHamsta/nvim-dap-virtual-text'
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'
	use 'David-Kunz/jester'
  use 'kyazdani42/nvim-tree.lua'
  use 'David-Kunz/treesitter-unit'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'David-Kunz/cmp-npm'
  use 'marko-cerovac/material.nvim'
	use 'mfussenegger/nvim-dap'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'voldikss/vim-floaterm'
  -- use 'ldelossa/litee.nvim'
  -- use 'ldelossa/gh.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'folke/tokyonight.nvim'
  use 'ggandor/leap.nvim'
  use 'windwp/nvim-autopairs'
  use 'williamboman/nvim-lsp-installer'
  end
)

  
-- default options
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.laststatus = 3
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
-- cursorline seems not working
cmd('set cursorline')
-- opt.relativenumber = true
cmd('set nonumber')
cmd('set norelativenumber')
-- set diffopt+=vertical " starts diff mode in vertical split
opt.cmdheight = 2
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = 'yes'
opt.updatetime = 100
opt.undofile = true
cmd('filetype plugin on')
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = { 'javascript', 'js=javascript', 'json=javascript' }

-- opt.path:append({ "**" })
cmd([[set path=$PWD/**]])
keymap.set('n', '<leader>v', ':e $MYVIMRC<CR>')



-- lewis6991/gitsigns.nvim
function diffThisBranch()
 local branch = vim.fn.input("Branch: ", "")
 require"gitsigns".diffthis(branch)
end

require('gitsigns').setup({
  current_line_blame = true,
  on_attach = function(bufnr)
       -- Navigation
    keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    keymap.set('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
    keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    keymap.set('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
    keymap.set('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
    keymap.set('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
    keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
    keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
    keymap.set('n', '<leader>hb', function() require"gitsigns".blame_line{full=true} end)
    keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
    keymap.set('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
    keymap.set('n', '<leader>hD', function() require"gitsigns".diffthis("~") end)
    keymap.set('n', '<leader>hm', function() require"gitsigns".diffthis("main")end)
    keymap.set('n', '<leader>hM', diffThisBranch)
    keymap.set('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

    -- Text object
    keymap.set('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    keymap.set('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})

-- sbdchd/neoformat
keymap.set('n', '<leader>F', ':Format<CR>')
require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
        -- prettierd
       function()
          return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
    rust = {
      function()
        return {
          exe = "rustfmt",
          stdin = true
        }
      end
    },
    sql = {
        -- prettierd
       function()
          return {
            exe = "sqlformat",
            args = {vim.api.nvim_buf_get_name(0), '-a'},
            stdin = true
          }
        end
    },
  }
})
local telescope_actions = require("telescope.actions.set")

local fixfolds = {
	hidden = true,
	attach_mappings = function(_)
		telescope_actions.select:enhance({
			post = function()
				cmd(":normal! zx")
			end,
		})
		return true
	end,
}

local actions = require("telescope.actions")


require('telescope').setup {
	pickers = {
		buffers = fixfolds,
		find_files = fixfolds,
		git_files = fixfolds,
		grep_string = fixfolds,
		live_grep = fixfolds,
		oldfiles = fixfolds,
	}
}

-- nvim-telescope/telescope.nvim
_G.telescope_find_files_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").find_files({search_dirs = {_path}})
end
_G.telescope_live_grep_in_path = function(path)
 local _path = path or vim.fn.input("Dir: ", "", "dir")
 require("telescope.builtin").live_grep({search_dirs = {_path}})
end
_G.telescope_files_or_git_files = function()
 local utils = require('telescope.utils')
 local builtin = require('telescope.builtin')
 local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
 if ret == 0 then
   builtin.git_files()
 else
   builtin.find_files()
 end
end
keymap.set('n', '<leader>fD', function() telescope_live_grep_in_path() end)
keymap.set('n', '<leader><space>', function() telescope_files_or_git_files() end)
keymap.set('n', '<leader>fd', function() telescope_find_files_in_path() end)
keymap.set('n', '<leader>ft', function() telescope_find_files_in_path("./tests") end)
keymap.set('n', '<leader>fT', function() telescope_live_grep_in_path("./tests") end)
keymap.set('n', '<leader>ff', ':Telescope live_grep<CR>')
-- keymap.set('n', '<leader>fo', ':Telescope file_browser<CR>')
keymap.set('n', '<leader>fn', ':Telescope find_files<CR>')
keymap.set('n', '<leader>fr', ':Telescope resume<CR>')
keymap.set('n', '<leader>fg', ':Telescope git_branches<CR>')
keymap.set('n', '<leader>fj', ':Telescope buffers<CR>')
keymap.set('n', '<leader>fs', ':Telescope lsp_document_symbols<CR>')
keymap.set('n', '<leader>ff', ':Telescope live_grep<CR>')
keymap.set('n', '<leader>FF', ':Telescope grep_string<CR>')

-- David-Kunz/cmp-npm
require('cmp-npm').setup({ ignore = {"beta", "rc"} })


local nvim_lsp = require'lspconfig'
local servers = { 'tsserver', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }
end

keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
keymap.set('n', 'gh', function() vim.lsp.buf.hover() end)
keymap.set('n', 'gD', function() vim.lsp.buf.implementation() end)
keymap.set('n', '<c-k>', function() vim.lsp.buf.signature_help() end)
keymap.set('n', 'gr', function() vim.lsp.buf.references() end)
keymap.set('n', 'gR', function() vim.lsp.buf.rename() end)
keymap.set('n', 'ga', function() vim.lsp.buf.code_action() end)
keymap.set('n', 'gA', ':Telescope lsp_range_code_actions<CR>')
 
g.material_style = "Dark"

vim.cmd 'colorscheme material'
opt.fillchars = {
  horiz     = '█',
  horizup   = '█',
  horizdown = '█',
  vert      = '█',
  vertleft  = '█',
  vertright = '█',
  verthoriz = '█',
}
-- cmd 'colorscheme tokyonight'
-- vim.cmd 'colorscheme gruvbox'
-- vim.cmd 'colorscheme github_dark'



g.floaterm_width = 0.95
g.floaterm_height = 0.95
keymap.set('n', '<leader>g', ':FloatermNew lazygit<CR>')


cmd('set foldmethod=expr')
cmd('set foldexpr=nvim_treesitter#foldexpr()')

keymap.set('n', '<leader>n', ':tabe ~/tmp/notes.md<CR>')

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.cds = {
      install_info = {
            -- local path or git repo
            url = "~/apps/tree-sitter-cds",
            files = { "src/parser.c", "src/scanner.c" }
      },
      filetype = "cds",
      -- additional filetypes that use this parser
      used_by = { "cdl", "hdbcds" }
    }

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  -- indent = {
  --   enable = true
  -- },
}
-- mfussenegger/nvim-dap
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/apps/node/out/src/nodeDebug.js'},
}

-- require('dap').set_log_level('INFO')
dap.defaults.fallback.terminal_win_cmd = '20split new'
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

keymap.set('n', '<leader>dh', function() require"dap".toggle_breakpoint() end)
keymap.set('n', '<leader>dH', ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
keymap.set('n', '<A-k>', function() require"dap".step_out() end)
keymap.set('n', "<A-l>", function() require"dap".step_into() end)
keymap.set('n', '<A-j>', function() require"dap".step_over() end)
keymap.set('n', '<A-h>', function() require"dap".continue() end)
keymap.set('n', '<leader>dn', function() require"dap".run_to_cursor() end)
keymap.set('n', '<leader>dc', function() require"dap".terminate() end)
keymap.set('n', '<leader>dR', function() require"dap".clear_breakpoints() end)
keymap.set('n', '<leader>de', function() require"dap".set_exception_breakpoints({"all"}) end)
keymap.set('n', '<leader>da', function() require"debugHelper".attach() end)
keymap.set('n', '<leader>dA', function() require"debugHelper".attachToRemote() end)
keymap.set('n', '<leader>di', function() require"dap.ui.widgets".hover() end)
keymap.set('n', '<leader>d?', function() local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes) end)
keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>zz')
keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>zz')
keymap.set('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')

-- nvim-telescope/telescope-dap.nvim
require('telescope').load_extension('dap')
keymap.set('n', '<leader>ds', ':Telescope dap frames<CR>')
-- keymap.set('n', '<leader>dc', ':Telescope dap commands<CR>')
keymap.set('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')

require('nvim-dap-virtual-text').setup()

-- David-Kunz/jester
require'jester'.setup({ path_to_jest = "/usr/local/bin/jest" })
keymap.set('n', '<leader>tt', function() require"jester".run() end)
keymap.set('n', '<leader>t_', function() require"jester".run_last() end)
keymap.set('n', '<leader>tf', function() require"jester".run_file() end)
keymap.set('n', '<leader>d_', function() require"jester".debug_last() end)
keymap.set('n', '<leader>df', function() require"jester".debug_file() end)
keymap.set('n', '<leader>dq', function() require"jester".terminate() end)
keymap.set('n', '<leader>dd', function() require"jester".debug() end)

-- lua language server
 local system_name
 if vim.fn.has("mac") == 1 then
   system_name = "macOS"
 elseif vim.fn.has("unix") == 1 then
   system_name = "Linux"
 elseif vim.fn.has('win32') == 1 then
   system_name = "Windows"
 else
   print("Unsupported system for sumneko")
 end
 
 -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
 local sumneko_root_path = os.getenv('HOME') ..'/apps/lua-language-server'
 local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
 
 local runtime_path = vim.split(package.path, ';')
 table.insert(runtime_path, "lua/?.lua")
 table.insert(runtime_path, "lua/?/init.lua")

 require'lspconfig'.sumneko_lua.setup {
   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
   settings = {
     Lua = {
       runtime = {
         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
         version = 'LuaJIT',
         -- Setup your lua path
         path = runtime_path,
       },
       diagnostics = {
         -- Get the language server to recognize the `vim` global
         globals = {'vim'},
       },
       workspace = {
         -- Make the server aware of Neovim runtime files
         library = vim.api.nvim_get_runtime_file("", true),
       },
       -- Do not send telemetry data containing a randomized but unique identifier
       telemetry = {
         enable = false,
       },
     },
   },
 }

keymap.set('n', '[b', ':bnext<CR>')
keymap.set('n', ']b', ':bprev<CR>')

-- David-Kunz/treesitter-unit
keymap.set('x', 'u', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
keymap.set('o', 'u', ':<c-u>lua require"treesitter-unit".select(true)<CR>')
-- require"treesitter-unit".enable_highlighting()

-- custom folder icon
require'nvim-web-devicons'.setup({
  override = {
    lir_folder_icon = {
      icon = "",
      color = "#7ebae4",
      name = "LirFolderNode"
    },
  }
})
-- use visual mode
function _G.LirSettings()
  vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

  -- echo cwd
  vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end
cmd [[augroup lir-settings]]
cmd [[  autocmd!]]
cmd [[  autocmd Filetype lir :lua LirSettings()]]
cmd [[augroup END]]

-- global mark I for last edit
cmd [[autocmd InsertLeave * execute 'normal! mI']]

-- highlight on yank
cmd([[au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}]])

-- kyazdani42/nvim-tree.lua
require('nvim-tree').setup({
  hijack_cursor = true,
  update_focused_file = { enable = true },
  view = {
    width = 60
  }
})
keymap.set('n', '\\', ':NvimTreeToggle<CR>', {silent=true})

keymap.set('n', 'gq', ':bd!<CR>')
keymap.set('n', '<leader>w', ':w<CR>')

cmd('iabbrev :tup: 👍')
cmd('iabbrev :tdo: 👎')
cmd('iabbrev :smi: 😊')
cmd('iabbrev :sad: 😔')
cmd('iabbrev darkred #8b0000')
cmd('iabbrev darkgreen #006400')

_G.term_buf_of_tab = _G.term_buf_of_tab or {}
_G.term_buf_max_nmb = _G.term_buf_max_nmb or 0

function spawn_terminal()
  local cur_tab = vim.api.nvim_get_current_tabpage()
  cmd('vs | terminal')
  local cur_buf = vim.api.nvim_get_current_buf()
  _G.term_buf_max_nmb = _G.term_buf_max_nmb + 1
  vim.api.nvim_buf_set_name(cur_buf, "Terminal " .. _G.term_buf_max_nmb)
  table.insert(_G.term_buf_of_tab, cur_tab, cur_buf)
  cmd(':startinsert')
end

function toggle_terminal()
  local cur_tab = vim.api.nvim_get_current_tabpage()
  local term_buf = term_buf_of_tab[cur_tab]
  if term_buf ~= nil then
   local cur_buf = vim.api.nvim_get_current_buf()
   if cur_buf == term_buf then
     cmd('q')
   else
     cmd('vert sb' .. term_buf)
     cmd(':startinsert')
   end
  else
    spawn_terminal()
    cmd(':startinsert')
  end
end
keymap.set('n', '<c-y>', toggle_terminal)
keymap.set('i', '<c-y>', '<ESC>:lua toggle_terminal()<CR>')
keymap.set('t', '<c-y>', '<c-\\><c-n>:lua toggle_terminal()<CR>')
-- cmd([[
-- if has('nvim')
--    au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
-- endif]])

_G.send_line_to_terminal = function()
  local curr_line = vim.api.nvim_get_current_line()
  local cur_tab = vim.api.nvim_get_current_tabpage()
  local term_buf = term_buf_of_tab[cur_tab]
  if term_buf == nil then
    spawn_terminal()
    term_buf = term_buf_of_tab[cur_tab]
  end
  for _, chan in pairs(vim.api.nvim_list_chans()) do
    if chan.buffer == term_buf then
      chan_id = chan.id
    end
  end
  vim.api.nvim_chan_send(chan_id, curr_line .. '\n')
end

keymap.set('n', '<leader>x', ':lua send_line_to_terminal()<CR>')

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
  }
}

keymap.set('n', '<c-o>', '<c-o>zz')
keymap.set('n', '<c-i>', '<c-i>zz')

-- 'L3MON4D3/LuaSnip'
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local ls = require("luasnip")
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      ls.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    { name = 'npm' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer', keyword_length = 5 },
  },
  -- formatting = {
  --   format = lspkind.cmp_format({with_text = false, maxwidth = 50})
  -- }
})

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.expand = function ()
  -- print("hurray!!")
  if ls.expand_or_jumpable() then
    return t("<Plug>luasnip-expand-or-jump")
  end
  return ''
end

_G.expand_back = function ()
  -- print("hurray!!")
  if ls.jumpable(-1) then
    return t("<Plug>luasnip-jump-prev")
  end
  return ''
end

vim.api.nvim_set_keymap('i', '<c-j>', 'v:lua.expand()', { expr = true })
vim.api.nvim_set_keymap('i', '<c-k>', 'v:lua.expand_back()', { expr = true })
vim.api.nvim_set_keymap('s', '<c-j>', 'v:lua.expand()', { expr = true })
vim.api.nvim_set_keymap('s', '<c-k>', 'v:lua.expand_back()', { expr = true })

keymap.set('n', '<leader>ls', '<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>')

_G.test_dap = function()
  local dap = require'dap'
  -- dap.terminate(nil, nil, function()
  --   vim.wait(2000, function()
  --     local session = dap.session()
  --     return session and session.initialized
  --   end)
    dap.run({
      args = { "--no-cache" },
      console = "integratedTerminal",
      cwd = "/Users/d065023/projects/DevOnDuty/VimAsIDE",
      disableOptimisticBPs = true,
      port = 9229,
      protocol = "inspector",
      request = "launch",
      runtimeArgs = { "--inspect-brk", "foo.js" },
      -- skipFiles = { "file:///<node_internals>/**/*.js" },
      skipFiles = { "promiseInitHookWithDestroyTracking" },
      sourceMaps = "inline",
      type = "node2"
      })
    -- end)
end


-- ldelossa/gh.nvim
-- require('litee.lib').setup()
-- require('litee.gh').setup({
--   prefer_https_remote = true
-- })


-- nvim-telescope/telescope-ui-select.nvim
require("telescope").load_extension("ui-select")

-- require("github-theme").setup({
--   theme_style = "dark",
-- })

require('leap').set_default_keymaps()
require("nvim-autopairs").setup {}
require('nvim-lsp-installer').setup {}
