local status_ok, glow = pcall(require, "glow")
if not status_ok then
  return
end

glow.setup {}

require("nvim-runscript").setup {}

require("colorizer").setup {
  "css",
  "javascript",
  "vim",
  html = {
    mode = "foreground",
  },
}
