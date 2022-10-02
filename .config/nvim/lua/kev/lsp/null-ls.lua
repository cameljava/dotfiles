local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion.spell

null_ls.setup({
	debug = true,
  -- on_attach = function(client, bufnr)
  --   local bufcmd = vim.api.nvim_buf_create_user_command
  --
  --   local format = function()
  --     local params = vim.lsp.util.make_formatting_params({})
  --     client.request('textDocument/formatting', params, nil, bufnr)
  --   end
  --
  --   if client.server_capabilities.documentFormattingProvider then
  --     bufcmd(bufnr, 'NullFormat', format, {desc = 'Format using null-ls'})
  --   end
  -- end,
	sources = {
		formatting.prettier,
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black,
		formatting.stylua,
		diagnostics.eslint,
		-- diagnostics.flake8
    completion.spell,
	},
})
