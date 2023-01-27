local status, packer = pcall(require, "packer")
if not status then
  print "Packer is not installed"
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use "lewis6991/impatient.nvim"
  -- important: makesure before lspconfig
  use {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  }

  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim" -- Common utilities
  use "kyazdani42/nvim-web-devicons" -- File icons
  use { "fgheng/winbar.nvim" }

  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"

  -- lsp
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig" -- LSP

  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "RRethy/vim-illuminate"

  -- format
  use "jose-elias-alvarez/null-ls.nvim" -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use "MunifTanjim/prettier.nvim" -- Prettier plugin for Neovim's built-in LSP client

  -- complete
  use "hrsh7th/nvim-cmp" -- Completion
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "saadparwaiz1/cmp_luasnip" -- lua snippet completions
  use {
    "petertriho/cmp-git",
    config = function()
      require("cmp_git").setup {}
    end,
  }

  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  --tree-sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      require("nvim-treesitter.install").update { with_sync = true }
    end,
  }
  use "nvim-treesitter/playground"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "nvim-treesitter/nvim-treesitter-context"

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

  -- git
  use "tpope/vim-fugitive"
  use "junegunn/gv.vim"
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {}
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

  use {
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope-dap.nvim",
  }
  use { "jbyuki/one-small-step-for-vimkind", module = "osv" }
  use { "mxsdev/nvim-dap-vscode-js" }
  use {
    "microsoft/vscode-js-debug",
    run = "npm install --legacy-peer-deps && npm run compile",
  }

  -- ft
  use "b0o/schemastore.nvim"
  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  }

  -- language
  use "rust-lang/rust.vim"

  -- utils
  use {
    "andymass/vim-matchup",
    setup = function()
      -- may set any options here
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup { disable_filetype = { "TelescopePrompt", "vim" } }
    end,
  }
  use "windwp/nvim-ts-autotag"
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {}
    end,
  }
  use "nvim-lualine/lualine.nvim" -- Statusline
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {}
    end,
  }
  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  }
  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
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

  -- colorschema
  use {
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" },
  }
  use "folke/tokyonight.nvim"
  use "EdenEast/nightfox.nvim"
  use "sainnhe/everforest"
end)
