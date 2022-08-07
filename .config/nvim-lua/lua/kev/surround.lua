-- Setup nvim-surround
local status_ok, nsurround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

nsurround.setup {
}

