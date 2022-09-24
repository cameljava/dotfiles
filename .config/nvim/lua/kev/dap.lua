local dap, dapui, dapvs = require "dap", require "dapui", require "dap-vscode-js"

dapvs.setup {
  -- adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
  adapters = { "pwa-node"},
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end

dapui.setup()
require("nvim-dap-virtual-text").setup{ enabled = true}

-- keymap

vim.keymap.set("n", "<leader>do", function()
  dapui.open()
end)
vim.keymap.set("n", "<leader>dC", function()
  dapui.close()
end)

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
