local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use) -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
  use { "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"

  -- Colorschemes
  use "EdenEast/nightfox.nvim"
  use "folke/tokyonight.nvim"
  use "lunarvim/darkplus.nvim"
  use "mhartington/oceanic-next"
  use "arcticicestudio/nord-vim"
  use "altercation/vim-colors-solarized"
  use "morhetz/gruvbox"
  use "sainnhe/everforest"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/cmp-nvim-lsp-signature-help"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  use "b0o/schemastore.nvim"

  -- Telescope
  use "sharkdp/fd"

  use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-node-modules.nvim"
  use "LinArcX/telescope-env.nvim"
  use "LinArcX/telescope-command-palette.nvim"
  use "cljoly/telescope-repo.nvim"

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" }

  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "nvim-treesitter/playground"

  --fzf
  use "junegunn/fzf"
  use "junegunn/fzf.vim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  use "junegunn/gv.vim"

  -- markdown
  use { "ellisonleao/glow.nvim" }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }
  use "vim-pandoc/vim-pandoc"
  use "vim-pandoc/vim-pandoc-syntax"

  -- text object
  use "wellle/targets.vim"
  use "junegunn/vim-easy-align"
  use "kylechui/nvim-surround"

  -- test
  use "klesh/nvim-runscript"
  use "diepm/vim-rest-console"
  -- utils
  use "szw/vim-maximizer"
  use "tyru/open-browser.vim"
  use "norcalli/nvim-colorizer.lua"
  use "KabbAmine/vCoolor.vim"
  use "dyng/ctrlsf.vim"
  use "vimwiki/vimwiki"
  use "christoomey/vim-tmux-navigator"
  use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)