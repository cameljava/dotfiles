local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "diff",
    "dockerfile",
    "gitignore",
    "html",
    "http",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "regex",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  matchup = {
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
      disable = { "c", "cpp", "elm", "julia", "svelte", "vue", "ruby" }, -- optional, list of language that will be disabled
    },
  },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
