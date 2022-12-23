require "impatient"
require "kev.base"
require "kev.highlights"
require "kev.maps"
require "kev.plugins"

local has = vim.fn.has
local is_mac = has "macunix"

if is_mac then
  require "kev.macos"
end
