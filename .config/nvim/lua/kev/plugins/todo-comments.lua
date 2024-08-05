-- Highlight todo, notes, etc in comments
-- TODO: show todo sign
-- HACK: show hack sign
-- FIX: show FIX sign
-- NOTE: show NOTE sign
-- PERF: show PERF sign
-- TEST: show TEST sign
-- WARN: show WARN sign
return {
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = true } },
}
-- vim: ts=2 sts=2 sw=2 et
