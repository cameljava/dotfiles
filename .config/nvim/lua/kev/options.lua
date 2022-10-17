vim.cmd "autocmd!"

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.title = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect", "preview" }
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.pumheight = 10
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.wildignorecase = true
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.smartindent = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 800
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.shortmess:append "c"
-- macos specific
vim.opt.clipboard:append "unnamedplus"

-- Undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[4:0m"]]
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

vim.cmd "let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]"

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

local _G = vim.g

_G.mapleader = ","
_G.maplocalleader = " "

_G.loaded_perl_provider = 0
_G.loaded_ruby_provider = 0
_G.python3_host_prog = "$HOME/.pyenv/shims/python3"

--[[
  colorcolumn = "99999", -- fixes indentline for now TODO copy from lunarvim not sure about this
  showtabline = 2, -- always show tabs
  tabstop = 2, -- insert 2 spaces for a tab
  timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- only turn virtualedit on while do diagram editor, otherwise will causing issue while doing yy yank highlight etc.
  -- virtualedit = "all", -- allow cursor to pass last charactor, much easier to create table, etc in md
  -- guifont = "monospace:h17", -- the font used in graphical neovim applications
--]]

-- disable below two lines, lua filetype seems auto detected.
--  _G.do_filetype_lua = 1
--  _G.did_load_filetypes = 0
