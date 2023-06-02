local dap = require "dap"
local dapui = require "dapui"

local opts = { noremap = true, silent = false }

-- You NEED to override nvim-dap's default highlight groups, AFTER requiring nvim-dap
-- start config copied from catppuccin
local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

-- end config copied from catppuccin

-- A typical debug flow consists of:

-- Setting breakpoints via :lua require'dap'.toggle_breakpoint().
-- Launching debug sessions and resuming execution via :lua require'dap'.continue().
-- Stepping through code via :lua require'dap'.step_over() and :lua require'dap'.step_into().
-- Inspecting the state via the built-in REPL: :lua require'dap'.repl.open() or using the widget UI (:help dap-widgets)

require("dap-vscode-js").setup {
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = os.getenv "HOME" .. "/.local/share/nvim/mason/packages/js-debug-adapter", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  -- adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  adapters = { "pwa-node", "node-terminal" }, -- which adapters to register in nvim-dap
  -- log_file_path = os.getenv "HOME" .. "/.cache/nvim/dap_vscode_js.log", -- Path for file logging
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log",
  -- log_file_level = 1, -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
}

for _, language in ipairs { "typescript", "javascript" } do
  -- for _, language in ipairs { "typescript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      trace = true, -- include debugger info
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      outFiles = { "${workspaceFolder}/dist/**/*.js", "!**/node_modules/**" },
      skipFiles = { "**/node_modules/**" },
    },
  }
end

require("nvim-dap-virtual-text").setup {}

dapui.setup()

-- dap ui usage
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require("dap.ext.vscode").load_launchjs()

vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<CR>", opts)
vim.keymap.set("n", "<F6>", "<cmd>lua require('dap').step_over()<CR>", opts)
vim.keymap.set("n", "<F7>", "<cmd>lua require('dap').step_into()<CR>", opts)
vim.keymap.set("n", "<F8>", "<cmd>lua require('dap').step_out()<CR>", opts)

vim.keymap.set("n", "<F2>", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)

vim.keymap.set("n", "<leader>dd", "<cmd>lua require('dap').continue()<CR>", opts)
vim.keymap.set("n", "<leader>df", "<cmd>lua require('dap').step_over()<CR>", opts)
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", opts)
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>", opts)

vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
vim.keymap.set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", opts)

vim.keymap.set("n", "<leader>B", "<cmd>lua require('dap').set_breakpoint('Breakpoints condition: ')<CR>", opts)
vim.keymap.set(
  "n",
  "<leader>lp",
  "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  opts
)

vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", opts)
-- turn off this, as it conflict with resize pane
-- vim.keymap.set("n", "<M-k>", "<cmd>lua require('dapui').eval()<CR>", opts)
