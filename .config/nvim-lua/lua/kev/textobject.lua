-- <silent>	Don’t echo the Ex-command executed in the command-line window.
-- <c-u>	Delete everything already written in COMMAND-LINE mode (like the selection markers '<,'> for example).
-- normal!	This Ex-command allow executing NORMAL mode keystrokes.
-- $v^	Go to the end of the line, switch to VISUAL mode, and select till the beginning of the line (without the eventual white spaces).

-- TODO  default s seems working fine with surround

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("o", "il", ":<c-u>normal! $v^<cr>", opts)
keymap("x", "il", ":<c-u>normal! $v^<cr>", opts)

keymap("o", "al", ":<c-u>normal! $v0<cr>", opts)
keymap("x", "al", ":<c-u>normal! $v0<cr>", opts)
