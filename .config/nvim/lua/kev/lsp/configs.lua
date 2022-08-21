local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, lsp_installer = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local lspconfig = require "lspconfig"

local servers = {
  "bashls",
  "dockerls",
  "graphql",
  "html",
  "jsonls",
  "pylsp",
  "prismals",
  "sqlls",
  "sumneko_lua",
  "taplo",
  "tsserver",
  "vimls",
  "yamlls",
}

mason.setup()

lsp_installer.setup {
  ensure_installed = servers,
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("kev.lsp.handlers").on_attach,
    capabilities = require("kev.lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "kev.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end

vim.lsp.set_log_level "error"
