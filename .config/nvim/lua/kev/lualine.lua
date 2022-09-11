local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end


local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn", "info", "hint" },
  symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
  colored = true,
  update_in_insert = false,
  always_visible = true,
}

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local filename = {
  "filename",
  file_status = true, -- Displays file status (readonly status, modified status)
  path = 1, -- 0: Just the filename
  -- 1: Relative path
  -- 2: Absolute path

  shorting_target = 40, -- Shortens path to leave 40 spaces in the window
  -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = "[+]", -- Text to show when the file is modified.
    readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
    unnamed = "[No Name]", -- Text to show for unnamed buffers.
  },
}

local location = {
  "location",
  padding = 0,
}

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", diagnostics },
    lualine_c = { filename },
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_x = { spaces, "encoding", filetype },
    lualine_y = { "location" },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    -- lualine_c = { "filename" },
    lualine_c = {},
    -- lualine_x = { "location" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
