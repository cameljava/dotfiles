vim.cmd [[
try
  colorscheme nordfox
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

require("nightfox").setup {
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    },
  },
}
