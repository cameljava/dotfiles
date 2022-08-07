--  ==================  glow  ===================
local status_ok, glow = pcall(require, "glow")
if not status_ok then
  return
end

glow.setup {}

--  ==================  nvim-runscript  ===================
require("nvim-runscript").setup {}

--  ==================  colorizer  ===================
require("colorizer").setup {
  "css",
  "javascript",
  "vim",
  html = {
    mode = "foreground",
  },
}

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
