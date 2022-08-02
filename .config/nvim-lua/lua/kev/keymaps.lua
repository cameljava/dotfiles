local opts = { noremap = true, silent = true }

local opts_noremap = { noremap = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Common mode applied in multi Modes

-- swap : and ; to save your hands
keymap("n", ":", ";", opts_noremap)
keymap("n", ";", ":", opts_noremap)

keymap("v", ":", ";", opts_noremap)
keymap("v", ";", ":", opts_noremap)

keymap("x", ":", ";", opts_noremap)
keymap("x", ";", ":", opts_noremap)

keymap("n", "<leader>s", ":sp<cr>", opts)
keymap("n", "<leader>v", ":vsp<cr>", opts)

keymap("n", "<BS>", ":nohlsearch<cr>", opts)

-- Normal --

keymap("n", "<leader>w", "<cmd>update<cr>", opts)

-- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout
-- emoves the file from the buffer list, clears its options, variables and mappings. However, it remains in the jumplist, so Ctrl-o takes you back and reopens the file.
-- If that's not what you want, use :bwipeout or Bbye's equivalent :Bwipeout
keymap("n", "<leader>x", "<cmd>Bdelete<cr>", opts)

-- leader p to paste last copied
keymap("n", "<leader>p", '"0p', opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better window navigation
-- keymap("n", "<leader>h", "<C-w>h", opts)
-- keymap("n", "<leader>j", "<C-w>j", opts)
-- keymap("n", "<leader>k", "<C-w>k", opts)
-- keymap("n", "<leader>l", "<C-w>l", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down TODO seems not working
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert
-- Press jj fast to exit insert mode
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Delete current visual selection and dump in black hole buffer before pasting
-- Used when you want to paste over something without it getting copied to
-- Vim's default buffer
keymap("v", "<c-v>", '"_d"0P', opts_noremap)

-- Move text up and down TODO seems not working
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --

-- Better terminal navigation TODO sees not working
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- plugins

-- junegunn vim easy align
-- " Start interactive EasyAlign in visual mode (e.g. vipga)
keymap("x", "ga", "<Plug>(EasyAlign)", opts)

-- " Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap("n", "ga", "<Plug>(EasyAlign)", opts)
