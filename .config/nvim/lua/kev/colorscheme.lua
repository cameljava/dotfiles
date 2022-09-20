require("nightfox").setup {
  options = {
    styles = {
      comments = "italic",
      keywords = "italic",
      functions = "italic",
      types = "bold",
    },
  },
}

vim.cmd [[
try
  colorscheme nordfox
  " colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
