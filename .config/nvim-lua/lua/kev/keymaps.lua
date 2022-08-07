local opts = { noremap = true, silent = true }

local opts_noremap = { noremap = true }
-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--  ------------------------------------------ Common keymap  --------------------------------------------------

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

-- save project session
keymap("n", "<space>s", ":mks!<cr>", opts_noremap)

keymap("n", "<c-s>", ":wa<cr>", opts_noremap)

-- search shortcuts

-- press * to search for the term under the cursor or a visual selection and
-- then press a key below to replace all instances of it in the current file.

keymap("n", "<leader>r", ":%s///g<Left><Left>", opts_noremap)
keymap("n", "<leader>cr", ":%s///gc<Left><Left><left>", opts_noremap)

-- To search for visually selected text
keymap("v", "//", "y/\\V<c-r>=escape(@\",'/\\')<cr><cr>", opts)

--  ----------------------------------------------- Normal Mode ----------------------------------------------------

keymap("n", "<leader>w", "<cmd>update<cr>", opts)
keymap("n", "<space>w", "<cmd>write<cr>", opts)

-- edit config file
keymap("n", "<leader>eb", "<cmd>vs ~/.bashrc<cr>", opts)
keymap("n", "<leader>en", "<cmd>vs ~/.config/nvim/init.lua<cr>", opts)
keymap("n", "<leader>ev", "<cmd>vs ~/.vimrc<cr>", opts)
keymap("n", "<leader>et", "<cmd>vs ~/.config/tmux/tmux.conf<cr>", opts)
keymap("n", "<leader>es", "<cmd>vs ~/scratch.txt<cr>", opts)

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
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- ---------------------------------------------- Insert Mode ----------------------------------------------------
-- Press jj fast to exit insert mode
keymap("i", "jj", "<ESC>", opts)

-- ----------------------------------------------- Visual Mode ------------------------------------------------------
-- Stay in visual mode when indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Delete current visual selection and dump in black hole buffer before pasting
-- Used when you want to paste over something without it getting copied to
-- Vim's default buffer
keymap("v", "<c-v>", '"_d"0P', opts_noremap)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- ---------------------------------------------- Terminal Mode -----------------------------------------------------
-- ---------------------------------------------- Command Mode -----------------------------------------------------
-- Allows you to save files you opened without write permissions via sudo
keymap("c", "w!!", ":w !sudo tee %", opts)

-- --------------------------------------------------------------- --------------------------------------------------
-- ---------------------------------------------- plugins keymap --------------------------------------------------

-- junegunn vim easy align
-- " Start interactive EasyAlign in visual mode (e.g. vipga)
keymap("x", "ga", "<Plug>(EasyAlign)", opts)
-- " Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap("n", "ga", "<Plug>(EasyAlign)", opts)
