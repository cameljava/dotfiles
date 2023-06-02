-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true

-- vim.g.tokyonight_colors = {
--   fg = "#839496",
--   fg_dark = "#586e75",
--   fg_gutter = "#073642",
--   bg_highlight = "#002b36",
--   comment = "#586e75",
--   blue = "#268bd2",

--   cyan = "#2aa198",
--   blue1 = "#2ac3de",
--   blue2 = "#0db9d7",
--   blue5 = "#89ddff",
--   blue6 = "#B4F9F8",

--   yellow = "#b58900",
--   orange = "#cb4b16",
--   magenta = "#d33682",
--   purple = "#6c71c4",
-- }

-- require("nightfox").setup {
--   options = {
--     styles = {
--       comments = "italic",
--       keywords = "italic",
--       functions = "italic",
--       types = "bold",
--     },
--   },
-- }

require("catppuccin").setup {
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  show_end_of_buffer = false, -- show the '~' characters after the end of buffers
  term_colors = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    telescope = true,
    lsp_saga = true,
    mason = true,
    octo = true,
    treesitter = true,
    treesitter_context = true,

    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
  },
}

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme nordfox]]
-- vim.cmd [[colorscheme everforest]]
