vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
vim.g.fzf_buffers_jump = 1

vim.cmd [[

let g:fzf_preview_window = ['right:50%', 'alt-\']

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

  ]]

local status, telescope = pcall(require, "telescope")
if not status then
  return
end
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

local function telescope_buffer_dir()
  return vim.fn.expand "%:p:h"
end

local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd "normal vbd"
          end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd "startinsert"
          end,
        },
      },
      preview = {
        filesize_hook = function(filepath, bufnr, opts)
          local max_bytes = 10000
          local cmd = { "head", "-c", max_bytes, filepath }
          require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
        end,
      },
      hidden = true,
    },
  },
  preview = {
    filesize_hook = function(filepath, bufnr, opts)
      local max_bytes = 10000
      local cmd = { "head", "-c", max_bytes, filepath }
      require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
    end,
  },
}

telescope.load_extension "file_browser"
telescope.load_extension "env"
telescope.load_extension "neoclip"
telescope.load_extension "bookmarks"
telescope.load_extension "dap"
telescope.load_extension "fzf"

vim.keymap.set("n", ";f", function()
  builtin.find_files {
    no_ignore = false,
    hidden = true,
  }
end)
vim.keymap.set("n", ";g", function()
  builtin.git_files {}
end)
vim.keymap.set("n", ";r", function()
  builtin.live_grep()
end)
vim.keymap.set("n", "\\\\", function()
  builtin.resume()
end)
vim.keymap.set("n", ";t", function()
  builtin.help_tags()
end)
vim.keymap.set("n", ";;", function()
  builtin.buffers()
end)
vim.keymap.set("n", ";e", function()
  builtin.diagnostics()
end)
vim.keymap.set("n", ";k", function()
  builtin.keymaps()
end)
vim.keymap.set("n", ";w", function()
  builtin.grep_string()
end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser {
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 },
  }
end)
