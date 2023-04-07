local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local opts_show = { noremap = true, silent = false }

keymap.set("n", "x", '"_x', opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Delete a word backwards
-- keymap.set("n", "dw", 'vb"_d', opts)

-- Select all ? conflict with my tmux leader key
-- keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set("n", "te", ":tabedit", opts)
-- Split window
keymap.set("n", "sp", ":split<Return><C-w>w", opts)
keymap.set("n", "sv", ":vsplit<Return><C-w>w", opts)
-- Move window
keymap.set("n", "<Space>", "<C-w>w", opts)
keymap.set("", "sh", "<C-w>h", opts)
keymap.set("", "sk", "<C-w>k", opts)
keymap.set("", "sj", "<C-w>j", opts)
keymap.set("", "sl", "<C-w>l", opts)

-- Resize window
keymap.set("n", "<a-left>", "<C-w><", opts)
keymap.set("n", "<a-right>", "<C-w>>", opts)
keymap.set("n", "<a-up>", "<C-w>+", opts)
keymap.set("n", "<a-down>", "<C-w>-", opts)

keymap.set("i", "jj", "<Esc>:update<Cr>", opts_show)
keymap.set("n", ",,", ":", opts_show)
keymap.set("n", "ss", ":update<Cr>", opts_show)

keymap.set("n", "<BS>", ":nohlsearch<Cr>", opts_show)

keymap.set("n", "<leader>q", ":q<Cr>", opts_show)

-- press * to search for the term under the cursor or a visual selection and
-- then press a key below to replace all instances of it in the current file.

keymap.set("n", "<leader>r", ":%s///g<Left><Left>", opts)
keymap.set("n", "<leader>cr", ":%s///gc<Left><Left><left>", opts)

-- To search for visually selected text
keymap.set("v", "//", "y/\\V<c-r>=escape(@\",'/\\')<cr><cr>", opts)

-- leader p to paste last copied
keymap.set("n", "<leader>p", '"0p', opts)
keymap.set("n", "<leader>P", '"0P', opts)

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Stay in visual mode when indent
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)

-- plugins
keymap.set("n", "<leader>m", ":TZFocus<cr>", opts)
keymap.set("n", "<leader>n", ":TZAtaraxis<cr>", opts)
