local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local opts_show = { noremap = true, silent = false }

keymap.set("n", "x", '"_x', opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>", opts)
keymap.set("n", "-", "<C-x>", opts)

-- Delete a word backwards
-- keymap.set("n", "dw", 'vb"_d', opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

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
keymap.set("n", "<C-w><left>", "<C-w><", opts)
keymap.set("n", "<C-w><right>", "<C-w>>", opts)
keymap.set("n", "<C-w><up>", "<C-w>+", opts)
keymap.set("n", "<C-w><down>", "<C-w>-", opts)

keymap.set("i", "jj", "<Esc>:update<Cr>", opts)
keymap.set("n", ",,", ":", opts_show)
keymap.set("n", "ss", ":update<Cr>", opts)

keymap.set("n", "<leader>q", ":q<Cr>", opts)
