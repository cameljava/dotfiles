return {
  {
    'tpope/vim-surround',
    dependencies = { 'tpope/vim-repeat' }, -- Recommended for full dot-repeat support
    lazy = false,                          -- Load immediately
    config = function()
      -- Optional configuration can be added here
    end
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, noremap = true, silent = false, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        sh = { 'shfmt' },
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        go = { 'goimports', 'gofmt' },
        -- You can use a function here to determine the formatters dynamically
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { 'prettier', 'prettierd' } },
        typescript = { { 'prettier', 'prettierd' } },
        html = { { 'prettier', 'prettierd' } },
        css = { { 'prettier', 'prettierd' } },
        markdown = { { 'prettier', 'prettierd' } },
        java = { { 'google-java-format' } },
        sql = { { 'sqlfluff', 'pg_format' } },
        json = {
          function()
            return {
              exe = "jq",
              args = { "." },
              stdin = true,
            }
          end,
        },
        yaml = {
          function()
            return {
              exe = "jq",
              args = { "." },
              stdin = true,
            }
          end,
        },
        xml = { 'xmllint' },
        -- Use the "*" filetype to run formatters on all filetypes.
        -- ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
    },
    config = function()
      require('conform').setup {}
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_format = "fallback", range = range })
      end, { range = true })
      vim.api.nvim_create_user_command('FormatDisable', function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
