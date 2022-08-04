require("nightfox").setup {
  options = {
    styles = {
      comments = "italic",
      keywords = "italic",
      types = "bold",
    },
  },
}

vim.cmd [[
try
  colorscheme nordfox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
