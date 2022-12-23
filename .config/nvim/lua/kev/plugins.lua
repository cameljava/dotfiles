local status, packer = pcall(require, "packer")
if not status then
  print "Packer is not installed"
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "lewis6991/impatient.nvim"

  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim" -- Common utilities
  use "kyazdani42/nvim-web-devicons" -- File icons

  -- lsp
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig" -- LSP
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "folke/neodev.nvim"
  use "RRethy/vim-illuminate"

  -- complete
  use "hrsh7th/nvim-cmp" -- Completion
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "saadparwaiz1/cmp_luasnip" -- lua snippet completions

  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "MunifTanjim/prettier.nvim" -- Prettier plugin for Neovim's built-in LSP client

  --tree-sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
  }

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "LinArcX/telescope-env.nvim"
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { "kkharji/sqlite.lua", module = "sqlite" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("neoclip").setup()
    end,
  }
  use {
    "dhruvmanila/telescope-bookmarks.nvim",
    tag = "*",
    requires = {
      "kkharji/sqlite.lua",
    },
  }

  -- utils
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"
  use "norcalli/nvim-colorizer.lua"
  use "nvim-lualine/lualine.nvim" -- Statusline
  use "akinsho/nvim-bufferline.lua"
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {}
    end,
  }

  -- test
  use "akinsho/toggleterm.nvim"
  use "vim-test/vim-test"
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/neotest-plenary",
      "haydenmeade/neotest-jest",
    },
  }

  -- ft
  use "b0o/schemastore.nvim"
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  }

  -- comment
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        -- ignores empty lines
        ignore = "^$",
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"

  -- colorschema
  use {
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" },
  }
  use "folke/tokyonight.nvim"
end)
