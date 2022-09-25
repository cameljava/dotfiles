--  ==================  glow  ===================
local status_ok, glow = pcall(require, "glow")
if not status_ok then
  return
end

glow.setup {}

--  ==================  nvim-runscript  ===================
require("nvim-runscript").setup()

--  ==================  colorizer  ===================
require("colorizer").setup {
  "css",
  "javascript",
  "vim",
  html = {
    mode = "foreground",
  },
}

--  ================== toggle_lsp_diagnostics  ===================
require("toggle_lsp_diagnostics").init { start_on = false }

--  ==================  vimviki  ===================

vim.cmd [[

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let g:vimwiki_global_ext = 0

let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

]]

--  ==================  windows  ===================
vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require("windows").setup {
  autowidth = {
    enable = false,
    winwidth = 5,
    filetype = {
      help = 2,
    },
  },
  ignore = {
    buftype = { "quickfix" },
    filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
  },
  animation = {
    enable = false,
    duration = 300,
    fps = 30,
    easing = "in_out_sine",
  },
}
