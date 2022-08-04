-- Setup nvim-surround
local status_ok, nsurround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

local surr_utils = require "nvim-surround.utils"
local ts_utils = require "nvim-treesitter.ts_utils"
local query = vim.treesitter.query

nsurround.setup {
  delimiters = {
    invalid_key_behavior = function(char)
      return { char, char }
    end,
    pairs = {
      ["<"] = false,
    },
    HTML = {
      ["<"] = "type",
    },
  },
}

nsurround.buffer_setup {
  delimiters = {
    pairs = {
      ["l"] = function()
        return {
          "[",
          "](" .. vim.fn.getreg "*" .. ")",
        }
      end,
    },
    ["f"] = function()
      local cur = ts_utils.get_node_at_cursor(0, true)
      while cur and cur:type() ~= "fenced_code_block" do
        cur = cur:parent()
      end

      local language = nil
      if cur then
        for child_node in cur:iter_children() do
          if child_node:type() == "info_string" then
            language = query.get_node_text(child_node:child(0), 0)
          end
        end
      end

      if language == "cpp" then
        local input = surr_utils.get_input "Enter a function name: "
        if input then
          return {
            "auto " .. input .. " = [](",
            {
              "){",
              "    return 0;",
              "}",
            },
          }
        end
      elseif language == "lua" then
        local input = surr_utils.get_input "Enter a function name: "
        if input then
          return {
            "local " .. input .. " = function(",
            {
              ")",
              "    return nil",
              "end",
            },
          }
        end
      elseif language == "python" then
        local input = surr_utils.get_input "Enter a function name: "
        if input then
          return {
            input .. " = lambda ",
            {
              ":",
              "    return NULL",
            },
          }
        end
      end
      return { "", "" }
    end,
  },
}
