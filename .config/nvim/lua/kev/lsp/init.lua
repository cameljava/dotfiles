local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "kev.lsp.configs"
require("kev.lsp.handlers").setup()
require "kev.lsp.null-ls"
