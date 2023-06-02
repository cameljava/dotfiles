local status, lspkind = pcall(require, "lspkind")
if not status then
  return
end

lspkind.init {
  -- enables text annotations
  --
  -- default: true
  mode = "symbol_text",

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  preset = "default",
  -- preset = 'codicons',
}
